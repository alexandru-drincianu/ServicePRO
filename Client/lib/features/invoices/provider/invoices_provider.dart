import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:service_pro/core/models/InvoiceModels/invoice_model.dart';
import 'package:service_pro/core/services/invoices_service.dart';

import '../../../core/locator.dart';
import '../../../core/models/WorkorderModels/workorder_model.dart';

class InvoicesProvider extends ChangeNotifier {
  final _invoiceService = locator<InvoiceService>();

  Future<List<InvoiceModel>> getInvoices() async {
    try {
      final res = await _invoiceService.getInvoices();
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
    return List<InvoiceModel>.empty();
  }

  Future<List<InvoiceModel>> getInvoicesForUser(int userId) async {
    try {
      final res = await _invoiceService.getInvoicesForUser(userId);
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
    return List<InvoiceModel>.empty();
  }

  Future<InvoiceModel?> getInvoiceById(int id) async {
    try {
      final res = await _invoiceService.getInvoiceById(id);
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

  Future<int?> createInvoice(InvoiceModel model) async {
    try {
      final res = await _invoiceService.createInvoice(model);
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

  Future<int?> createInvoiceFromWorkorder(WorkorderModel model) async {
    try {
      final res = await _invoiceService.createInvoiceFromWorkorder(model);
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

  Future<dynamic> updateInvoice(InvoiceModel model) async {
    try {
      final res = await _invoiceService.updateInvoice(model);
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

  Future<dynamic> deleteInvoice(int invoiceId) async {
    try {
      final res = await _invoiceService.deleteInvoice(invoiceId);
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
