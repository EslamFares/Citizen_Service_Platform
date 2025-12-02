import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BottomNavigationBarItem myMainBottomNavItem({
  required String imgPath,
  required String text,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    icon: HomeBottomNavButtonIcon(imgPath: imgPath, isSelected: isSelected),
    label: text,
  );
}

class HomeBottomNavButtonIcon extends StatelessWidget {
  const HomeBottomNavButtonIcon({
    super.key,
    required this.imgPath,
    required this.isSelected,
  });

  final String imgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.w,
      width: 24.w,
      child: Image.asset(
        imgPath,
        width: 24.w,
        height: 24.w,
        color: isSelected ? AppColors.selectedColor : AppColors.unSelectedColor,
      ),
    );
  }
}
