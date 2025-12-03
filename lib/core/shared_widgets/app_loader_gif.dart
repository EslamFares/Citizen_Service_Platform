import 'package:citizen_service_platform/const/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoaderGif extends StatelessWidget {
  final bool circle;
  final double? size;
  const AppLoaderGif({super.key, this.circle = true, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circle ? 500.r : 0),
        child: Image.asset(
          Assets.gifLoad,
          width: size ?? 150.w,
          height: size ?? 150.w,
        ),
      ),
    );
  }
}
