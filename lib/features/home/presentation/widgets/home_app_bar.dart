import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/home/presentation/widgets/home_app_bar_action_button.dart';
import 'package:citizen_service_platform/features/login/data/model/user_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${LocaleKeys.hello.tr()}, ${UserHelper.user?.data?.fullName ?? ""} !",
                style: AppTextStyles.font14w600Black,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                spacing: 8.w,
                children: [
                  Image.asset(Assets.iconsHomeLocation, width: 16.w),

                  Expanded(
                    child: Text(
                      (UserHelper.user?.data?.location ?? "--, --"),
                      style: AppTextStyles.font14w600Black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            HomeAppBarActionButton(
              imgPath: Assets.iconsHomeNotification,
              onPressed: () {},
            ),
            HomeAppBarActionButton(
              imgPath: Assets.iconsHomeSearch,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
