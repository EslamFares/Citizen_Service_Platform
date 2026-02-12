import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarBottomNavSystem extends StatelessWidget {
  final Widget child;
  final Color? systemNavigationBarColor;
  final Color? statusBarColor;
  final Brightness? systemNavigationBarIconBrightness;
  final Brightness? statusBarIconBrightness;
  const StatusBarBottomNavSystem({
    super.key,
    required this.child,
    this.systemNavigationBarColor,
    this.statusBarColor,
    this.systemNavigationBarIconBrightness,
    this.statusBarIconBrightness,
  });
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor:
            systemNavigationBarColor ?? AppColors.primaryColor,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
      child: child,
    );
  }
}
