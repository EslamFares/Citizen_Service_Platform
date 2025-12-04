import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared_widgets/status_bar_bottom_nav_system.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:flutter/material.dart';

class ScaffoldBg extends StatelessWidget {
  final Widget body;
  final String? bg;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final PreferredSizeWidget? appBar;
  const ScaffoldBg({
    super.key,
    required this.body,
    this.bg,
    this.safeAreaTop = false,
    this.safeAreaBottom = false,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return StatusBarBottomNavSystem(
      systemNavigationBarColor: Colors.transparent,
      // bgColor ?? AppColors.primaryColorLogoGif,
      systemNavigationBarIconBrightness: Brightness.light,
      child: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                bg ?? Assets.imgLoginBg,
                fit: BoxFit.fill,
                width: context.width,
                height: context.height,
              ),
            ),
            SafeArea(
              top: safeAreaTop,
              bottom: safeAreaBottom,
              child: Scaffold(
                //stop keyboard from overlapping
                // resizeToAvoidBottomInset: false,

                // backgroundColor: AppColors.scffoldCarImgBg,
                backgroundColor: Colors.transparent,

                // app bar show background
                // extendBodyBehindAppBar: true,
                appBar: appBar,
                body: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
