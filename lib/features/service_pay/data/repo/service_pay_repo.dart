import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class ServicePayRepo {
  final ApiConsumer api;
  ServicePayRepo(this.api);
  //=====================
  Future<Either<String, String>> payServices() async {
    try {
      // final res = await api.get(path: 'users');
      // debugPrint('res: $res');
      await Future.delayed(AppSizes.durDummyLoading2s);
      return Right("success");
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
