import 'package:flutter/material.dart';

bool isRtl(BuildContext context) {
  var rtl = Directionality.of(context) == TextDirection.rtl;
  return rtl;
  // return context.locale.languageCode == 'ar';
}
