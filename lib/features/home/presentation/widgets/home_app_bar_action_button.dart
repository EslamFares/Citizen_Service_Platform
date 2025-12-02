import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarActionButton extends StatelessWidget {
  final String imgPath;
  final void Function()? onPressed;
  const HomeAppBarActionButton({
    super.key,
    required this.imgPath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(imgPath, width: 24.h, height: 24.h),
    );
  }
}
