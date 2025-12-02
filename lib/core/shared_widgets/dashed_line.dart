import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double heightDash;
  final double widthDash;
  final double? heightLine, widthLine;
  final double? speace;
  final int? count;
  final Color? color;
  final Decoration? decoration;
  const DashedLine(
      {super.key,
      this.heightDash = 3,
      this.widthDash = 10,
      this.heightLine,
      this.widthLine,
      this.count,
      this.color,
      this.decoration,
      this.speace});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightLine,
      width: widthLine,
      child: Row(
        children: List.generate(count ?? 20, (index) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: speace ?? widthDash),
              child: Container(
                height: heightDash,
                width: widthDash,
                decoration: decoration ??
                    BoxDecoration(
                      color: color ?? const Color(0XFFf2f2f2),
                    ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
