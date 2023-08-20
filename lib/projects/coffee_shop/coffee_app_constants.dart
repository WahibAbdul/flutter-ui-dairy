import 'package:flutter/material.dart';

abstract class CoffeeAppConstants {
  static Color grey = const Color.fromARGB(255, 20, 24, 30);
  static Color? secondaryTextColor = Colors.grey[600];
  static Color secondaryColor = const Color.fromARGB(255, 237, 130, 76);
  static Color backgroundColor = const Color.fromARGB(255, 15, 17, 20);
  static double buttonRadius = 17.0;
  static double cardRadius = 25.0;

  static Gradient gradientBackground() {
    return const LinearGradient(
      colors: [Color.fromARGB(255, 31, 31, 31), Colors.black],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
