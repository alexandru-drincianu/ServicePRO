import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../../../core/dialogs/error_dialog.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/models/base_state.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/widgets/busy_indicator.dart';
import '../../../../core/widgets/date_picker.dart';
import '../../../../routing/app_router.dart';
import '../../provider/orders_provider.dart';

/// [ManageOrderContainer] is the widget that displays information of a new order
///
///  to be created or of an existing order.
class ManageOrderContainer extends StatefulWidget {
  final OrderModel? orderModel;

  const ManageOrderContainer({
    this.orderModel,
    int? id,
    super.key,
  });

  @override
  State<ManageOrderContainer> createState() => _ManageOrderContainerState();
}

class _ManageOrderContainerState extends State<ManageOrderContainer> {
  late final TextEditingController orderNumberController;
  late final TextEditingController customerController;
  late final TextEditingController capacityController;
  late final TextEditingController valueController;
  final formKey = GlobalKey<FormState>();
  late final GlobalKey<FormFieldState> orderNumberKey;
  late final GlobalKey<FormFieldState> orderCustomerKey;
  late final GlobalKey<FormFieldState> orderCapacityKey;
  late final GlobalKey<FormFieldState> orderValueKey;

  late bool isChecked;
  DateTime? deliveryDate;
  late final OrdersProvider ordersProvider;

  @override
  void initState() {
    super.initState();

    // Add listeners to display messages in case of error states
    ordersProvider = context.read<OrdersProvider>()
      ..addListener(onProviderStateChanged);
    ordersProvider.resetAddOrUpdateOrderState();

    orderNumberKey = GlobalKey<FormFieldState>();
    orderCustomerKey = GlobalKey<FormFieldState>();
    orderCapacityKey = GlobalKey<FormFieldState>();
    orderValueKey = GlobalKey<FormFieldState>();

    orderNumberController =
        TextEditingController(text: widget.orderModel?.number.toString());
    customerController =
        TextEditingController(text: widget.orderModel?.client.toString());
    capacityController =
        TextEditingController(text: widget.orderModel?.capacity.toString());
    valueController =
        TextEditingController(text: widget.orderModel?.value.toString());
    isChecked = widget.orderModel?.isActive ?? false;
    deliveryDate = widget.orderModel?.deliveryDate != null
        ? DateTime.parse(widget.orderModel!.deliveryDate)
        : null;
  }

  @override
  void dispose() {
    ordersProvider.removeListener(onProviderStateChanged);
    orderNumberController.dispose();
    customerController.dispose();
    capacityController.dispose();
    valueController.dispose();
    super.dispose();
  }

  /// Called whenever the ordersProvider calls notifyListeners()
  void onProviderStateChanged() {
    ordersProvider.addOrUpdateOrderState.whenOrNull(
      error: (exception) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return ErrorDialog(
            errorMessage: context.translate(
              exception ?? TranslationKeys.fetchOrdersErrorCode,
            ),
            onReturn: Navigator.of(context).pop,
          );
        },
      ),
      data: (_) {
        resetInputs();
        BotToast.showText(
          text: context.translate(
            TranslationKeys.addOrderSuccess,
          ),
          duration: const Duration(
            seconds: Constants.toastDisplayTime,
          ),
        );
        router.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final addOrderState = context.select<OrdersProvider, BaseState>(
      (provider) => provider.addOrUpdateOrderState,
    );

    if (addOrderState.isBusy) {
      return const BusyIndicator();
    }

    return Center(
      child: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(
            ThemeConstants.paddingL,
          ),
          children: [
            TextFormField(
              key: orderNumberKey,
              decoration: InputDecoration(
                labelText: context.translate(
                  TranslationKeys.orderNumber,
                ),
              ),
              controller: orderNumberController,
              validator: validateInput,
              onChanged: (value) {
                orderNumberKey.currentState!.validate();
              },
            ),
            TextFormField(
              key: orderCustomerKey,
              decoration: InputDecoration(
                labelText: context.translate(
                  TranslationKeys.orderCustomer,
                ),
              ),
              controller: customerController,
              validator: validateInput,
              onChanged: (value) {
                orderCustomerKey.currentState!.validate();
              },
            ),
            TextFormField(
              key: orderCapacityKey,
              decoration: InputDecoration(
                labelText: context.translate(
                  TranslationKeys.orderCapacity,
                ),
              ),
              keyboardType: TextInputType.number,
              controller: capacityController,
              validator: validateInput,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              onChanged: (value) {
                orderCapacityKey.currentState!.validate();
              },
            ),
            TextFormField(
              key: orderValueKey,
              decoration: InputDecoration(
                labelText: context.translate(
                  TranslationKeys.orderValue,
                ),
              ),
              keyboardType: TextInputType.number,
              controller: valueController,
              validator: validateInput,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              onChanged: (value) {
                orderValueKey.currentState!.validate();
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue!;
                });
              },
              title: Text(
                context.translate(
                  TranslationKeys.orderActive,
                ),
              ),
            ),
            DatePicker(
              labelText: context.translate(
                TranslationKeys.orderDeliveryDate,
              ),
              selectedDate: deliveryDate,
              mandatory: true,
              defaultDate: context.translate(
                TranslationKeys.mandatoryInput,
              ),
              startDate: deliveryDate ?? DateTime.now(),
              onDateSelected: (value) {
                deliveryDate = value;
              },
            ),
            ElevatedButton(
              child: Text(
                context
                    .translate(
                      TranslationKeys.submit,
                    )
                    .toUpperCase(),
              ),
              onPressed: () {
                if (formKey.currentState!.validate() && deliveryDate != null) {
                  final order = OrderModel(
                    id: widget.orderModel?.id,
                    number: orderNumberController.text,
                    client: customerController.text,
                    capacity: int.parse(capacityController.text),
                    value: double.parse(valueController.text),
                    deliveryDate: deliveryDate!.toUtc().toIso8601String(),
                    isActive: true,
                    isDeleted: false,
                  );
                  ordersProvider.createOrUpdateOrder(order: order);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return context.translate(TranslationKeys.mandatoryInput);
    }
    return null;
  }

  void resetInputs() {
    orderNumberController.clear();
    capacityController.clear();
    customerController.clear();
    valueController.clear();
  }
}
