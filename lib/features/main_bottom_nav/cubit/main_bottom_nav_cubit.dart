import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/locale_keys.g.dart';
import '../../../core/network/errors/server_failure.dart';
import '../../../core/utils/log/logger.dart';
import '../data/repo/main_bottom_nav_repo.dart';

part 'main_bottom_nav_state.dart';

class MainBottomNavCubit extends Cubit<MainBottomNavState> {
  MainBottomNavCubit(this.mainBottomNavRepo) : super(MainBottomNavInitial());
  static MainBottomNavCubit get(context) => BlocProvider.of(context);
  final MainBottomNavRepo mainBottomNavRepo;
  //===========================================
  @override
  void emit(MainBottomNavState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init() async {}

  //======================================================
  int selectedIndex = 0;
  changeIndex(int index) {
    selectedIndex = index;
    emit(MainBottomNavChangeIndex());
  }

  //======================================================
  Future<void> go() async {
    emit(MainBottomNavLoading());
    try {
      final res = await mainBottomNavRepo.go();
      debugPrint('res: $res');
      emit(MainBottomNavSuccess());
    } catch (e) {
      if (e is ServerFailure) {
        logPro.error("ServerFailure : ${e.toString()}");
        emit(MainBottomNavError(e.msgApi));
      } else {
        logPro.error("e.toString() : ${e.toString()}");
        emit(MainBottomNavError(LocaleKeys.anErrorOccurred.tr()));
      }
    }
  }
}
