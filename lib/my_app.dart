import 'package:citizen_service_platform/core/router/app_routers.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_strings.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/core/utils/theme/dark_theme.dart';
import 'package:citizen_service_platform/core/utils/theme/light_theme.dart';
import 'package:citizen_service_platform/features/app_global_cubit/cubit/app_global_cubit.dart';
import 'package:citizen_service_platform/features/app_global_cubit/presentation/widgets/language_section/app_lang_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppGlobalCubit())],
      child: BlocConsumer<AppGlobalCubit, AppGlobalState>(
        listener: (context, state) {
          if (state is ConnectivityOnState) {
            logger.t("Connectted");
            // AppToast.toastificationShow(
            //   LocaleKeys.connectionSuccess.tr(),
            //   leadingIcon: Icons.signal_wifi_4_bar,
            // );
          } else if (state is ConnectivityOffState) {
            logger.t("Not Connectted");
            // AppToast.toastificationShow(
            //   LocaleKeys.connectionCheck.tr(),
            //   leadingIcon: Icons.signal_wifi_off,
            // );
          }
        },
        builder: (context, state) {
          AppGlobalCubit appSettingCubit = AppGlobalCubit.get(context);
          return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return ToastificationWrapper(
                child: MaterialApp.router(
                  title: AppStrings.appName,
                  theme: lightTheme(),
                  darkTheme: darkTheme(),
                  themeMode: appSettingCubit.isLight
                      ? ThemeMode.light
                      : ThemeMode.dark, // appSettingCubit.themeMode,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,

                  // 3. Set the current locale from EasyLocalization context
                  // locale: context.locale,
                  locale: AppLanguageCodeEnum.getLangByCode(
                    appSettingCubit.langCode,
                  ).getLocale(),
                  debugShowCheckedModeBanner: false,
                  //!ad  go router
                  routerConfig: AppRouters.router,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
