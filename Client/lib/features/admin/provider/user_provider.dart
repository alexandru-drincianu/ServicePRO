import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/user_model.dart';
import 'package:service_pro/dtos/paginated_result.dart';

import '../../../core/locator.dart';
import '../../../core/models/user_details.dart';
import '../../../core/services/user_settings_service.dart';

class UserProvider extends ChangeNotifier {
  final _userSettingsService = locator<UserSettingsService>();

  Future<PaginatedResult<UserDetails>> getUsers({
    required int pageIndex,
    required int itemsNumber,
    required String searchTerm,
  }) async {
    try {
      notifyListeners();
      final res = await _userSettingsService.getUsers(
        pageIndex: pageIndex,
        itemsNumber: itemsNumber,
        searchTerm: searchTerm,
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
    return PaginatedResult(rowscount: 0, data: []);
  }

  Future<dynamic> deleteUser({
    required int userId,
  }) async {
    try {
      notifyListeners();
      final res = await _userSettingsService.deleteUser(
        userId: userId,
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
