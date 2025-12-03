import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/menu_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../const/locale_keys.g.dart';
import '../../../core/network/errors/server_failure.dart';
import '../../../core/utils/log/logger.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepo) : super(MenuInitial());
  static MenuCubit get(context) => BlocProvider.of(context);
  final MenuRepo menuRepo;
  //===========================================
  @override
  void emit(MenuState state) {
    if (!isClosed) super.emit(state);
  }

//===========================================
  Future<void> init() async{
    await go();
  }
  
//======================================================
  Future<void>  go() async {
     emit(MenuLoading()); 
    try {
      final res = await menuRepo.go();
      debugPrint('res: $res');
     emit(MenuSuccess()); 
    } catch (e) {
      if (e is ServerFailure) {
        logPro.error("ServerFailure : ${e.toString()}");
         emit(MenuError(e.msgApi)); 
      } else {
        logPro.error("e.toString() : ${e.toString()}");
         emit(MenuError(LocaleKeys.anErrorOccurred.tr())); 
      }
    }
  }
}