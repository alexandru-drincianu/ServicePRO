import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/vehicle_model.dart';
import 'package:service_pro/core/models/vehicle_scan_model.dart';

import '../../../core/locator.dart';
import '../../../core/services/vehicles_service.dart';

class VehiclesProvider extends ChangeNotifier {
  final _vehicleService = locator<VehicleService>();

  Future<List<VehicleModel>> getVehicles() async {
    try {
      final res = await _vehicleService.getVehicles();
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
    return List<VehicleModel>.empty();
  }

  Future<VehicleModel?> getVehicleById(int id) async {
    try {
      final res = await _vehicleService.getVehicleById(id);
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

  Future<dynamic> createVehicle(VehicleModel vehicle) async {
    try {
      final res = await _vehicleService.createVehicle(vehicle);
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

  Future<VehicleScanModel?> sendLicenseplatePhoto(XFile photo) async {
    try {
      final res = await _vehicleService.sendLicenseplatePhoto(photo);
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
