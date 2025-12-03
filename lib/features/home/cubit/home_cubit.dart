import 'package:citizen_service_platform/features/home/data/model/home_model.dart';
import 'package:citizen_service_platform/features/login/data/model/user_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  //===========================================
  @override
  void emit(HomeState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init() async {
    await UserHelper.getUserModel();
    emit(HomeInitial());
    await getServices();
  }

  //======================================================
  ServicesModel? servicesModel;
  Future<void> getServices() async {
    emit(HomeLoading());

    final res = await homeRepo.getServices();
    res.fold(
      (errorMsg) {
        emit(HomeError(errorMsg));
      },
      (model) {
        servicesModel = model;
        emit(HomeSuccess());
      },
    );
  }
}
