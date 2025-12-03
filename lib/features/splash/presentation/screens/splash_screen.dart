import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/dependency_injection/get_it_setup.dart';
import 'package:citizen_service_platform/core/router/app_routers_name.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashCubit>()..init(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          SplashCubit cubit = SplashCubit.get(context);
          if (state is SplshGetAppVersionApiSuccess) {
            // if (state.checkIsAppVersionUptodated) {
            //   isLoginNavFromSplash(context);
            // } else {
            //   context.push(
            //     AppRoutersName.updateAppScreen,
            //     extra: cubit.appVersionModelApi,
            //   );
            // }
          } else if (state is SplshGetAppVersionApiError) {
            AppToast.toastificationShow(
              state.error,
              leadingIcon: Icons.verified_user_outlined,
              snackbarDuration: const Duration(hours: 24),
              isDismiss: true,
              bottomMargin: 45.h,
              onTap: () {
                toastification.dismissAll();
                cubit.init();
              },
            );
          }
        },
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = SplashCubit.get(context);
          return Scaffold(
            body: SizedBox(
              height: context.height,
              width: context.width,
              child: Stack(
                children: [
                  //!------- background
                  Positioned.fill(
                    child: Image.asset(Assets.imgSplashBg, fit: BoxFit.fill),
                  ),
                  //!------- logo
                  Center(
                    child: Image.asset(
                      Assets.iconsIcon,
                      width: 100.w,
                      height: 100.w,
                    ),
                  ),
                  //!------- loader
                  if (state is SplshGetAppVersionApiLoading)
                    Positioned(
                      bottom: 100.h,
                      left: 0,
                      right: 0,
                      child: const AppLoader(color: Colors.white),
                    ),
                  //!------- click to reload
                  if (state is SplshGetAppVersionApiError)
                    Positioned.fill(
                      child: InkWell(
                        splashColor: Colors.black.withValues(alpha: .05),
                        onTap: () {
                          toastification.dismissAll();
                          cubit.init();
                        },
                        child: const SizedBox(),
                      ),
                    ),
                  //!------- navigate by button to update screen
                  if (state is SplshGetAppVersionApiSuccess)
                    if (!state.checkIsAppVersionUptodated)
                      Positioned(
                        bottom: 100.h,
                        left: 25.w,
                        right: 25.w,
                        child: AppButton(
                          width: context.width * .8,
                          onPressed: () {
                            context.push(
                              AppRoutersName.updateAppScreen,
                              extra: cubit.appVersionModelApi,
                            );
                          },
                          text: LocaleKeys.newVersionAvailable.tr(),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
