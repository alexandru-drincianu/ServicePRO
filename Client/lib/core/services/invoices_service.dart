import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/InvoiceModels/invoice_model.dart';
import 'package:service_pro/core/models/WorkorderModels/workorder_model.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import 'base_http_service.dart';

class InvoiceService extends BaseHttpService {
  static const _invoicesPath = 'Invoices';

  Future<List<InvoiceModel>> getInvoices() async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          _invoicesPath,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        List<dynamic> body = jsonDecode(res.body);
        List<InvoiceModel> result = body
            .map(
              (item) => InvoiceModel.fromJson(item),
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
    return List<InvoiceModel>.empty();
  }

  Future<InvoiceModel?> getInvoiceById(int id) async {
    try {
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          "$_invoicesPath/$id",
        ),
        token,
      );
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = jsonDecode(res.body);
        InvoiceModel result = InvoiceModel.fromJson(body);
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

  Future<int?> createInvoice(
    InvoiceModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          _invoicesPath,
        ),
        json.encode(
          model,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.created) {
        Map<String, dynamic> body = jsonDecode(res.body);
        InvoiceModel result = InvoiceModel.fromJson(body);
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

  Future<int?> createInvoiceFromWorkorder(
    WorkorderModel model,
  ) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          "$_invoicesPath/fromWorkorder",
        ),
        json.encode(
          model,
        ),
        token,
      );
      if (res.statusCode == HttpStatus.created) {
        Map<String, dynamic> body = jsonDecode(res.body);
        InvoiceModel result = InvoiceModel.fromJson(body);
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

  Future<dynamic> updateInvoice(
    InvoiceModel model,
  ) async {
    try {
      final res = await put(
        buildUri(
          Constants.apiBaseUrl,
          "$_invoicesPath/${model.id}",
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

  Future<dynamic> deleteInvoice(
    int invoiceId,
  ) async {
    try {
      final res = await delete(
        buildUri(
          Constants.apiBaseUrl,
          "$_invoicesPath/$invoiceId",
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
