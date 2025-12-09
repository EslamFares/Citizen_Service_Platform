import 'dart:developer';

import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/send_service/data/model/send_file_model.dart';
import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api/api_consumer.dart';

class SendServiceRepo {
  final ApiConsumer api;
  SendServiceRepo(this.api);
  //=====================

  Future<Either<String, ServiceRequirementModel>> getServiceRequirement({
    required int serviceCategoryId,
  }) async {
    try {
      // await Future.delayed(AppSizes.durDummyLoading2s);
      // ServiceRequirementModel model = dummyServiceRequirementModel;

      final res = await api.get(
        path: ApiConsts.getServiceDetails,
        query: {"serviceId": serviceCategoryId},
      );
      ServiceRequirementModel model = ServiceRequirementModel.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }

  /*================== sendService =================*/
  Future<Either<String, String>> sendService({
    required List<SendFileModel> filesAttachment,
    required bool isPaid,
    required int? serviceId,
  }) async {
    try {
      //todo  TODO: send  multi list files
      // filesAttachment.removeLast();
      //send multi list in FormData
      final formData = FormData();
      formData.fields.add(MapEntry("ServiceId", serviceId.toString()));
      formData.fields.add(MapEntry("IsPaid", isPaid.toString()));

      for (var f in filesAttachment) {
        formData.fields.add(MapEntry("AttachmentTypeId", f.id.toString()));
      }

      for (var f in filesAttachment) {
        formData.files.add(
          MapEntry("Attachments", await MultipartFile.fromFile(f.file!.path)),
        );
      }
      for (var f in formData.fields) {
        log("FIELD >>> ${f.key} = ${f.value}");
      }

      for (var f in formData.files) {
        log("FILE >>> ${f.key} = ${f.value.filename}");
      }

      final res = await api.post(
        responseType: ResponseType.json,
        path: ApiConsts.sendServiceRequest,
        contentType: 'multipart/form-data',
        data: formData,
      );
      logPro.w('res: $res');
      await Future.delayed(AppSizes.durDummyLoading2s);
      return Right("success");
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
  //   Map<String, dynamic> dataFile = {'file': await MultipartFile.fromFile(file.path)};
  //   return await api.post(
  //     responseType: ResponseType.json,
  //     path: ApiConsts.uploadImage,
  //     isFormData: true,
  //     data: {
  //       "projectId": projectId,
  //       ...dataFile,
  //     },
  //   );