import 'package:flutter/material.dart';

abstract class PhoneSize {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}
