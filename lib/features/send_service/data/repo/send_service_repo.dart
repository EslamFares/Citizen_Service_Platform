import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/send_service/data/dummy_data/dummy_service_requirement_model.dart';
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
    required int serviceId,
  }) async {
    try {
      // final res = await api.get(path: 'users');
      // debugPrint('res: $res');
      await Future.delayed(AppSizes.durDummyLoading2s);
      ServiceRequirementModel model = dummyServiceRequirementModel;
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }

  /*================== sendService =================*/
  Future<Either<String, String>> sendService(
    List<SendFileModel> filesAttachment,
  ) async {
    try {
      List data = [];
      for (var fileModel in filesAttachment) {
        Map<String, dynamic> dataFile = {
          "id": fileModel.id,
          'file': await MultipartFile.fromFile(fileModel.file!.path),
        };
        data.add(dataFile);
      }
      final res = await api.post(
        responseType: ResponseType.json,
        path: "ApiConsts.uploadImage",
        isFormData: true,
        data: data,
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