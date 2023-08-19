import 'package:flutter/material.dart';

class CustomFloatingActionButtonTheme extends FloatingActionButtonThemeData {
  static FloatingActionButtonThemeData get customButtonTheme {
    return FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
          color: Colors.white,
          width: 0.7,
        ),
      ),
    );
  }
}
