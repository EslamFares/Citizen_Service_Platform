import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/blur_container.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/cubit/main_bottom_nav_cubit.dart';
import 'package:citizen_service_platform/features/main_bottom_nav/presentation/widgets/my_main_bottom_navigation_bar/my_main_bottom_nav_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double get mainBottomNavHight =>
    (
        //MediaQuery.of(context).padding.bottom
        25 + kBottomNavigationBarHeight)
        .h;

class MyMainBottomNavigationBar extends StatelessWidget {
  const MyMainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBottomNavCubit, MainBottomNavState>(
      builder: (context, state) {
        MainBottomNavCubit cubit = MainBottomNavCubit.get(context);
        return Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: AppColors.selectedColor.withValues(alpha: .1),
          ),
          child: BlurContainer(
            width: context.width,
            height: mainBottomNavHight,
            borderRadius: 1.1,
            child: BottomNavigationBar(
              elevation: 0,

              onTap: (value) {
                cubit.changeIndex(value);
              },
              currentIndex: cubit.selectedIndex,
              // backgroundColor: Colors.red,
              selectedItemColor: AppColors.selectedColor,
              backgroundColor: Colors.transparent,
              selectedLabelStyle: AppTextStyles.font13w600SelectedColor,
              unselectedLabelStyle: AppTextStyles.font13w600SelectedColor
                  .copyWith(color: AppColors.unSelectedColor),
              items: [
                myMainBottomNavItem(
                  imgPath: Assets.iconsBottomNavHome,
                  text: LocaleKeys.home.tr(),
                  isSelected: cubit.selectedIndex == 0,
                ),
                myMainBottomNavItem(
                  imgPath: Assets.iconsBottomNavMyRequests,
                  text: LocaleKeys.home.tr(),
                  isSelected: cubit.selectedIndex == 1,
                ),
                myMainBottomNavItem(
                  imgPath: Assets.iconsBottomNavMenu,
                  text: LocaleKeys.home.tr(),
                  isSelected: cubit.selectedIndex == 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
