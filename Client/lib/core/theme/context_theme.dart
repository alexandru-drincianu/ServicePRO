import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'theme_provider.dart';

/// Extension on [BuildContext] to add [currentTheme] getter.
extension ContextTheme on BuildContext {
  /// Returns the current theme mode
  ThemeMode get currentTheme => watch<ThemeProvider>().themeMode;
}
