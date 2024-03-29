import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/VehicleModels/vehicle_model.dart';
import 'package:service_pro/core/models/VehicleModels/vehicle_scan_model.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import 'base_http_service.dart';

class VehicleService extends BaseHttpService {
  static const _vehiclesPath = 'Vehicles';
  static const _createVehiclePath = 'Vehicles/createVehicle';
  static const _uploadPhotoPath = 'Vehicles/upload';

  Future<List<VehicleModel>> getVehicles() async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          _vehiclesPath,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<VehicleModel> result = body
            .map(
              (item) => VehicleModel.fromJson(item),
            )
            .toList();
        return result;
      }
    } on BaseException {
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: 'registration_error',
      );
    }
    return List<VehicleModel>.empty();
  }

  Future<List<VehicleModel>> getVehiclesForUser(int userId) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_vehiclesPath/user/$userId",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<VehicleModel> result = body
            .map(
              (item) => VehicleModel.fromJson(item),
            )
            .toList();
        return result;
      }
    } on BaseException {
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: 'registration_error',
      );
    }
    return List<VehicleModel>.empty();
  }

  Future<VehicleModel?> getVehicleById(int id) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_vehiclesPath/$id",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        VehicleModel result = VehicleModel.fromJson(body);
        return result;
      }
    } on BaseException {
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: 'registration_error',
      );
    }
    return null;
  }

  Future<dynamic> createVehicle(
    VehicleModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _createVehiclePath,
        ),
        json.encode(
          model,
        ),
        token,
      );
      return res;
    } on BaseException {
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: 'registration_error',
      );
    }
  }

  Future<VehicleScanModel?> sendLicenseplatePhoto(
    XFile photo,
  ) async {
    try {
      final res = await sendPhoto(
        buildUri(
          Constants.apiBaseUrl,
          _uploadPhotoPath,
        ),
        photo,
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        VehicleScanModel result = VehicleScanModel.fromJson(body);
        return result;
      }
    } on BaseException {
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: 'registration_error',
      );
    }
    return null;
  }
}
