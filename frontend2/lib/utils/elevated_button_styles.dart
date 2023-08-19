import 'package:flutter/material.dart';

class CustomElevatedButtonTheme extends ElevatedButtonThemeData {
  static ElevatedButtonThemeData get customButtonTheme {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red; // Change to desired pressed color
            }
            return Colors.blue; // Change to desired default color
          },
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.white,
            width: 0.7,
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black, // Change to desired foreground color
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
