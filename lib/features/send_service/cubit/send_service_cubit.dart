import 'dart:io';

import 'package:citizen_service_platform/core/utils/extentions/string_extensions.dart';
import 'package:citizen_service_platform/features/send_service/data/model/send_file_model.dart';
import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/locale_keys.g.dart';
import '../../../core/network/errors/server_failure.dart';
import '../../../core/utils/log/logger.dart';
import '../data/repo/send_service_repo.dart';

part 'send_service_state.dart';

class SendServiceCubit extends Cubit<SendServiceState> {
  SendServiceCubit(this.sendServiceRepo) : super(SendServiceInitial());
  static SendServiceCubit get(context) => BlocProvider.of(context);
  final SendServiceRepo sendServiceRepo;
  //===========================================
  @override
  void emit(SendServiceState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init({
    required int serviceCategoryId,
    required String? serviceCategoryName,
  }) async {
    setServiceCategoryIdName(
      serviceCategoryID: serviceCategoryId,
      serviceCategoryNameCome: serviceCategoryName,
    );
    await getServiceRequirement();
  }

  //===========================================
  int? serviceCategoryId;
  String? serviceCategoryName;
  setServiceCategoryIdName({
    required int serviceCategoryID,
    required String? serviceCategoryNameCome,
  }) {
    serviceCategoryId = serviceCategoryID;
    serviceCategoryName = serviceCategoryNameCome;
    emit(SendServiceInitial());
  }

  //==============Upload Files==========
  List<SendFileModel> filesAttachment = [];
  deleteFile(int id) {
    try {
      filesAttachment.removeWhere((element) => element.id == id);
      emit(SelectFilesState());
      checkValidateAllFilesDone();
    } catch (e) {
      logPro.e(e.toString());
    }
  }

  bool isFilesSelected(int? id) {
    if (id == null) return false;
    String? path;
    path = filesAttachment.firstWhereOrNull((e) => e.id == id)?.file?.path;
    return path.isNotNullAndNotEmpty;
  }

  _setFile(int id, File file) {
    try {
      if (!filesAttachment.any((element) => element.id == id)) {
        filesAttachment.add(SendFileModel(id: id, file: file));
      } else {
        filesAttachment.firstWhereOrNull((element) => element.id == id)?.file =
            file;
      }
      emit(SelectFilesState());
    } catch (e) {
      logPro.e(e.toString());
    }
  }

  pickFile(int id) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'jpeg',
        'pdf',
        'doc',
        'docx',
        'xlsx',
        'txt',
      ],
    );

    if (result != null && result.files.isNotEmpty) {
      for (var path in result.paths) {
        if (path != null) {
          File file = File(path);
          _setFile(id, file);
        }
      }
    }
    checkValidateAllFilesDone();
  }

  //============================get Service Requirement===============
  ServiceRequirementModel? serviceRequirementModel;
  Future<void> getServiceRequirement() async {
    emit(GetServiceRequirementLoading());
    if (serviceCategoryId == null) {
      logPro.error("serviceCategoryId == null");
      emit(GetServiceRequirementError(LocaleKeys.anErrorOccurred.tr()));
      return;
    }
    final res = await sendServiceRepo.getServiceRequirement(
      serviceId: serviceCategoryId!,
    );
    res.fold(
      (errorMsg) {
        emit(GetServiceRequirementError(errorMsg));
      },
      (model) {
        serviceRequirementModel = model;
        emit(GetServiceRequirementSuccess());
      },
    );
  }

  //========================send Service==============================
  Set<int> unValidatedFiles = {};
  bool isFileValidated(int? id) => !unValidatedFiles.contains(id);
  checkValidateAllFilesDone() {
    List<ServiceAttachmentType> filesRequired =
        serviceRequirementModel?.data?.serviceAttachmentTypes ?? [];
    if (filesRequired.isEmpty) {
      return true;
    } else {
      for (int i = 0; i < filesRequired.length; i++) {
        String? path = filesAttachment
            .firstWhereOrNull((element) => element.id == filesRequired[i].id)
            ?.file
            ?.path;
        if (path.isNullOrEmpty) {
          unValidatedFiles.add(filesRequired[i].id!);
        } else {
          unValidatedFiles.remove(filesRequired[i].id);
        }
      }
      emit(SelectFilesState());
      return unValidatedFiles.isEmpty;
    }
  }

  Future<void> sendService() async {
    emit(SendServiceLoading());
    try {
      final res = await sendServiceRepo.sendService(filesAttachment);
      debugPrint('res: $res');
      emit(SendServiceSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        logPro.error("ServerFailure : ${e.toString()}");
        emit(SendServiceError(e.msgApi));
      } else {
        logPro.error("e.toString() : ${e.toString()}");
        emit(SendServiceError(LocaleKeys.anErrorOccurred.tr()));
      }
    }
  }
}
