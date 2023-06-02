import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import '../models/workorder_model.dart';
import 'base_http_service.dart';

class WorkorderService extends BaseHttpService {
  static const _workordersPath = 'Workorder';

  Future<List<WorkorderModel>> getWorkorders() async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          _workordersPath,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<WorkorderModel> result = body
            .map(
              (item) => WorkorderModel.fromJson(item),
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
    return List<WorkorderModel>.empty();
  }

  Future<WorkorderModel?> getWorkorderById(int id) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_workordersPath/$id",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        WorkorderModel result = WorkorderModel.fromJson(body);
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

  Future<int?> createWorkorder(
    WorkorderModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _workordersPath,
        ),
        json.encode(
          model,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.created) {
        Map<String, dynamic> body = jsonDecode(res.body);
        WorkorderModel result = WorkorderModel.fromJson(body);
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

  Future<dynamic> updateWorkorder(
    WorkorderModel model,
  ) async {
    try {
      final res = await put(
        buildUri(
          Constants.apiBaseUrl,
          "$_workordersPath/${model.id}",
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
