import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared/funcs/date_formate.dart';
import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/request_item_view_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestItemView extends StatelessWidget {
  final String? name;
  final int? code;
  final String? status;
  final String? time;
  final String? payStatus;
  final bool? payDone;
  const RequestItemView({
    super.key,
    required this.name,
    required this.code,
    required this.status,
    required this.time,
    required this.payStatus,
    required this.payDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.borderBrawnLight, width: 1.w),
      ),

      child: AppButtonClick(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.h),
        onPressed: () {
          logger.e("request code: $code");
        },
        child: Column(
          children: [
            Row(
              spacing: 8.h,
              children: [
                Container(
                  width: 40.h,
                  height: 40.h,
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: AppColors.brownLight,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.asset(
                    Assets.iconsIcon,
                    width: 20.h,
                    height: 20.h,
                    color: AppColors.primaryColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name ?? "", style: AppTextStyles.font12w600Black),
                      Text(
                        "#${code ?? ""}",
                        style: AppTextStyles.font12w500RequestStatusGrayLight,
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: 40.h,
                  // height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.requestStatusBg,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    status ?? "",
                    style: AppTextStyles.font10w700RequestStatusText,
                  ),
                ),
              ],
            ),
            14.h.gapH,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RequestItemViewInfo(
                    imgPath: Assets.iconsRequestsTime,
                    text: convertTime(time) ?? "",
                  ),
                ),
                Expanded(
                  child: RequestItemViewInfo(
                    imgPath: Assets.iconsRequestsCheck,
                    text: payStatus ?? "",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String? convertTime(String? time) {
  if (time == null) return "";
  DateTime? dateFormated = DateTime.parse(time);
  String timeFormat = MyDateFormater.formatDateMonthText(dateFormated);
  return timeFormat;
}
