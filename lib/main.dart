import 'package:citizen_service_platform/core/cash/clear_secure_storage_on_reinstall.dart';
import 'package:citizen_service_platform/core/cash/shared_prefs_helper.dart';
import 'package:citizen_service_platform/core/dependency_injection/get_it_setup.dart';
import 'package:citizen_service_platform/core/shared/funcs/error_red_screen_refactor.dart';
import 'package:citizen_service_platform/core/utils/app_config/app_config_environments.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/app_lang_enum.dart';
import 'package:citizen_service_platform/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/shared/bloc/mybloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugRepaintRainbowEnabled = true;// show painting colors
  //===========================
  await SharedPrefsHelper.init();
  await clearSecureStorageOnReinstall();
  //===========================
  await setupGetIt();

  //===========================
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //===========================
  if (appConfig.enableMyBlocObserver) {
    Bloc.observer = MyBlocObserver();
  }
  //===========================
  errorRedScreenRefactor();
  //===========================
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalesConst.appSupportedLocales,
      path: AppLocalesConst.appSupportedLocalesPath,
      fallbackLocale: AppLocalesConst.defaultLocale, //default
      saveLocale: true,
      startLocale: AppLocalesConst.defaultLocale,
      child: const MyApp(),
    ),
  );
}
