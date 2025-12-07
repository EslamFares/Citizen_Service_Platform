import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final double blur;
  final Color? borderColor;
  const BlurContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.blur = 20,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF).withValues(alpha: 0.1),
            Color(0xFFFFFFFF)..withValues(alpha: 0.05),
          ],
          stops: [0.1, 1],
        ),
        borderRadius: BorderRadius.circular(borderRadius),

        border: Border.all(
          color: borderColor ?? Color(0xFFE5DACE).withValues(alpha: 1),
          width: 1.h,
        ),
      ),
      child: child,
    ).asGlass(
      blurX: blur,
      blurY: blur,
      clipBorderRadius: BorderRadius.circular(borderRadius),
      // tintColor: Colors.red,
      // tileMode: TileMode.repeated,
      // clipBehaviour: Clip.antiAlias,
    );
    //*================== old =================*/

    //   } else if (1 == 2) {
    //     return SizedBox(
    //       width: width,
    //       height: height,
    //       child: Blur(
    //         blur: blur,
    //         borderRadius: BorderRadius.circular(borderRadius),
    //         blurColor: Color(0xFFFFFFFF)..withValues(alpha: 0.9),
    //         colorOpacity: .4,
    //         overlay: child,
    //         child: Container(
    //           width: width,
    //           height: height,
    //           decoration: BoxDecoration(
    //             // color: Colors.white,
    //             borderRadius: BorderRadius.circular(borderRadius),
    //             border: Border.all(color: AppColors.primaryColor, width: 1.h),
    //           ),
    //           // child: child,
    //         ),
    //       ),
    //     );
    //   }
    //   return GlassmorphicContainer(
    //     width: width,
    //     height: height,
    //     // is required be >1
    //     borderRadius: borderRadius > 2 ? borderRadius : 2.r,
    //     blur: blur,
    //     alignment: Alignment.center,
    //     border: 1.h,

    //     linearGradient: LinearGradient(
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //       colors: [
    //         Color(0xFFFFFFFF).withValues(alpha: 0.1),
    //         Color(0xFFFFFFFF)..withValues(alpha: 0.05),
    //       ],
    //       stops: [0.1, 1],
    //     ),
    //     borderGradient: LinearGradient(
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //       colors: [
    //         Color(0xFFE5DACE).withValues(alpha: .5),
    //         Color((0xFFE5DACE)).withValues(alpha: 1),
    //       ],
    //     ),
    //     child: child,
    //   );
    // }
  }
}
