import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/request_item_view_img_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestItemViewInfo extends StatelessWidget {
  const RequestItemViewInfo({
    super.key,
    required this.serviceName,
    required this.id,
    required this.status,
    required this.createdAt,
    required this.paidStatus,
  });

  final String? serviceName;
  final int? id;
  final String? status;
  final String? createdAt;
  final String? paidStatus;

  @override
  Widget build(BuildContext context) {
    bool payDone = paidStatus == "مدفوع";
    bool isFree = paidStatus == "مجاني";
    return Column(
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
                Assets.iconsRequestsRequestItem,
                width: 20.h,
                height: 20.h,
                color: AppColors.primaryColor,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(serviceName ?? "", style: AppTextStyles.font12w600Black),
                  Text(
                    "#${id ?? ""}",
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
              child: RequestItemViewImgText(
                imgPath: Assets.iconsRequestsTime,
                text: convertTime(createdAt) ?? "",
              ),
            ),
            Expanded(
              child: RequestItemViewImgText(
                color: payDone == true || isFree ? null : AppColors.red,
                imgPath: payDone == true || isFree
                    ? Assets.iconsRequestsCheck
                    : Assets.iconsRequestsNotPay,
                text: paidStatus ?? "",
                // payDone == true
                //     ? LocaleKeys.feesPaid.tr()
                //     : LocaleKeys.feesNotPaid.tr(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String? convertTime(String? time) {
  return time;
  // if (time == null) return "";
  // DateTime? dateFormated = DateTime.parse(time);
  // String timeFormat = MyDateFormater.formatDateMonthText(dateFormated);
  // return timeFormat;
}
