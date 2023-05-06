import 'package:flutter/material.dart';

import '../custom_colors.dart';

final lightThemeData = ThemeData(
  primarySwatch: CustomColors.nroGreenMC,
  colorScheme: const ColorScheme.light(
    primary: CustomColors.nroGreen,
    secondary: CustomColors.nroSecondaryGreen,
  ),
);

final darkThemeData = ThemeData(
  primarySwatch: CustomColors.nroGreenMC,
  colorScheme: const ColorScheme.dark(
    primary: CustomColors.nroGreen,
    secondary: CustomColors.nroSecondaryGreen,
    surface: CustomColors.nroGreen,
    onSurface: Colors.black,
  ),
);
