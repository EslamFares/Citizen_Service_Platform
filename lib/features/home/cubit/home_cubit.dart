import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/home_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../const/locale_keys.g.dart';
import '../../../core/network/errors/server_failure.dart';
import '../../../core/utils/log/logger.dart';

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
  Future<void> init() async{
    await go();
  }
  
//======================================================
  Future<void>  go() async {
     emit(HomeLoading()); 
    try {
      final res = await homeRepo.go();
      debugPrint('res: $res');
     emit(HomeSuccess()); 
    } catch (e) {
      if (e is ServerFailure) {
        logPro.error("ServerFailure : ${e.toString()}");
         emit(HomeError(e.msgApi)); 
      } else {
        logPro.error("e.toString() : ${e.toString()}");
         emit(HomeError(LocaleKeys.anErrorOccurred.tr())); 
      }
    }
  }
}