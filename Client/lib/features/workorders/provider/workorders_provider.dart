import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/workorder_model.dart';
import 'package:service_pro/core/services/workorders_service.dart';

import '../../../core/locator.dart';

class WorkordersProvider extends ChangeNotifier {
  final _workorderService = locator<WorkorderService>();

  Future<List<WorkorderModel>> getWorkorders() async {
    try {
      final res = await _workorderService.getWorkorders();
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
    return List<WorkorderModel>.empty();
  }

  Future<WorkorderModel?> getWorkorderById(int id) async {
    try {
      final res = await _workorderService.getWorkorderById(id);
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

  Future<int?> createWorkorder(WorkorderModel model) async {
    try {
      final res = await _workorderService.createWorkorder(model);
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
}
