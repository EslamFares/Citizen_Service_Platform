import 'package:citizen_service_platform/features/my_requests/data/dummy_data/dummy_request.dart';
import 'package:citizen_service_platform/features/my_requests/data/model/my_requests_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/locale_keys.g.dart';
import '../../../core/network/errors/server_failure.dart';
import '../../../core/utils/log/logger.dart';
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
    await go();
  }

  //======================================================
  MyRequestsModel requestsModel = dummyMyRequestsModel;
  Future<void> go() async {
    emit(MyRequestsLoading());
    try {
      final res = await myRequestsRepo.go();
      debugPrint('res: $res');
      emit(MyRequestsSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        logPro.error("ServerFailure : ${e.toString()}");
        emit(MyRequestsError(e.msgApi));
      } else {
        logPro.error("e.toString() : ${e.toString()}");
        emit(MyRequestsError(LocaleKeys.anErrorOccurred.tr()));
      }
    }
  }
}
