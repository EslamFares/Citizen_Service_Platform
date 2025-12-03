import 'package:citizen_service_platform/core/network/api/api_service.dart';
import 'package:citizen_service_platform/features/home/cubit/home_cubit.dart';
import 'package:citizen_service_platform/features/home/data/repo/home_repo.dart';
import 'package:citizen_service_platform/features/login/cubit/login_cubit.dart';
import 'package:citizen_service_platform/features/login/data/repo/login_repo.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/cubit/main_bottom_nav_cubit.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/data/repo/main_bottom_nav_repo.dart';
import 'package:citizen_service_platform/features/my_requests/cubit/my_requests_cubit.dart';
import 'package:citizen_service_platform/features/my_requests/data/repo/my_requests_repo.dart';
import 'package:citizen_service_platform/features/splash/cubit/splash_cubit.dart';
import 'package:citizen_service_platform/features/splash/data/repo/splash_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  //$------------- api service ------------------------------
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

  //#=================== Repos ===============================
  getIt.registerSingleton<SplashRepo>(SplashRepo(getIt<ApiService>()));
  getIt.registerSingleton<LoginRepo>(LoginRepo(getIt<ApiService>()));
  getIt.registerSingleton<HomeRepo>(HomeRepo(getIt<ApiService>()));
  getIt.registerSingleton<MainBottomNavRepo>(
    MainBottomNavRepo(getIt<ApiService>()),
  );
  getIt.registerSingleton<MyRequestsRepo>(MyRequestsRepo(getIt<ApiService>()));
  //^----------------- Cubits ---------------------------------
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<SplashRepo>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
  getIt.registerFactory<MainBottomNavCubit>(
    () => MainBottomNavCubit(getIt<MainBottomNavRepo>()),
  );
  getIt.registerFactory<MyRequestsCubit>(
    () => MyRequestsCubit(getIt<MyRequestsRepo>()),
  );
  //=========home=============================================
  //registerFactory ==> for more than once use
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}

//! main ==>await setupGetIt();
