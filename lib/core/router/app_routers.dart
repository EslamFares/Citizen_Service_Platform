import 'package:citizen_service_platform/features/home/presentation/screens/home_screen.dart';
import 'package:citizen_service_platform/features/login/presentation/screens/login_screen.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/presentation/screens/main_bottom_nav_screen.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/screens/my_requests_screen.dart';
import 'package:citizen_service_platform/features/splash/data/model/app_version_model.dart';
import 'package:citizen_service_platform/features/splash/presentation/screens/splash_screen.dart';
import 'package:citizen_service_platform/features/splash/presentation/screens/update_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routers_name.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//!use ===>    GoRouter.of(context).push(RouteName.home);

abstract class AppRouters {
  static final router = GoRouter(
    // initialLocation: AppRoutersName.loginScreen,
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
    ],
  );
  static void navException(String argsModelName, [String? screenName]) {
    throw Exception(
      '$argsModelName is required to navigate to ${screenName ?? (argsModelName.replaceAll("Args", ""))}',
    );
  }
}
