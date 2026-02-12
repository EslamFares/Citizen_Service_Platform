import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/bloc/state_box.dart';
import '../data/repo/my_request_details_repo.dart';

part 'my_request_details_state.dart';

class MyRequestDetailsCubit extends Cubit<MyRequestDetailsState> {
  MyRequestDetailsCubit(this.myRequestDetailsRepo)
    : super(MyRequestDetailsState.initial());
  static MyRequestDetailsCubit get(context) => BlocProvider.of(context);
  final MyRequestDetailsRepo myRequestDetailsRepo;
  //===========================================
  @override
  void emit(MyRequestDetailsState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init({
    required int? requestId,
    required RequestItem? modelDirect,
  }) async {
    setRequestId(id: requestId);
    if (modelDirect != null) {
      setMyRequestDetailsModelDirect(model: modelDirect);
    } else {
      await getMyRequestDetails();
    }
  }

  //======================================================
  int? requestId;
  setRequestId({required int? id}) => requestId = id;
  //======================================================
  Future<void> setMyRequestDetailsModelDirect({
    required RequestItem model,
  }) async {
    emit(state.copyWith(getMyRequestDetails: StateBox.success(data: model)));
  }

  //======================================================
  Future<void> getMyRequestDetails() async {
    emit(state.copyWith(getMyRequestDetails: StateBox.loading()));
    if (requestId == null) {
      emit(state.copyWith(getMyRequestDetails: StateBox.error()));
      return;
    }
    final res = await myRequestDetailsRepo.getMyRequestDetails();
    res.fold(
      (l) => emit(
        state.copyWith(getMyRequestDetails: StateBox.error(errorMessage: l)),
      ),
      (r) =>
          emit(state.copyWith(getMyRequestDetails: StateBox.success(data: r))),
    );
  }
}
