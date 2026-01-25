import 'dart:async';

import 'package:citizen_service_platform/core/utils/extentions/string_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/locale_keys.g.dart';
import '../data/repo/verify_otp_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this.verifyOtpRepo) : super(VerifyOtpInitial());
  static VerifyOtpCubit get(context) => BlocProvider.of(context);
  final VerifyOtpRepo verifyOtpRepo;
  //===========================================
  @override
  void emit(VerifyOtpState state) {
    if (!isClosed) super.emit(state);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  //===========================================
  Future<void> init({
    required String phoneNum,
    required bool autoSendOtpWhenOpen,
  }) async {
    setPhoneNumber(nationalIdCome: phoneNum);
    resendOtp(sendOtpToUser: autoSendOtpWhenOpen);
  }

  //===========================================
  Future<void> resendOtp({bool sendOtpToUser = true}) async {
    if (sendOtpToUser) {
      bool isSent = await sendOtp(nationalId: nationalId!);
      if (isSent) {
        startTimer();
      }
    } else {
      startTimer();
    }
  }

  //===========================================
  String? nationalId;
  setPhoneNumber({required String nationalIdCome}) {
    nationalId = nationalIdCome;
    emit(SetPhoneNumber());
  }

  //==========================================
  String time = '01:00';
  Timer? _timer;
  int _start = 60;

  bool get isTimerFinished => _start == 0;

  void startTimer() {
    _start = 60;
    time = '01:00';
    emit(SetTimer());
    _timer?.cancel();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        timer.cancel();
        // time = '--:--';
        emit(SetTimer());
      } else {
        _start--;
        time = "00:${_start.toString().padLeft(2, '0')}";
        emit(SetTimer());
      }
    });
  }

  //==========================================
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  //======================================================
  Future<bool> sendOtp({required String nationalId}) async {
    emit(SentOtpLoading());

    final res = await verifyOtpRepo.sendOtp(nationalId: nationalId);
    bool isSent = false;
    res.fold(
      (l) {
        emit(SentOtpError(l));
        isSent = false;
      },
      (model) {
        if (model.isSuccess == true) {
          emit(
            SentOtpSuccess(
              msg: model.data?.message ?? LocaleKeys.sentSuccessfully.tr(),
            ),
          );
          isSent = true;
        } else {
          emit(
            SentOtpError(
              model.data?.message ?? LocaleKeys.anErrorOccurred.tr(),
            ),
          );
          isSent = false;
        }
      },
    );
    return isSent;
  }

  //======================================================
  Future<void> verifyOtp({required String? otp}) async {
    emit(VerifyOtpLoading());
    if (nationalId.isNullOrEmpty || otp.isNullOrEmpty) {
      emit(VerifyOtpError(LocaleKeys.anErrorOccurred.tr()));
      return;
    }

    final res = await verifyOtpRepo.verifyOtp(
      nationalId: nationalId!,
      otp: otp!,
    );
    res.fold((l) => emit(VerifyOtpError(l)), (r) => emit(VerifyOtpSuccess()));
  }
}
