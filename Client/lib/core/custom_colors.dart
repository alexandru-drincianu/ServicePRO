import 'package:flutter/material.dart';

/// Color palette used in the current application
class CustomColors {
  const CustomColors._();

  static const Map<int, Color> nroGreenColorCodes = {
    50: Color(0xFFFCFBE5),
    100: Color(0xFFF7F5BF),
    200: Color(0xFFE8E680),
    300: Color(0xFFDFDB4D),
    400: Color(0xFFD8D426),
    500: nroGreen,
    600: Color(0xffccc700),
    700: nroSecondaryGreen,
    800: Color(0xFFADA000),
    900: Color(0xFF907A00),
  };

  static const MaterialColor nroGreenMC = MaterialColor(
    0xFFD1CC00,
    nroGreenColorCodes,
  );

  static const Color nroGreen = Color(0xFFD1CC00);
  static const Color nroSecondaryGreen = Color(0xffBFB700);
  static const Color grey = Color(0xfff5f5f5);
  static const Color splashColor = Color(0xff294159);
}
