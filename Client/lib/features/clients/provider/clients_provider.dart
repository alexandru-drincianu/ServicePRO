import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/client_model.dart';
import 'package:service_pro/core/services/users_service.dart';

import '../../../core/locator.dart';

class ClientsProvider extends ChangeNotifier {
  final _userService = locator<UserService>();

  /// The [getClients] method is used to create an user with specific details.
  Future<List<ClientModel>> getClients() async {
    try {
      final res = await _userService.getClients();
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
    return List<ClientModel>.empty();
  }

  Future<dynamic> createClient(ClientModel client) async {
    try {
      final res = await _userService.createClient(client);
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
