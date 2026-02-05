import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/splash/data/model/app_version_model.dart';
import 'package:citizen_service_platform/features/splash/presentation/widgets/update_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateAppScreen extends StatelessWidget {
  final UpdateAppModel updateAppModel;
  const UpdateAppScreen({super.key, required this.updateAppModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gapHorizontal(context.width),
              Image.asset(
                Assets.iconsIcon,
                color: AppColors.primaryColor,
                width: context.width * .5,
                height: context.width * .5,
              ),
              gapVertical(20.h),
              UpdateTextButton(
                androidLink: updateAppModel.androidLink,
                iosLink: updateAppModel.iosLink,
                androidFullVersion: updateAppModel.androidFullVersion,
                iosFullVersion: updateAppModel.androidFullVersion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
