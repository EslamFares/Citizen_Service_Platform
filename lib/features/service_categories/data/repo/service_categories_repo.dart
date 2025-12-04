import 'package:citizen_service_platform/core/network/api/api_consts.dart';
import 'package:citizen_service_platform/core/network/errors/catch_error_message_extension.dart';
import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api/api_consumer.dart';

class ServiceCategoriesRepo {
  final ApiConsumer api;
  ServiceCategoriesRepo(this.api);
  //=====================
  Future<Either<String, ServiceCategoriesModel>> getServiceCategories({
    required int categoryId,
    required int pageNumber,
    int pageSize = 10,
  }) async {
    try {
      // await Future.delayed(AppSizes.durDummyLoading2s);
      // ServiceCategoriesModel model = dummyServiceCategoriesModel;

      final res = await api.get(
        path: ApiConsts.getServiceByCategoryId,
        query: {
          "CategoryId": categoryId,
          "PageNumber": pageNumber,
          "PageSize": pageSize,
        },
      );
      ServiceCategoriesModel model = ServiceCategoriesModel.fromMap(res);
      return Right(model);
    } catch (e) {
      return Left(e.catchErrorMessage());
    }
  }
}
