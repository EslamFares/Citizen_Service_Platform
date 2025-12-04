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
  ServiceCategoriesModel? serviceCategoriesModel;
  Future<void> getServiceCategories() async {
    emit(ServiceCategoriesLoading());
    if (serviceId == null) {
      logPro.error("serviceId == null");
      emit(ServiceCategoriesError(LocaleKeys.anErrorOccurred.tr()));
      return;
    }
    final res = await serviceCategoriesRepo.getServiceCategories(
      serviceId: serviceId!,
    );
    res.fold(
      (errorMsg) {
        emit(ServiceCategoriesError(errorMsg));
      },
      (user) {
        serviceCategoriesModel = user;
        emit(ServiceCategoriesSuccess());
      },
    );
  }
}
