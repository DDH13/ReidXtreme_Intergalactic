import 'package:flutter/material.dart';

class CustomCardTheme extends CardTheme {
  final ShapeBorder shape;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final Color color;

  CustomCardTheme({
    ShapeBorder? shape,
    double? elevation,
    EdgeInsetsGeometry? margin,
    Color? color,
  })  : shape = shape ?? RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
        elevation = elevation ?? 0,
        margin = margin ?? const EdgeInsets.all(10),
        color = color ?? const Color(0xff1F2933).withOpacity(0.6),
        super(
        shape: shape,
        elevation: elevation,
        margin: margin,
        color: color,
      );

  static CardTheme get customCardTheme {
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

