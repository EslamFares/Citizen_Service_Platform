import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:citizen_service_platform/features/send_service/presentation/widgets/service_pay_or_later_screen_widgets/service_pay_or_later_screen_line.dart';
import 'package:flutter/material.dart';

class InvoiceDetailsTitle extends StatelessWidget {
  final String title;
  const InvoiceDetailsTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font12w700),
        ServicePayOrLaterScreenLine(),
      ],
    );
  }
}
