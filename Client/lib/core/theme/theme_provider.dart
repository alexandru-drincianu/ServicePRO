import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/user_settings_service.dart';

class ThemeProvider extends ChangeNotifier {
  final _userSettingsService = locator<UserSettingsService>();

  /// Current selected theme
  ThemeMode get themeMode {
    return _userSettingsService.themeMode ?? ThemeMode.system;
  }

  /// Changes the theme mode and updates the listeners.
  void changeTheme(ThemeMode themeMode, {bool forceUpdate = false}) {
    if (this.themeMode == themeMode && !forceUpdate) return;
    _userSettingsService.themeMode = themeMode;
    notifyListeners();
  }
}
