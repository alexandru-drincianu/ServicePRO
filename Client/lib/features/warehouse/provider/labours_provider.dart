import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/LabourModels/labour_model.dart';

import '../../../core/locator.dart';
import '../../../core/services/labours_service.dart';

class LaboursProvider extends ChangeNotifier {
  final _laboursService = locator<LabourService>();

  Future<List<LabourModel>> getLabours() async {
    try {
      final res = await _laboursService.getLabours();
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
    return List<LabourModel>.empty();
  }

  Future<LabourModel?> getLabourById(int id) async {
    try {
      final res = await _laboursService.getLabourById(id);
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

  Future<int?> createLabour(LabourModel model) async {
    try {
      final res = await _laboursService.createLabour(model);
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

  Future<dynamic> updateLabour(LabourModel model) async {
    try {
      final res = await _laboursService.updateLabour(model);
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
