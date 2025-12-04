import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/features/service_categories/data/dummy_data/dummy_service_categories_model.dart';
import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class ServiceCategoriesRepo {
  final ApiConsumer api;
  ServiceCategoriesRepo(this.api);
  //=====================
  Future<Either<String, ServiceCategoriesModel>> getServiceCategories({
    required int serviceId,
  }) async {
    try {
      // final res = await api.get(path: 'users');
      // debugPrint('res: $res');
      await Future.delayed(AppSizes.durDummyLoading2s);
      ServiceCategoriesModel model = dummyServiceCategoriesModel;
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
