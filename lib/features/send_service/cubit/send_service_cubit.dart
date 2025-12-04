import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';
import 'package:easy_localization/easy_localization.dart';
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
  Future<void> sendService() async {
    emit(SendServiceLoading());
    try {
      final res = await sendServiceRepo.sendService();
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
