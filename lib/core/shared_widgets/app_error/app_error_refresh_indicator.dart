import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:flutter/material.dart';

class AppErrorRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Color? color;
  final String? text;
  const AppErrorRefreshIndicator({
    super.key,
    required this.onRefresh,
    this.color,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryColor,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            gapVertical(context.height * .4),
            AppError(text: text, color: color),
            gapVertical(context.height * .4),
          ],
        ),
      ),
    );
  }
}
