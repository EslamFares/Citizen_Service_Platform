import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/home/data/model/home_model.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/app_scroll_behavior.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/home_app_bar.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/services_item_view.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/presentation/widgets/my_main_bottom_navigation_bar/my_main_bottom_navigation_bar.dart';
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
              Positioned.fill(
                child: Image.asset(
                  Assets.imgHomeBg,
                  // width: context.width,
                  // height: context.height,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: mainBottomNavHight,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 70.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeAppBar(),
                      30.h.gapH,
                      Text(
                        LocaleKeys.services.tr(),
                        style: AppTextStyles.font18w700Black,
                      ),
                      10.h.gapH,
                      Expanded(
                        child: AppScrollBehavior(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                70.h.gapH,
                                BlocBuilder<HomeCubit, HomeState>(
                                  builder: (context, state) {
                                    HomeCubit cubit = HomeCubit.get(context);
                                    List<ServicesItemModel> services =
                                        cubit.servicesModel.servicesModelData ??
                                        [];
                                    return GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      // physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: services.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 13.h,
                                            mainAxisSpacing: 16.h,
                                            childAspectRatio: 1,
                                            mainAxisExtent: 100.h,
                                          ),
                                      itemBuilder: (context, index) =>
                                          ServicesItemView(
                                            image: services[index].image,
                                            title: services[index].name,
                                            id: services[index].id,
                                          ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
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
