import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import '../models/WorkorderModels/workorder_item_model.dart';
import 'base_http_service.dart';

class WorkorderItemService extends BaseHttpService {
  static const _workorderItemsPath = 'WorkorderItems';

  Future<List<WorkorderItemModel>> getWorkorderItems(int workorderId) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_workorderItemsPath/workorder/$workorderId",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<WorkorderItemModel> result = body
            .map(
              (item) => WorkorderItemModel.fromJson(item),
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
    return List<WorkorderItemModel>.empty();
  }

  Future<WorkorderItemModel?> getWorkorderItemById(int id) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_workorderItemsPath/$id",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        WorkorderItemModel result = WorkorderItemModel.fromJson(body);
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

  Future<int?> createWorkorderItem(
    WorkorderItemModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _workorderItemsPath,
        ),
        json.encode(
          model,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.created) {
        Map<String, dynamic> body = jsonDecode(res.body);
        WorkorderItemModel result = WorkorderItemModel.fromJson(body);
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

  Future<dynamic> updateWorkorderItem(
    WorkorderItemModel model,
  ) async {
    try {
      final res = await put(
        buildUri(
          Constants.apiBaseUrl,
          "$_workorderItemsPath/${model.id}",
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

  Future<dynamic> deleteWorkorderItem(
    int workorderItemId,
  ) async {
    try {
      final res = await delete(
        buildUri(
          Constants.apiBaseUrl,
          "$_workorderItemsPath/$workorderItemId",
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
