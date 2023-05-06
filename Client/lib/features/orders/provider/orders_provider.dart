import 'package:flutter/material.dart';

import '../../../core/locator.dart';
import '../../../core/models/base_state.dart';
import '../../../core/models/order_model.dart';
import '../../../core/services/orders_service.dart';

typedef FetchOrdersState = ActionState;
typedef DeleteOrderState = ActionState;
typedef AddOrUpdateState = ActionState;

/// [OrdersProvider] is the provider of the Orders Page
class OrdersProvider extends ChangeNotifier {
  OrdersProvider({OrdersService? ordersService})
      : _ordersService = ordersService ?? locator<OrdersService>();

  final OrdersService _ordersService;

  String? _filter;
  List<OrderModel>? _orders;

  /// Returns the current filter applied on orders list
  String? get filter => _filter;

  /// [fetchOrdersState] is the state of [fetchOrders] action
  var fetchOrdersState = const FetchOrdersState.empty();

  /// [addOrUpdateOrderState] is the state of [createOrUpdateOrder] action
  var addOrUpdateOrderState = const AddOrUpdateState.empty();

  /// [deleteOrderState] is the state of [deleteOrder] action
  var deleteOrderState = const DeleteOrderState.empty();

  /// [fetchOrders] fetches the orders from the server
  Future<void> fetchOrders() async {
    try {
      // Set state to busy
      fetchOrdersState = const FetchOrdersState.busy();
      notifyListeners();

      // Fetch orders from api
      _orders = await _ordersService.fetchOrders();
      _orders?.removeWhere((element) => element.id == null);

      fetchOrdersState = successActionState;

      // Reset filter
      _filter = null;
    } catch (ex) {
      // Set state to failure
      fetchOrdersState = FetchOrdersState.error(ex.toString());
    } finally {
      // Rebuild listeners even if state is success or failure
      notifyListeners();
    }
  }

  /// Returns the list of filtered orders to display in Orders List widget
  List<OrderModel> get filteredOrders {
    // If filter is null or empty we return all orders. Same goes if orders list
    // is null.
    if (_filter == null || _filter!.isEmpty || _orders == null) {
      return _orders ?? const [];
    }

    final filter = _filter!.toLowerCase();
    return _orders!
        .where(
          (order) =>
              order.number.toLowerCase().contains(filter) ||
              order.client.toLowerCase().contains(filter),
        )
        .toList(growable: false);
  }

  /// Updates filter and rebuilds widgets
  void filterOrders(String query) {
    if (query == _filter) return;
    _filter = query;

    // Update widgets
    notifyListeners();
  }

  /// [deleteOrder] deletes a given order and re-fetches the orders
  Future<void> deleteOrder(int id) async {
    try {
      // Set state to busy
      deleteOrderState = const DeleteOrderState.busy();
      notifyListeners();

      // Delete order by given id
      await _ordersService.deleteOrder(id);

      // Re-fetch orders

      _orders = await _ordersService.fetchOrders();

      deleteOrderState = successActionState;
    } catch (ex) {
      // Set state to failure
      deleteOrderState = DeleteOrderState.error(ex.toString());
    } finally {
      // Rebuild listeners even if state is success or failure
      notifyListeners();
    }
  }

  /// [createOrUpdateOrder] creates a new order if its Id property is null or updates an existing one otherwise.
  Future<void> createOrUpdateOrder({
    required OrderModel order,
  }) async {
    try {
      addOrUpdateOrderState = const BaseState.busy();

      if (order.id == null) {
        notifyListeners();
        await _ordersService.addOrder(
          order: order,
        );
        addOrUpdateOrderState = successActionState;
      } else {
        notifyListeners();
        await _ordersService.updateOrder(
          order: order,
        );
        addOrUpdateOrderState = successActionState;
      }
    } catch (ex) {
      addOrUpdateOrderState = BaseState.error(ex.toString());
    } finally {
      notifyListeners();
    }
  }

  ///[resetAddOrUpdateOrderState] resets the [addOrUpdateOrderState]
  void resetAddOrUpdateOrderState() {
    addOrUpdateOrderState = const BaseState.empty();
  }
}
