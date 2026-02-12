import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/features/send_service/presentation/screens/service_pay_or_later_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRequestDetailsScreenBodyReset extends StatelessWidget {
  const MyRequestDetailsScreenBodyReset({
    super.key,
    required this.serviceAmount,
    required this.serviceFee,
    required this.tax,
    required this.total,
  });

  final num? serviceAmount;
  final num? serviceFee;
  final num? tax;
  final num? total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        border: Border.all(color: AppColors.borderBrawnLight, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: PaymentDetailsReset(
        serviceAmount: serviceAmount,
        serviceFee: serviceFee,
        tax: tax,
        total: total,
      ),
    );
  }
}
