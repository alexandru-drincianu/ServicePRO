import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';

import '../base_exception.dart';
import '../constants/constants.dart';
import '../constants/translation_keys.dart';
import '../models/order_model.dart';
import 'base_http_service.dart';

/// [OrdersService] is the service used to manage orders from Orders Page
class OrdersService extends BaseHttpService {
  static const ordersRoute = 'orders';

  static OrdersService? _instance;

  OrdersService._();

  factory OrdersService() {
    // We are lazy loading the services by creating the instance only when needed
    _instance ??= OrdersService._();
    return _instance!;
  }

  /// [instance] returns the instance of this singleton
  static OrdersService get instance => OrdersService();

  /// [fetchOrders] returns the list of orders to display in Orders Page
  Future<List<OrderModel>> fetchOrders() async {
    try {
      // Get orders
      final res = await get(
        buildUri(
          Constants.apiBaseUrl,
          ordersRoute,
        ),
        token,
      );

      // If the status is 200, returns orders list
      if (res.statusCode == HttpStatus.ok) {
        final List body = jsonDecode(res.body);
        final orders = body
            .map(
              (item) => OrderModel.fromJson(item),
            )
            .toList();

        Fimber.i('Orders #${orders.length}');
        return orders;
      }

      throw BaseException.fromJson(
        json: jsonDecode(res.body),
        errorId: TranslationKeys.fetchOrdersErrorCode,
        statusCode: res.statusCode,
      );
    } on BaseException {
      // We need this block in order to avoid catching BoilerplateException as
      // an unhandled exception.
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled exception',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: TranslationKeys.fetchOrdersErrorCode,
      );
    }
  }

  /// [deleteOrder] deletes a given order
  Future<void> deleteOrder(int id) async {
    try {
      final res = await delete(
        buildUri(
          Constants.apiBaseUrl,
          '$ordersRoute/$id',
        ),
        token,
      );

      // If the status is not 200, throw exception
      if (res.statusCode != HttpStatus.ok) {
        throw BaseException.fromJson(
          json: jsonDecode(res.body),
          errorId: TranslationKeys.deleteOrderErrorCode,
          statusCode: res.statusCode,
        );
      }
    } on BaseException {
      // We need this block in order to avoid catching BoilerplateException as
      // an unhandled exception.
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled exception',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: TranslationKeys.deleteOrderErrorCode,
      );
    }
  }

  /// [addOrder] creates a new order
  Future<void> addOrder({
    required OrderModel order,
  }) async {
    try {
      final res = await post(
        buildUri(
          Constants.apiBaseUrl,
          ordersRoute,
        ),
        jsonEncode(order.toJson()),
        await token,
      );

      if (res.statusCode != HttpStatus.ok) {
        final body = jsonDecode(res.body);

        final exception = BaseException.fromJson(
          json: body,
          errorId: 'add_order_error',
          statusCode: res.statusCode,
        );
        Fimber.e(exception.message ?? '');
        throw exception;
      }
    } on BaseException {
      // We need this block in order to avoid catching BoilerplateException as
      // an unhandled exception.
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled exception',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: TranslationKeys.createOrderErrorCode,
      );
    }
  }

  /// [updateOrder] updates an existing  order
  Future<void> updateOrder({
    required OrderModel order,
  }) async {
    try {
      final res = await put(
        buildUri(
          Constants.apiBaseUrl,
          '$ordersRoute/${order.id}',
        ),
        jsonEncode(order.toJson()),
        await token,
      );

      if (res.statusCode != HttpStatus.ok) {
        final body = jsonDecode(res.body);

        final exception = BaseException.fromJson(
          json: body,
          errorId: 'update_order_error',
          statusCode: res.statusCode,
        );
        Fimber.e(exception.message ?? '');
        throw exception;
      }
    } on BaseException {
      // We need this block in order to avoid catching BoilerplateException as
      // an unhandled exception.
      rethrow;
    } catch (e, stacktrace) {
      Fimber.e(
        'Unhandled exception',
        ex: e,
        stacktrace: stacktrace,
      );
      throw const BaseException(
        errorId: TranslationKeys.updateOrderErrorCode,
      );
    }
  }
}
