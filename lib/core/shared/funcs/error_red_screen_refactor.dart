import 'package:citizen_service_platform/core/utils/app_config/app_config_environments.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void errorRedScreenRefactor() {
  if (kReleaseMode || appConfig.useCustomErrorBuilder) {
    // if (kDebugMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 80),
                const SizedBox(height: 20),
                const Text(
                  'Something went wrong! ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                if (!kReleaseMode)
                  Text(
                    details.exceptionAsString(),
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      );
    };
  }
}
