import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonTextUnderLine extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final TextStyle? textStyle;
  const AppButtonTextUnderLine({
    super.key,
    required this.onTap,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: textStyle ??
                TextStyle(
                  color: Colors.blue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
