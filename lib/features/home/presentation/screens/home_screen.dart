import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_loader_gif.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_sizes.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/home_app_bar.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/home_services_list_view.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/home_stack_bg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/get_it_setup.dart';
import '../../cubit/home_cubit.dart';
import '../../data/repo/home_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>())..init(),
      child: Scaffold(
        body: SizedBox(
          width: context.width,
          height: context.height,
          child: Stack(
            children: [
              HomeStackBG(),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: AppSizes.mainBottomNavHight,
                child: Padding(
                  padding: AppSizes.sPaddingStackT70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeAppBar(),

                      Padding(
                        padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                        child: Text(
                          LocaleKeys.services.tr(),
                          style: AppTextStyles.font18w700Black,
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<HomeCubit, HomeState>(
                          buildWhen: (previous, current) =>
                              current is HomeLoading ||
                              current is HomeError ||
                              current is HomeSuccess,
                          builder: (context, state) {
                            if (state is HomeLoading) {
                              return AppLoaderGif();
                            }
                            // if (state is HomeError) {
                            //   return AppError(text: state.errorMessage);
                            // }
                            return HomeServicesListView();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
