import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? maxLetters;

  const MyText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines = 1,
    this.maxLetters,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLetters != null ? maxLengthText(text, maxLetters!) : text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
    );
  }
}

String maxLengthText(String text, int length) {
  return text.length > length ? ("${text.substring(0, length - 2)}..") : text;
}
