import 'package:flutter/material.dart';

class CustomBottomAppBarTheme extends BottomAppBarTheme {
  final Color color;
  final double elevation;

  const CustomBottomAppBarTheme({
    this.color = Colors.transparent,
    this.elevation = 0,
  }) : super(
    color: color,
    elevation: elevation,
  );

  static CustomBottomAppBarTheme get customButtonTheme {
    return const CustomBottomAppBarTheme();
  }
}

