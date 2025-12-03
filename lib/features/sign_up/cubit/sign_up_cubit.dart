import 'package:citizen_service_platform/features/login/data/funcs/save_user_data_after_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/locale_keys.g.dart';
import '../../../core/utils/log/logger.dart';
import '../data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final SignUpRepo signUpRepo;
  //===========================================
  @override
  void emit(SignUpState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  Future<void> init() async {}

  //===========================================
  final formKey = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  TextEditingController nationalId = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController governorate = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  //======================================================
  Future<void> signUp() async {
    emit(SignUpLoading());
    try {
      final res = await signUpRepo.signUp(
        nationalId: int.parse(nationalId.text),
        phoneNumber: phoneNumber.text,
        governorate: governorate.text,
        address: address.text,
        name: name.text,
        password: passwordController.text,
      );
      res.fold(
        (errorMsg) {
          emit(SignUpError(errorMsg));
        },
        (user) async {
          await saveUserDataAfterLogin(
            userModel: user,
            nationalId: int.parse(nationalId.text),
            password: passwordController.text,
          );
          emit(SignUpSuccess());
        },
      );
    } catch (e) {
      logger.e("Error login $e");
      emit(SignUpError(LocaleKeys.anErrorOccurred.tr()));
    }
    // try {
    //   final res = await signUpRepo.signUp(
    //     nationalId: nationalId.text,
    //     phoneNumber: phoneNumber.text,
    //     governorate: governorate.text,
    //     address: address.text,
    //     name: name.text,
    //     password: passwordController.text,
    //   );
    //   debugPrint('res: $res');
    //   emit(SignUpSuccess());
    // } catch (e) {
    //   if (e is ServerFailure) {
    //     logPro.error("ServerFailure : ${e.toString()}");
    //     emit(SignUpError(e.msgApi));
    //   } else {
    //     logPro.error("e.toString() : ${e.toString()}");
    //     emit(SignUpError(LocaleKeys.anErrorOccurred.tr()));
    //   }
    // }
  }
}
