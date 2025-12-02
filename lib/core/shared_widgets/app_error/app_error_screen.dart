import 'package:citizen_service_platform/core/shared_widgets/app_error/app_error.dart';
import 'package:flutter/material.dart';

class AppErrorScreen extends StatelessWidget {
  final String? text;
  const AppErrorScreen({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(shadowColor: Colors.transparent),
      body: AppError(text: text),
    );
  }
}
