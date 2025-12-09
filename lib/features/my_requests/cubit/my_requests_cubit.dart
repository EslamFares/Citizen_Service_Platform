import 'package:citizen_service_platform/core/utils/log/logger.dart';
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
  bool isNoMorePagination = false;
  int pageNumber = 1;

  _onRefresh() {
    pageNumber = 1;
    _allList.clear();
    isNoMorePagination = false;
  }

  MyRequestsModel? requestsModel;
  final List<RequestItem> _allList = [];
  Future<void> getRequests({
    bool isRefresh = false,
    bool isPagination = false,
  }) async {
    if (isRefresh) {
      _onRefresh();
      emit(MyRequestsRefresh());
    } else if (isPagination) {
      isNoMorePagination = false;
      emit(MyRequestsPaginate());
    } else {
      emit(MyRequestsLoading());
    }

    final res = await myRequestsRepo.getRequests(pageNumber: pageNumber);
    res.fold(
      (errorMsg) {
        emit(MyRequestsError(errorMsg));
      },
      (modelRes) {
        MyRequestsModel model = modelRes;
        if (model.data?.isNotEmpty ?? false) {
          _allList.addAll(model.data ?? []);
          logPro.green(
            'dataCome : ${model.data?.length} || _allList : ${_allList.length} || pageNumber : $pageNumber',
          );
          pageNumber++;
        } else {
          logger.t("no more news");
          isNoMorePagination = true;
        }
        requestsModel = model.copyWith(data: _allList);
        emit(MyRequestsSuccess());
      },
    );
  }
}
