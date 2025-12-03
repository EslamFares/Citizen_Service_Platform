import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/my_requests_repo.dart';

part 'my_requests_state.dart';

class MyRequestsCubit extends Cubit<MyRequestsState> {
  MyRequestsCubit(this.myRequestsRepo) : super(MyRequestsInitial());
  static MyRequestsCubit get(context) => BlocProvider.of(context);
  final MyRequestsRepo myRequestsRepo;
  //===========================================
  @override
  void emit(MyRequestsState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init() async {
    await getRequests();
  }

  //======================================================
  MyRequestsModel? requestsModel;
  Future<void> getRequests() async {
    emit(MyRequestsLoading());

    final res = await myRequestsRepo.getRequests();
    res.fold(
      (errorMsg) {
        emit(MyRequestsError(errorMsg));
      },
      (model) {
        requestsModel = model;
        emit(MyRequestsSuccess());
      },
    );
  }
}
