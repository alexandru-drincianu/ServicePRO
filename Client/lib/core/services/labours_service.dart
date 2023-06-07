import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/LabourModels/labour_model.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import 'base_http_service.dart';

class LabourService extends BaseHttpService {
  static const _laboursPath = 'Labours';

  Future<List<LabourModel>> getLabours() async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          _laboursPath,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<LabourModel> result = body
            .map(
              (item) => LabourModel.fromJson(item),
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
    return List<LabourModel>.empty();
  }

  Future<LabourModel?> getLabourById(int id) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_laboursPath/$id",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        LabourModel result = LabourModel.fromJson(body);
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

  Future<int?> createLabour(
    LabourModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _laboursPath,
        ),
        json.encode(
          model,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.created) {
        Map<String, dynamic> body = jsonDecode(res.body);
        LabourModel result = LabourModel.fromJson(body);
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

  Future<dynamic> updateLabour(
    LabourModel model,
  ) async {
    try {
      final res = await put(
        buildUri(
          Constants.apiBaseUrl,
          "$_laboursPath/${model.id}",
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

  Future<dynamic> deleteLabour(
    int labourId,
  ) async {
    try {
      final res = await delete(
        buildUri(
          Constants.apiBaseUrl,
          "$_laboursPath/$labourId",
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
