import 'package:flutter/material.dart';

class CustomBottomAppBarTheme extends BottomAppBarTheme {
  static BottomAppBarTheme get customButtonTheme {
    return const BottomAppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    );
  }
}
