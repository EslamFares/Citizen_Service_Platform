import 'package:flutter/material.dart';

class PhoneText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const PhoneText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
  }
}
