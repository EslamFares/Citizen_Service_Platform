import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:flutter/material.dart';

extension HexColor on String {
  /// Converts a hex color string like "#aabbcc" or "ffaabbcc" to [Color].
  /// Returns `null` if the string is not valid.
  Color? get colorFromHex {
    final hex = replaceFirst('#', '');
    logger.e("hex: $hex");
    if (hex.isEmpty || (hex.length != 6 && hex.length != 8)) return null;

    try {
      final buffer = StringBuffer();
      if (hex.length == 6) buffer.write('ff'); // Add alpha if missing
      buffer.write(hex);
      logger.e("hex: $hex");
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return null;
    }
  }
}

//!use
// Color color ='#fffffff'.colorFromHex;
extension HexColorConvert on Color {
  String? get toHex {
    try {
      final hexA = (a * 255).round().toRadixString(16).padLeft(2, '0');
      final hexR = (r * 255).round().toRadixString(16).padLeft(2, '0');
      final hexG = (g * 255).round().toRadixString(16).padLeft(2, '0');
      final hexB = (b * 255).round().toRadixString(16).padLeft(2, '0');

      return '#$hexA$hexR$hexG$hexB';
    } catch (e) {
      return null;
    }
  }
}

extension RgbColor on String {
  /// Converts an "rgb(r,g,b)" string to [Color].
  /// Returns `null` if the string is not valid.
  Color? get colorFromRgb {
    try {
      final values = replaceAll(
        "rgb(",
        "",
      ).replaceAll(")", "").split(",").map((v) => int.parse(v.trim())).toList();

      if (values.length != 3) return null;

      final color = Color.fromARGB(255, values[0], values[1], values[2]);
      logger.i("Parsed RGB Color: $color");
      return color;
    } catch (e) {
      logger.e("Error parsing rgb string: $this");
      return null;
    }
  }
}

//!use
// Color color = 'rgb(255, 0, 0)'.colorFromRgb
