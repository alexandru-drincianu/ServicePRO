import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/models/order_model.dart';
import '../../../../routing/routing.dart';
import '../../provider/orders_provider.dart';
import 'delete_alert_dialog.dart';

/// [OrdersList] is the widget used to display the list of orders in the Orders Page
class OrdersList extends StatelessWidget {
  const OrdersList({required this.orders, super.key});

  /// List of orders to display
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      final noFilterApplied = context.select<OrdersProvider, bool>(
        (provider) => provider.filter == null || provider.filter!.isEmpty,
      );

      return Padding(
        padding: const EdgeInsets.only(top: ThemeConstants.sizeUnitXXXL),
        child: Text(
          context.translate(
            noFilterApplied
                ? TranslationKeys.noOrdersCreated
                : TranslationKeys.noOrdersFound,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Dismissible(
          key: Key('${order.id}'),
          onDismissed: (_) => context.read<OrdersProvider>().deleteOrder(
                order.id!,
              ),
          confirmDismiss: (_) => showDialog(
            context: context,
            builder: (context) => const DeleteAlertDialog(),
          ),
          child: Material(
            child: InkWell(
              onTap: () {
                router.push(
                  ManageOrderRoute(id: order.id, orderModel: order),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    ThemeConstants.paddingS,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.number),
                      Text(order.client),
                      Text(order.capacity.toString()),
                      Text(order.value.toString()),
                      Text(order.deliveryDate),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
