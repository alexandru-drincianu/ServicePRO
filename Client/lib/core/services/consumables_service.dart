import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/ConsumableModels/consumable_model.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import 'base_http_service.dart';

class ConsumableService extends BaseHttpService {
  static const _consumablesPath = 'Consumables';

  Future<List<ConsumableModel>> getConsumables() async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          _consumablesPath,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<ConsumableModel> result = body
            .map(
              (item) => ConsumableModel.fromJson(item),
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
    return List<ConsumableModel>.empty();
  }

  Future<ConsumableModel?> getConsumableById(int id) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_consumablesPath/$id",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        ConsumableModel result = ConsumableModel.fromJson(body);
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

  Future<int?> createConsumable(
    ConsumableModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _consumablesPath,
        ),
        json.encode(
          model,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.created) {
        Map<String, dynamic> body = jsonDecode(res.body);
        ConsumableModel result = ConsumableModel.fromJson(body);
        return result.id!;
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

  Future<dynamic> updateConsumable(
    ConsumableModel model,
  ) async {
    try {
      final res = await put(
        buildUri(
          Constants.apiBaseUrl,
          "$_consumablesPath/${model.id}",
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
}
