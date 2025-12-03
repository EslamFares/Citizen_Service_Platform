import 'package:citizen_service_platform/const/assets.dart';
import 'package:flutter/material.dart';

class HomeStackBG extends StatelessWidget {
  const HomeStackBG({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        Assets.imgHomeBg,
        // width: context.width,
        // height: context.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
