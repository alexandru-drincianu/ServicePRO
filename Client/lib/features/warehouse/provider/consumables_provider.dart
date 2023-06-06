import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/ConsumableModels/consumable_model.dart';
import 'package:service_pro/core/services/consumables_service.dart';

import '../../../core/locator.dart';

class ConsumablesProvider extends ChangeNotifier {
  final _consumableService = locator<ConsumableService>();

  Future<List<ConsumableModel>> getConsumables() async {
    try {
      final res = await _consumableService.getConsumables();
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
    return List<ConsumableModel>.empty();
  }

  Future<ConsumableModel?> getConsumableById(int id) async {
    try {
      final res = await _consumableService.getConsumableById(id);
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
    return null;
  }

  Future<int?> createConsumable(ConsumableModel model) async {
    try {
      final res = await _consumableService.createConsumable(model);
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
    return null;
  }

  Future<dynamic> updateConsumable(ConsumableModel model) async {
    try {
      final res = await _consumableService.updateConsumable(model);
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
