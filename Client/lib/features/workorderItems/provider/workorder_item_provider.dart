import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/WorkorderModels/workorder_item_model.dart';
import 'package:service_pro/core/services/workorder_item_service.dart';

import '../../../core/locator.dart';

class WorkorderItemsProvider extends ChangeNotifier {
  final _workorderItemService = locator<WorkorderItemService>();

  Future<List<WorkorderItemModel>> getWorkorderItems(int workorderId) async {
    try {
      final res = await _workorderItemService.getWorkorderItems(workorderId);
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
    return List<WorkorderItemModel>.empty();
  }

  Future<WorkorderItemModel?> getWorkorderItemById(int id) async {
    try {
      final res = await _workorderItemService.getWorkorderItemById(id);
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

  Future<int?> createWorkorderItem(WorkorderItemModel model) async {
    try {
      final res = await _workorderItemService.createWorkorderItem(model);
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

  Future<dynamic> updateWorkorderItem(WorkorderItemModel model) async {
    try {
      final res = await _workorderItemService.updateWorkorderItem(model);
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

  Future<dynamic> deleteWorkorderItem(int consumableId) async {
    try {
      final res = await _workorderItemService.deleteWorkorderItem(consumableId);
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
