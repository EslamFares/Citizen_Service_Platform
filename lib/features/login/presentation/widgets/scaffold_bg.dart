import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared_widgets/status_bar_bottom_nav_system.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:flutter/material.dart';

class ScaffoldBg extends StatelessWidget {
  final Widget body;
  final String? bg;
  final bool safeAreaTopBody;
  final bool safeAreaTopScreen;
  final bool safeAreaBottomBody;
  final bool safeAreaBottomScreen;
  final PreferredSizeWidget? appBar;
  const ScaffoldBg({
    super.key,
    required this.body,
    this.bg,
    this.safeAreaTopBody = false,
    this.safeAreaBottomBody = false,
    this.safeAreaTopScreen = false,
    this.safeAreaBottomScreen = false,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return StatusBarBottomNavSystem(
      systemNavigationBarColor: Colors.white,
      // bgColor ?? AppColors.primaryColorLogoGif,
      systemNavigationBarIconBrightness: Brightness.dark,
      child: SafeArea(
        top: safeAreaTopScreen,
        bottom: safeAreaBottomScreen,

        child: SizedBox(
          width: context.width,
          height: context.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: AppColors.scaffoldBg,
                  width: context.width,
                  height: context.height,
                ),
              ),
              Positioned.fill(
                child: Image.asset(
                  bg ?? Assets.imgServiceTopBottomEmptyCenterNotEmptyBg,
                  fit: BoxFit.fill,
                  width: context.width,
                  height: context.height,
                ),
              ),
              SafeArea(
                top: safeAreaTopBody,
                bottom: safeAreaBottomBody,
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
      ),
    );
  }
}
