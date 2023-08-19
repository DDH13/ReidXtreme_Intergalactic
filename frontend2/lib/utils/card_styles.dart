import 'package:flutter/material.dart';

class CustomCardTheme extends CardTheme {
  static CardTheme get customButtonTheme {
    return CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      margin: const EdgeInsets.all(10),
      color: const Color(0xff1F2933).withOpacity(0.6),
    );
  }
}
