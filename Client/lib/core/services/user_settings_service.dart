import 'package:flutter/material.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/services/register_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator.dart';
import '../models/user_model.dart';
import 'login_service.dart';
import 'shared_preference_service.dart';

/// [UserSettingsService] is the service used to manage the user settings.
/// Communicates directly with [SharedPreferences] to keep everything in sync.
class UserSettingsService {
  final _sharedPreferences = locator<SharedPreferenceService>();

  bool _loaded = false;
  UserModel? _user;

  /// Returns true if the user details have been loaded already
  bool get isLoaded => _loaded;

  /// Logged in user details.
  UserModel? get user => _user;

  /// The access token of the current session.
  String? get accessToken => _user?.token;

  /// The current selected [Locale].
  Locale? get locale => _user?.locale;

  /// The current selected [ThemeMode].
  ThemeMode? get themeMode => _user?.themeMode;

  /// Returns true if the user is authenticated
  bool get isAuthenticated {
    final token = user?.token;
    return token != null && !JwtDecoder.isExpired(token);
  }

  set locale(Locale? locale) {
    if (_user == null) return;
    _user = _user?.copyWith(locale: locale);
    _sharedPreferences.saveUser(_user!);
  }

  set themeMode(ThemeMode? themeMode) {
    if (_user == null) return;
    _user = _user?.copyWith(themeMode: themeMode);
    _sharedPreferences.saveUser(_user!);
  }

  /// Loads the last logged in user values from shared preferences.
  Future<void> load() async {
    // Since everything is in sync automatically, we want to avoid loading the
    // same stuff multiple times in the event an user decides to go to /init on
    // web.
    if (_loaded) return;
    _loaded = true;

    // Read the user data from shared preferences
    try {
      _user = await _sharedPreferences.readUser();
    } catch (_) {}

    // Check if user is valid, otherwise clear data.
    if (!isAuthenticated) await logout();
  }

  /// Logs in a user by his username and password
  Future<void> login({
    required String username,
    required String password,
  }) async {
    _user = await locator<LoginService>().login(username, password);
    await _sharedPreferences.saveUser(_user!);
  }

  Future<dynamic> register({
    required String username,
    required String password,
    required String fullname,
    required UserRole role,
  }) async {
    return await locator<RegisterService>().register(
      username,
      password,
      fullname,
      role,
    );
  }

  /// Logs out an user. Clears all saved settings.
  Future<void> logout() async {
    _user = null;
    await _sharedPreferences.clear();
  }
}
