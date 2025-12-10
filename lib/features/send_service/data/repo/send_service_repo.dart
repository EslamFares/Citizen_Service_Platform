import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/send_service/data/model/send_file_model.dart';
import 'package:citizen_service_platform/features/send_service/data/model/service_requirement_model.dart';
import 'package:citizen_service_platform/features/send_service/data/model/success_global_model.dart';
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
        logProSimple.w("FIELD >>> ${f.key} = ${f.value}");
      }

      for (var f in formData.files) {
        logProSimple.w("FILE >>> ${f.key} = ${f.value.filename}");
      }

      final res = await api.post(
        responseType: ResponseType.json,
        path: ApiConsts.sendServiceRequest,
        contentType: 'multipart/form-data',
        data: formData,
      );
      String? successMsg;
      try {
        SuccessGlobalModel model = SuccessGlobalModel.fromMap(res);
        successMsg = model.message;
      } catch (_) {}
      if (successMsg == null || successMsg.isEmpty) {
        successMsg = "Success";
      }
      logProSimple.s("successMsg : $successMsg");
      return Right(successMsg);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
