  import 'package:citizen_service_platform/core/utils/app_utils/app_text_style.dart';
import 'package:flutter/material.dart';

AppBar appBarTrans(String title) {
    return AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white70,
        title: Text(
         title,
          style: AppTextStyles.font14W600Black,
        ),
      );
  }