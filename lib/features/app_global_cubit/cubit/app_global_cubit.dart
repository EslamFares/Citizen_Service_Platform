import 'dart:async';

import 'package:citizen_service_platform/core/cash/shared_prefs_helper.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'app_global_state.dart';

//app global cubit
class AppGlobalCubit extends Cubit<AppGlobalState> {
  AppGlobalCubit() : super(SettingInitial()) {
    init();
    checkConnectivity();
  }
  //===========================================
  @override
  void emit(AppGlobalState state) {
    if (!isClosed) super.emit(state);
  }

  //===========================================
  static AppGlobalCubit get(BuildContext context) => BlocProvider.of(context);

  //!================================
  void init() {
    getLanguage();
    getTheme();
  }

  //!================================
  String langCode = "en";
  void changeLanguage(String languageCode) {
    langCode = languageCode;
    SharedPrefsHelper.setString(AppConst.kLangCode, languageCode);
    emit(ChangLanguageState());
  }

  Future<void> getLanguage() async {
    langCode = SharedPrefsHelper.getString(AppConst.kLangCode) ?? "en";
    emit(ChangLanguageState());
  }

  //=======================================
  ThemeMode themeMode = ThemeMode.light;
  bool isLight = true;
  void changeTheme() {
    isLight = !isLight;
    SharedPrefsHelper.setBool(AppConst.isLight, isLight);
    emit(SettingChangeTheme());
  }

  void getTheme() async {
    isLight = SharedPrefsHelper.getBool(AppConst.isLight) ?? true;
    emit(SettingChangeTheme());
  }

  //=========================check connectivity===========================================
  bool isConnectted = false;
  bool _isfirstOpen = true;
  StreamSubscription? _listener;
  InternetConnection internetConnection = InternetConnection.createInstance(
    useDefaultOptions: false,
    checkInterval: const Duration(seconds: 60),
    customCheckOptions: [
      InternetCheckOption(uri: Uri.parse('https://www.google.com')),
      InternetCheckOption(uri: Uri.parse('https://www.microsoft.com')),
      InternetCheckOption(uri: Uri.parse('https://fast.com')),
    ],
  );
  void checkConnectivity() {
    _listener = internetConnection.onStatusChange.listen((
      InternetStatus status,
    ) {
      switch (status) {
        case InternetStatus.connected:
          isConnectted = true;
          _isfirstOpen
              ? emit(ConnectivityOnFirstTimeState())
              : emit(ConnectivityOnState());
          _isfirstOpen = false;
          break;
        case InternetStatus.disconnected:
          isConnectted = false;
          _isfirstOpen
              ? emit(ConnectivityOffFirstTimeState())
              : emit(ConnectivityOffState());
          _isfirstOpen = false;
          break;
      }
    });
  }

  @override
  Future<void> close() {
    _listener?.cancel();
    return super.close();
  }
}
