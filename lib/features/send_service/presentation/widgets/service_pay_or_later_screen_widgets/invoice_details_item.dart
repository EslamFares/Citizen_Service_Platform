import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/service_pay_or_later_screen_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceDetailsItem extends StatelessWidget {
  const InvoiceDetailsItem({
    super.key,
    required this.serviceAmount,
    required this.title,
    this.style,
    this.showDivider = true,
  });

  final String title;
  final String serviceAmount;
  final TextStyle? style;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 8.w,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: style ?? AppTextStyles.font12w600Black,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                serviceAmount,
                style: style ?? AppTextStyles.font12w600Black,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (showDivider) ServicePayOrLaterScreenLine(),
      ],
    );
  }
}
