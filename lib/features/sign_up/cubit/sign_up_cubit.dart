import 'package:citizen_service_platform/core/shared/funcs/detect_location_helper.dart';
import 'package:citizen_service_platform/features/login/data/funcs/save_user_data_after_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../const/locale_keys.g.dart';
import '../../../core/utils/log/logger.dart';
import '../data/model/branch_model.dart';
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
  Future<void> init() async {
    await getAllBranches();
  }

  //===========================================
  List<BranchModel> branches = [];
  getAllBranches() async {
    emit(GetAllBranchesLoading());
    try {
      final res = await signUpRepo.getAllBranches();
      res.fold(
        (errorMsg) {
          emit(GetAllBranchesError(errorMsg));
        },
        (branchesRes) {
          branches = branchesRes;
          emit(GetAllBranchesSuccess());
        },
      );
    } catch (e) {
      logger.e("Error login $e");
      emit(GetAllBranchesError(LocaleKeys.anErrorOccurred.tr()));
    }
  }

  //===========================================
  final formKey = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  TextEditingController nationalId = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  // TextEditingController governorate = TextEditingController();
  // TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  int? selectedBranchId;
  void selectedBranch(String? id) {
    try {
      if (id == null) return;
      int idNum = int.parse(id);
      selectedBranchId = idNum;
    } catch (e) {
      emit(SignUpError(LocaleKeys.pleaseSelectBranch.tr()));
    }
  }

  //======================================================
  Future<void> signUp() async {
    emit(SignUpLoading());
    if (selectedBranchId == null) {
      emit(SignUpError(LocaleKeys.pleaseSelectBranch.tr()));
      return;
    }
    try {
      await DetectLocationHelper.detectLocation();
      Position? location = DetectLocationHelper.currentLocation;
      if (location == null) {
        emit(SignUpError(LocaleKeys.openLoacationPermission.tr()));
        return;
      }

      final res = await signUpRepo.signUp(
        nationalId: int.parse(nationalId.text),
        phoneNumber: phoneNumber.text,
        branchId: selectedBranchId!,
        // address: address.text,
        name: name.text,
        lat: location.latitude,
        lon: location.longitude,
        password: passwordController.text,
      );
      res.fold(
        (errorMsg) {
          emit(SignUpError(errorMsg));
        },
        (user) async {
          await saveUserDataAfterLogin(
            userModel: user,
            nationalId: nationalId.text,
            password: passwordController.text,
          );
          emit(SignUpSuccess());
        },
      );
    } catch (e) {
      logger.e("Error login $e");
      emit(SignUpError(LocaleKeys.anErrorOccurred.tr()));
    }
  }

  @override
  Future<void> close() {
    nationalId.dispose();
    phoneNumber.dispose();
    // governorate.dispose();
    // address.dispose();
    name.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    return super.close();
  }
}
