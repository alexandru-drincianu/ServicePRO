import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../provider/orders_provider.dart';
import '../widgets/orders_container.dart';

/// [OrdersPage] is the page where all orders are displayed. It supports CRUD on
/// orders.
class OrdersPage extends StatelessWidget implements AutoRouteWrapper {
  const OrdersPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OrdersProvider(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.ordersTitle,
          ),
        ),
      ),
      body: const OrdersContainer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          router.pushNamed(Routes.createOrder);
        },
        child: const Icon(Icons.add),
      ),
      drawer: const AppDrawer(),
    );
  }
}
