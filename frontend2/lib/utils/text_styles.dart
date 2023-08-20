import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'Space Grotesk',
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'Space Grotesk',
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Saira',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Saira',
    fontSize: 16,
  );

  static const TextStyle bodySmall =
      TextStyle(fontFamily: 'Saira', fontSize: 14, color: Color(0xffCBCBCB));
}
