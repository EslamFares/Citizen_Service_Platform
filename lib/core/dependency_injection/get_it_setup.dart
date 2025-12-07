import 'package:citizen_service_platform/core/network/api/api_service.dart';
import 'package:citizen_service_platform/features/home/cubit/home_cubit.dart';
import 'package:citizen_service_platform/features/home/data/repo/home_repo.dart';
import 'package:citizen_service_platform/features/login/cubit/login_cubit.dart';
import 'package:citizen_service_platform/features/login/data/repo/login_repo.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/cubit/main_bottom_nav_cubit.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/data/repo/main_bottom_nav_repo.dart';
import 'package:citizen_service_platform/features/menu/cubit/menu_cubit.dart';
import 'package:citizen_service_platform/features/menu/data/repo/menu_repo.dart';
import 'package:citizen_service_platform/features/my_requests/cubit/my_requests_cubit.dart';
import 'package:citizen_service_platform/features/my_requests/data/repo/my_requests_repo.dart';
import 'package:citizen_service_platform/features/send_service/cubit/send_service_cubit.dart';
import 'package:citizen_service_platform/features/send_service/data/repo/send_service_repo.dart';
import 'package:citizen_service_platform/features/service_categories/cubit/service_categories_cubit.dart';
import 'package:citizen_service_platform/features/service_categories/data/repo/service_categories_repo.dart';
import 'package:citizen_service_platform/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:citizen_service_platform/features/sign_up/data/repo/sign_up_repo.dart';
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
  getIt.registerSingleton<MenuRepo>(MenuRepo(getIt<ApiService>()));
  getIt.registerSingleton<SignUpRepo>(SignUpRepo(getIt<ApiService>()));
  getIt.registerSingleton<ServiceCategoriesRepo>(
    ServiceCategoriesRepo(getIt<ApiService>()),
  );
  getIt.registerSingleton<SendServiceRepo>(
    SendServiceRepo(getIt<ApiService>()),
  );
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
  getIt.registerFactory<MenuCubit>(() => MenuCubit(getIt<MenuRepo>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
  getIt.registerFactory<ServiceCategoriesCubit>(
    () => ServiceCategoriesCubit(getIt<ServiceCategoriesRepo>()),
  );
  getIt.registerFactory<SendServiceCubit>(
    () => SendServiceCubit(getIt<SendServiceRepo>()),
  );

  //=========home=============================================
  //registerFactory ==> for more than once use
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}

//! main ==>await setupGetIt();
