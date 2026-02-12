import 'package:citizen_service_platform/core/shared_widgets/app_buttons/app_button_click.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/features/my_requests/presentation/widgets/request_item_view_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestItemView extends StatelessWidget {
  final String? name;
  final int? code;
  final String? status;
  final String? time;
  final String? paidStatus;
  final void Function()? onPressed;

  const RequestItemView({
    super.key,
    required this.name,
    required this.code,
    required this.status,
    required this.time,
    required this.paidStatus,
    required this.onPressed,
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
        onPressed: onPressed,
        child: RequestItemViewInfo(
          serviceName: name,
          id: code,
          status: status,
          createdAt: time,

          paidStatus: paidStatus,
        ),
      ),
    );
  }
}
