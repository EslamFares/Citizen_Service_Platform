import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/locale_keys.g.dart';
import '../data/repo/service_categories_repo.dart';

part 'service_categories_state.dart';

class ServiceCategoriesCubit extends Cubit<ServiceCategoriesState> {
  ServiceCategoriesCubit(this.serviceCategoriesRepo)
    : super(ServiceCategoriesInitial());
  static ServiceCategoriesCubit get(context) => BlocProvider.of(context);
  final ServiceCategoriesRepo serviceCategoriesRepo;
  //===========================================
  @override
  void emit(ServiceCategoriesState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================

  Future<void> init({required int serviceId}) async {
    setServiceId(serviceID: serviceId);
    await getServiceCategories();
  }

  //===========================================
  int? serviceId;
  setServiceId({required int serviceID}) {
    serviceId = serviceID;
  }

  //======================================================
  bool isNoMorePaggination = false;
  int pageNumber = 1;
  ServiceCategoriesModel? serviceCategoriesModel;
  final List<ServiceCategoryModel> _allProjectsList = [];
  Future<void> getServiceCategories({
    bool isRefresh = false,
    bool isPaggination = false,
  }) async {
    if (isRefresh) {
      emit(ServiceCategoriesRefresh());
    } else if (isPaggination) {
      emit(ServiceCategoriesPaggination());
    } else {
      emit(ServiceCategoriesLoading());
    }
    if (serviceId == null) {
      logPro.error("serviceId == null");
      emit(ServiceCategoriesError(LocaleKeys.anErrorOccurred.tr()));
      return;
    }
    final res = await serviceCategoriesRepo.getServiceCategories(
      serviceId: serviceId!,
      pageNumber: pageNumber,
    );
    res.fold(
      (errorMsg) {
        emit(ServiceCategoriesError(errorMsg));
      },
      (modelRes) {
        ServiceCategoriesModel model = modelRes;
        if (model.data?.isNotEmpty ?? false) {
          pageNumber++;
          _allProjectsList.addAll(model.data ?? []);
          logPro.green('projectsModelRes.data : ${model.data?.length}');
          logger.t("_allProjectsList : ${_allProjectsList.length}");
        } else {
          logger.t(" no more news");
          isNoMorePaggination = true;
          if (isPaggination) {
            emit(NewsNoMorePaggination());
          }
        }
        serviceCategoriesModel = model.copyWith(data: _allProjectsList);

        emit(ServiceCategoriesSuccess());
      },
    );
  }
}
