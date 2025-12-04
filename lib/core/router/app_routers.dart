import 'package:citizen_service_platform/features/home/presentation/screens/home_screen.dart';
import 'package:citizen_service_platform/features/login/presentation/screens/login_screen.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/presentation/screens/main_bottom_nav_screen.dart';
import 'package:citizen_service_platform/features/menu/presentation/screens/menu_screen.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/screens/my_requests_screen.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/data/model/send_service_screen_args.dart';
import 'package:citizen_service_platform/features/send_service/presentation/screens/send_service_screen.dart';
import 'package:citizen_service_platform/features/send_service/presentation/screens/send_service_upload_files_screen.dart';
import 'package:citizen_service_platform/features/service_categories/data/model/service_categories_screen_args.dart';
import 'package:citizen_service_platform/features/service_categories/presentation/screens/service_categories_screen.dart';
import 'package:citizen_service_platform/features/service_pay/data/model/service_pay_screen_args.dart';
import 'package:citizen_service_platform/features/service_pay/presentation/screens/service_pay_screen.dart';
import 'package:citizen_service_platform/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:citizen_service_platform/features/sign_up/presentation/screens/sign_up_password_screen.dart';
import 'package:citizen_service_platform/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:citizen_service_platform/features/splash/data/model/app_version_model.dart';
import 'package:citizen_service_platform/features/splash/presentation/screens/splash_screen.dart';
import 'package:citizen_service_platform/features/splash/presentation/screens/update_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_routers_name.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//!use ===>    GoRouter.of(context).push(RouteName.home);

abstract class AppRouters {
  static final router = GoRouter(
    // initialLocation: AppRoutersName.signUpScreen,
    initialLocation: AppRoutersName.init,
    navigatorKey: navigatorKey,
    routes: [
      //~======= dafault ex ==================
      GoRoute(
        path: AppRoutersName.init,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutersName.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutersName.updateAppScreen,
        builder: (context, state) =>
            UpdateAppScreen(updateAppModel: state.extra as UpdateAppModel),
      ),
      GoRoute(
        path: AppRoutersName.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: AppRoutersName.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutersName.mainBottomNavScreen,
        builder: (context, state) => MainBottomNavScreen(),
      ),
      GoRoute(
        path: AppRoutersName.myRequestsScreen,
        builder: (context, state) => MyRequestsScreen(),
      ),
      GoRoute(
        path: AppRoutersName.menuScreen,
        builder: (context, state) => MenuScreen(),
      ),
      GoRoute(
        path: AppRoutersName.signUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutersName.serviceCategoriesScreen,
        builder: (context, state) {
          if (state.extra == null ||
              state.extra is! ServiceCategoriesScreenArgs) {
            navException("ServiceCategoriesScreenArgs");
          }
          return ServiceCategoriesScreen(
            args: state.extra as ServiceCategoriesScreenArgs,
          );
        },
      ),
      GoRoute(
        path: AppRoutersName.signUpPasswordScreen,
        builder: (context, state) {
          if (state.extra == null || state.extra is! SignUpCubit) {
            navException("SignUpCubit, SignUpPasswordScreenArgs");
          }
          return BlocProvider.value(
            value: state.extra as SignUpCubit,
            child: SignUpPasswordScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutersName.sendServiceScreen,
        builder: (context, state) {
          if (state.extra == null || state.extra is! SendServiceScreenArgs) {
            navException("ServiceCategoriesScreenArgs");
          }
          return SendServiceScreen(args: state.extra as SendServiceScreenArgs);
        },
      ),

      GoRoute(
        path: AppRoutersName.sendServiceUploadFilesScreen,
        builder: (context, state) {
          if (state.extra == null || state.extra is! SendServiceCubit) {
            navException("SendServiceCubit, SendServiceUploadFilesScreen");
          }
          return BlocProvider.value(
            value: state.extra as SendServiceCubit,
            child: SendServiceUploadFilesScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutersName.servicePayScreen,
        builder: (context, state) {
          if (state.extra == null || state.extra is! ServicePayScreenArgs) {
            navException("ServicePayScreenArgs");
          }
          return ServicePayScreen(args: state.extra as ServicePayScreenArgs);
        },
      ),
    ],
  );
  static void navException(String argsModelName, [String? screenName]) {
    throw Exception(
      '$argsModelName is required to navigate to ${screenName ?? (argsModelName.replaceAll("Args", ""))}',
    );
  }
}
