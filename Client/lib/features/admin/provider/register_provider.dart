import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';

import '../../../core/base_exception.dart';
import '../../../core/enums/enums.dart';
import '../../../core/locator.dart';
import '../../../core/services/user_settings_service.dart';

class RegisterProvider extends ChangeNotifier {
  final _userSettingsService = locator<UserSettingsService>();

  /// The [register] method is used to create an user with specific details.
  Future<dynamic> register({
    required String username,
    required String password,
    required String fullname,
    required UserRole role,
  }) async {
    try {
      notifyListeners();
      final res = await _userSettingsService.register(
        username: username,
        password: password,
        fullname: fullname,
        role: role,
      );
      return res;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
    } finally {
      // After changing state to success or error, rebuild widgets.
      notifyListeners();
    }
  }
}
