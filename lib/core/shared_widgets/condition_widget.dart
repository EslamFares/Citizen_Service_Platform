import 'package:flutter/material.dart';

class ConditionWidget extends StatelessWidget {
  final Widget child;
  final Widget childFalse;
  final bool condition;

  const ConditionWidget(
      {super.key,
      required this.child,
      required this.childFalse,
      required this.condition});

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return child;
    }
    return childFalse;
  }
}
