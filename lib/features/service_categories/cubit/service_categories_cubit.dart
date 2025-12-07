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
  bool isNoMorePagination = false;
  int pageNumber = 1;
  ServiceCategoriesModel? serviceCategoriesModel;

  _onRefresh() {
    pageNumber = 1;
    _allList.clear();
    isNoMorePagination = false;
  }

  final List<ServiceCategoryModel> _allList = [];
  Future<void> getServiceCategories({
    bool isRefresh = false,
    bool isPagination = false,
  }) async {
    if (isRefresh) {
      _onRefresh();
      emit(ServiceCategoriesRefresh());
    } else if (isPagination) {
      emit(ServiceCategoriesPagination());
    } else {
      emit(ServiceCategoriesLoading());
    }
    if (serviceId == null) {
      logPro.error("serviceId == null");
      emit(ServiceCategoriesError(LocaleKeys.anErrorOccurred.tr()));
      return;
    }
    final res = await serviceCategoriesRepo.getServiceCategories(
      categoryId: serviceId!,
      pageNumber: pageNumber,
    );
    res.fold(
      (errorMsg) {
        emit(ServiceCategoriesError(errorMsg));
      },
      (modelRes) {
        ServiceCategoriesModel model = modelRes;
        if (model.data?.isNotEmpty ?? false) {
          _allList.addAll(model.data ?? []);
          logPro.green(
            'dataCome : ${model.data?.length} || _allList : ${_allList.length} || pageNumber : $pageNumber',
          );
          pageNumber++;
        } else {
          logger.t(" no more news");
          isNoMorePagination = true;
        }
        serviceCategoriesModel = model.copyWith(data: _allList);

        emit(ServiceCategoriesSuccess());
      },
    );
  }
}
