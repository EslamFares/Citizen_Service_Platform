import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final double blur;

  const BlurContainer({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.blur = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // This removes the Android overscroll glow effect entirely
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: GlassmorphicContainer(
        width: width,
        height: height,
        // is required be >1
        borderRadius: borderRadius > 2 ? borderRadius : 2.r,
        blur: blur,
        alignment: Alignment.center,
        border: 1.h,

        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF).withValues(alpha: 0.1),
            Color(0xFFFFFFFF)..withValues(alpha: 0.05),
          ],
          stops: [0.1, 1],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE5DACE).withValues(alpha: .5),
            Color((0xFFE5DACE)).withValues(alpha: 1),
          ],
        ),
        child: child,
      ),
    );
  }
}
