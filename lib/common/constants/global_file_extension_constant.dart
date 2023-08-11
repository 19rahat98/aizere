import 'package:flutter/material.dart';

class GlobalExtensionFileConstant {
  static const jpg = ".jpg";
  static const pdf = ".pdf";
  static const mp3 = ".mp3";
}

extension SizedBoxExtension on int {
  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());
}
