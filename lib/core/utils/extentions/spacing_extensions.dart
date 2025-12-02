import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension Gap on num {
  SizedBox get gapH => SizedBox(height: toDouble());
  SizedBox get gapW => SizedBox(width: toDouble());
  SizedBox get gapWH => SizedBox(width: toDouble(), height: toDouble());
}

//==================
SizedBox gapVertical(double height) => SizedBox(height: height);
SizedBox gapHorizontal(double width) => SizedBox(width: width);
Widget gapExpanded() => const Expanded(child: SizedBox());
//=============
double widthScreen(BuildContext context) => MediaQuery.of(context).size.width;
double heightScreen(BuildContext context) => MediaQuery.of(context).size.height;
//==================
