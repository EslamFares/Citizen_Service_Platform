import 'package:citizen_service_platform/const/assets.dart';
import 'package:citizen_service_platform/core/shared_widgets/status_bar_bottom_nav_system.dart';
import 'package:citizen_service_platform/core/utils/extentions/spacing_extensions.dart';
import 'package:flutter/material.dart';

class ScaffoldBg extends StatelessWidget {
  final Widget body;

  final void Function()? onPressedAppBarLeading;

  const ScaffoldBg({
    super.key,
    required this.body,
    this.onPressedAppBarLeading,
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
                Assets.imgLoginBg,
                fit: BoxFit.fill,
                width: context.width,
                height: context.height,
              ),
            ),
            SafeArea(
              child: Scaffold(
                //stop keyboard from overlapping
                // resizeToAvoidBottomInset: false,

                // backgroundColor: AppColors.scffoldCarImgBg,
                backgroundColor: Colors.transparent,

                // app bar show background
                extendBodyBehindAppBar: true,
                // appBar: CustomAppBar(
                //   title: "",
                //   showCircleLeading: true,
                //   backgroundColor: Colors.transparent,
                //   showLeading: showloginButton,
                //   onPressed: onPressedAppBarLeading,
                // ),
                body: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
