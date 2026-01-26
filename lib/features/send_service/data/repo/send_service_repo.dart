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
      final formData = FormData.fromMap({
        "ServiceId": serviceId.toString(),
        "IsPaid": isPaid.toString(),
        // Use map to handle AttachmentTypeIds in one go
        "AttachmentTypeId": filesAttachment
            .map((f) => f.id.toString())
            .toList(),
      });

      // 1. Process files in PARALLEL for better speed
      final fileEntries = await Future.wait(
        filesAttachment.map((f) async {
          return MapEntry(
            "Attachments",
            await MultipartFile.fromFile(
              f.file!.path,
              filename: f.file!.path.split('/').last,
            ),
          );
        }),
      );

      formData.files.addAll(fileEntries);

      // 2. Optimized Logging (Optional: Remove in production)
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

      // 3. Simplified Response Handling
      String successMsg = "Success";
      try {
        final model = SuccessGlobalModel.fromMap(res);
        if (model.message?.isNotEmpty ?? false) {
          successMsg = model.message!;
        }
      } catch (_) {}

      logProSimple.s("successMsg : $successMsg");
      return Right(successMsg);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
