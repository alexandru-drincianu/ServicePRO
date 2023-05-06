import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';

import '../../../core/base_exception.dart';
import '../../../core/locator.dart';
import '../../../core/models/base_state.dart';
import '../../../core/services/user_settings_service.dart';

/// [LoginProvider] is the provider of the Login Page. Handles authentication.
class LoginProvider extends ChangeNotifier {
  final _userSettingsService = locator<UserSettingsService>();
  BaseState<Void, BaseException> _authenticationState;

  /// State of the user authentication.
  BaseState<Void, BaseException> get authenticationState =>
      _authenticationState;

  LoginProvider() : _authenticationState = const BaseState.empty();

  /// Loads the user details from Shared Preferences and updates authentication
  /// state.
  Future<void> checkLoggedInUser() async {
    try {
      await _userSettingsService.load();
    } catch (_) {}

    // If the user is authenticated update the state
    _authenticationState = _userSettingsService.isAuthenticated
        ? const BaseState.data(Void())
        : const BaseState.empty();
    notifyListeners();
  }

  /// Resets the authentication state
  void resetState() {
    _authenticationState = const BaseState.empty();
    notifyListeners();
  }

  /// The [login] method is used to authenticate an user with a specified login account.
  ///
  /// On success, it will navigate to the next page.
  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      // Change auth state to busy and rebuild widgets
      _authenticationState = const BaseState.busy();
      notifyListeners();

      await _userSettingsService.login(
        username: username,
        password: password,
      );

      // Change auth state to success and rebuild widgets
      _authenticationState = const BaseState.data(Void());
    } on BaseException catch (e) {
      // For [BaseException] we want to directly set them on state to avoid them
      // being caught in the general exception block.
      _authenticationState = BaseState.error(e);
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      _authenticationState = const BaseState.error(
        BaseException(errorId: 'login_error'),
      );
    } finally {
      // After changing state to success or error, rebuild widgets.
      notifyListeners();
    }
  }

  /// Logs out the current user.
  Future<void> logout() async {
    _authenticationState = const BaseState.empty();
    await _userSettingsService.logout();
    notifyListeners();
  }
}
