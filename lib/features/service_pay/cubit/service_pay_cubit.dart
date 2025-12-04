import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/service_pay_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../const/locale_keys.g.dart';
import '../../../core/network/errors/server_failure.dart';
import '../../../core/utils/log/logger.dart';

part 'service_pay_state.dart';

class ServicePayCubit extends Cubit<ServicePayState> {
  ServicePayCubit(this.servicePayRepo) : super(ServicePayInitial());
  static ServicePayCubit get(context) => BlocProvider.of(context);
  final ServicePayRepo servicePayRepo;
  //===========================================
  @override
  void emit(ServicePayState state) {
    if (!isClosed) super.emit(state);
  }

//===========================================
  Future<void> init() async{
    await go();
  }
  
//======================================================
  Future<void>  go() async {
     emit(ServicePayLoading()); 
    try {
      final res = await servicePayRepo.go();
      debugPrint('res: $res');
     emit(ServicePaySuccess()); 
    } catch (e) {
      if (e is ServerFailure) {
        logPro.error("ServerFailure : ${e.toString()}");
         emit(ServicePayError(e.msgApi)); 
      } else {
        logPro.error("e.toString() : ${e.toString()}");
         emit(ServicePayError(LocaleKeys.anErrorOccurred.tr())); 
      }
    }
  }
}