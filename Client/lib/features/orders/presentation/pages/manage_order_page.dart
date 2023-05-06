import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/models/order_model.dart';
import '../widgets/manage_order_container.dart';

/// [ManageOrderPage] is the page displayed under Orders tab in the app.
class ManageOrderPage extends StatelessWidget {
  const ManageOrderPage({
    @PathParam() this.id,
    this.orderModel,
    super.key,
  });

  final int? id;

  final OrderModel? orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            orderModel != null
                ? TranslationKeys.editOrderTitle
                : TranslationKeys.addOrdersTitle,
          ),
        ),
      ),
      body: ManageOrderContainer(
        orderModel: orderModel,
        id: id,
      ),
    );
  }
}
