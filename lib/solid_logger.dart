import 'package:flutter/rendering.dart';

class SolidLogger {
  SolidLogger._();

  static void log(String message, {String tag = 'LOG'}) {
    final now = DateTime.now().toIso8601String();
    debugPrint('[$now][$tag] $message');
  }
}
