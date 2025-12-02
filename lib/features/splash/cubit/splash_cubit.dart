import 'dart:io';

import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/network/errors/server_failure.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/splash/data/func/is_app_version_up_to_dated.dart';
import 'package:citizen_service_platform/features/splash/data/model/app_version_model.dart';
import 'package:citizen_service_platform/features/splash/data/repo/splash_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.repo) : super(SplashInitial());
  static SplashCubit get(BuildContext context) => BlocProvider.of(context);
  //===========================================

  @override
  void emit(SplashState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  final SplashRepo repo;
  //===========================================
  Future<void> init() async {
    await getCheckIsAppVersionUptodated();
  }

  //===========================================
  UpdateAppModel? appVersionModelApi;

  Future<void> getCheckIsAppVersionUptodated() async {
    emit(SplshGetAppVersionApiLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    //$ for stop in splash
    // if (1 == 1) {
    //    emit(SplshGetAppVersionApiSuccess(checkIsAppVersionUptodated: false));
    // return false;
    // }
    //$---------------------------
    try {
      var res = await repo.getAppVersionApi();
      appVersionModelApi = UpdateAppModel.fromMap(res);
      String? appFullVersionApi = Platform.isAndroid
          ? appVersionModelApi?.androidFullVersion
          : appVersionModelApi?.iosFullVersion;
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String appVersion = packageInfo.version;
      String appBuildVersion = packageInfo.buildNumber;
      String appFullVersionLocal = "$appVersion+$appBuildVersion";
      bool checkIsAppVersionUptodated =
          isAppVersionUpToDateWithBuildNumberInVersion(
            appVersion: appFullVersionLocal,
            minimumVersion: appFullVersionApi,
          );
      String logVersion =
          'check: $checkIsAppVersionUptodated || appFullVersionLocal:$appFullVersionLocal appFullVersionApi:$appFullVersionApi (${Platform.isAndroid ? "android" : "ios"})';
      if (checkIsAppVersionUptodated) {
        logPro.s(logVersion);
      } else {
        logPro.e(logVersion);
      }
      emit(
        SplshGetAppVersionApiSuccess(
          checkIsAppVersionUptodated: checkIsAppVersionUptodated,
        ),
      );
    } catch (e) {
      if (e is ServerFailure) {
        logger.i('serverFailure: ${e.toString()}');
        if (e.message.contains("connection_error")) {
          emit(
            SplshGetAppVersionApiError(
              error: LocaleKeys.noInternetConnection.tr(),
            ),
          );
        } else {
          emit(SplshGetAppVersionApiError(error: e.userMsg));
        }
      } else {
        emit(SplshGetAppVersionApiError(error: LocaleKeys.errorOccurred.tr()));
        logger.i('e: $e');
      }
    }
  }
}
