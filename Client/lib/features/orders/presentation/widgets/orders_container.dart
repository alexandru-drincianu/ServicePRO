import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/dialogs/error_dialog.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/busy_indicator.dart';
import '../../provider/orders_provider.dart';
import 'orders_list.dart';
import 'orders_search_bar.dart';

/// [OrdersContainer] is the body of [OrdersPage]. Handles state updates and errors.
class OrdersContainer extends StatefulWidget {
  const OrdersContainer({super.key});

  @override
  State<OrdersContainer> createState() => _OrdersContainerState();
}

class _OrdersContainerState extends State<OrdersContainer> {
  late final OrdersProvider ordersProvider;

  @override
  void initState() {
    super.initState();

    // Add listeners to display messages in case of error states
    ordersProvider = context.read<OrdersProvider>()
      ..addListener(onProviderStateChanged);

    // Fetch orders in post frame callback since calling setState while the app
    // is building is prohibited.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ordersProvider.fetchOrders(),
    );
  }

  @override
  void dispose() {
    ordersProvider.removeListener(onProviderStateChanged);
    super.dispose();
  }

  /// Called whenever the ordersProvider calls notifyListeners()
  void onProviderStateChanged() {
    final fetchOrdersState = ordersProvider.fetchOrdersState;
    final deleteOrderState = ordersProvider.deleteOrderState;

    if (fetchOrdersState.hasError) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return ErrorDialog(
            errorMessage: context.translate(
              fetchOrdersState.error ?? TranslationKeys.fetchOrdersErrorCode,
            ),
            onReturn: Navigator.of(context).pop,
          );
        },
      );
    }

    if (deleteOrderState.hasError) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return ErrorDialog(
            errorMessage: context.translate(
              deleteOrderState.error ?? TranslationKeys.deleteOrderErrorCode,
            ),
            onReturn: Navigator.of(context).pop,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final fetchOrdersState = context.select(
      (OrdersProvider provider) => provider.fetchOrdersState,
    );
    final isBusyDeletingOrder = context.select(
      (OrdersProvider provider) => provider.deleteOrderState.isBusy,
    );

    if (fetchOrdersState.isBusy || isBusyDeletingOrder) {
      return const BusyIndicator();
    }

    if (fetchOrdersState.hasError) {
      return Center(
        child: Text(
          context.translate(
            fetchOrdersState.error ?? TranslationKeys.fetchOrdersErrorCode,
          ),
        ),
      );
    }

    final orders = context.select(
      (OrdersProvider provider) => provider.filteredOrders,
    );

    return Column(
      children: [
        const OrdersSearchBar(),
        Expanded(
          child: OrdersList(
            orders: orders,
          ),
        ),
      ],
    );
  }
}
