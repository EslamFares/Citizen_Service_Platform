import 'package:flutter/material.dart';

class AppScrollBehavior extends StatelessWidget {
  final Widget child;
  const AppScrollBehavior({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // This removes the Android overscroll glow effect entirely
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: child,
    );
  }
}
