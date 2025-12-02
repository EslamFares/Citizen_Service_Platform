import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_image/app_image.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ServicesItemView extends StatelessWidget {
  final String? title;
  final String? image;
  final int index;
  final void Function()? onTap;
  const ServicesItemView({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 350,
      height: 350,
      borderRadius: 16.r,
      blur: 20,
      alignment: Alignment.center,
      border: 1.h,

      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFFFFF).withValues(alpha: 0.1),
          Color(0xFFFFFFFF)..withValues(alpha: 0.05),
        ],
        stops: [0.1, 1],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFE5DACE).withValues(alpha: .5),
          Color((0xFFE5DACE)).withValues(alpha: 1),
        ],
      ),
      child: AppButtonClick(
        onPressed: () {
          logPro.error("service index: $index");
          onTap?.call();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            double.infinity.gapW,
            Container(
              width: 45.h,
              height: 45.h,
              padding: EdgeInsets.all(11.w),
              decoration: BoxDecoration(
                color: AppColors.brownLight,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: AppImage(
                image ?? Assets.iconsIcon,
                width: 24.h,
                height: 24.h,
                colorImage: Colors.brown,
              ),
            ),
            8.h.gapH,
            Flexible(
              child: Text(
                title ?? "",
                style: AppTextStyles.font12w700BTextBrawn,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
