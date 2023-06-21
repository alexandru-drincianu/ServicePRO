import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/ConsumableModels/consumable_model.dart';
import 'package:service_pro/core/widgets/toast_message.dart';
import 'package:service_pro/features/warehouse/provider/consumables_provider.dart';

import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class ConsumableDetailsPage extends StatefulWidget {
  final int? id;
  const ConsumableDetailsPage({Key? key, this.id}) : super(key: key);

  @override
  ConsumableDetailsPageState createState() => ConsumableDetailsPageState();
}

class ConsumableDetailsPageState extends State<ConsumableDetailsPage> {
  bool _setupComplete = false;
  bool _inEdit = false;
  late ConsumableModel? _consumableData = const ConsumableModel(
    description: "",
    price: 0,
    id: 0,
  );

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      initialize();
    } else {
      _inEdit = true;
      _setupComplete = true;
    }
  }

  Future<void> initialize() async {
    final consumablesProvider = context.read<ConsumablesProvider>();
    final consumableData =
        await consumablesProvider.getConsumableById(widget.id!);
    setState(() {
      _consumableData = consumableData!;
      _setupComplete = true;
    });
  }

  Future<void> _createConsumable(BuildContext context) async {
    final consumablesProvider = context.read<ConsumablesProvider>();
    var int = await consumablesProvider.createConsumable(_consumableData!);
    if (int != null) {
      showToastSucceded('Consumable created!');
    } else {
      showToastFailed("Error while creating!");
    }
  }

  Future<void> _updateConsumable(BuildContext context) async {
    final consumablesProvider = context.read<ConsumablesProvider>();
    var response = await consumablesProvider.updateConsumable(_consumableData!);
    if (response.statusCode == 200) {
      showToastSucceded('Consumable details updated!');
    } else {
      showToastFailed(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.consumableDetails,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => router.replace(const WarehouseRoute()),
        ),
      ),
      body: _setupComplete
          ? SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                _buildRow(
                  icon: Icons.description,
                  label: 'Description:',
                  text: _consumableData?.description ?? "",
                  property: "description",
                ),
                _buildRow(
                  icon: Icons.currency_exchange,
                  label: 'Price',
                  text: _consumableData?.price.toString() ?? "",
                  property: "price",
                ),
                !_inEdit
                    ? SizedBox(
                        height: 100,
                        child: Center(
                          child: ElevatedButton.icon(
                            onPressed: () => {
                              setState(() {
                                _inEdit = true;
                              }),
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 100,
                        child: Center(
                          child: widget.id != null
                              ? ElevatedButton.icon(
                                  onPressed: () async => {
                                    _updateConsumable(context),
                                    setState(() {
                                      _inEdit = false;
                                    }),
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  label: const Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )
                              : ElevatedButton.icon(
                                  onPressed: () async => {
                                    _createConsumable(context),
                                    setState(() {
                                      _inEdit = false;
                                    }),
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  label: const Text(
                                    "Create",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                        ),
                      ),
              ]),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const AppDrawer(),
    );
  }

  Container _buildRow({
    required IconData icon,
    required String label,
    required String text,
    required String property,
    String? buttonLabel,
    VoidCallback? onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                _inEdit
                    ? _propertyField(property, text)
                    : Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ],
            ),
          ),
          if (buttonLabel != null)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    buttonLabel,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _propertyField(String property, String text) {
    switch (property) {
      case "description":
        return TextFormField(
          initialValue: text,
          decoration: const InputDecoration(labelText: ''),
          onChanged: (value) {
            var updatedConsumableData =
                _consumableData?.copyWith(description: value);
            setState(() {
              _consumableData = updatedConsumableData;
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      case "price":
        return TextFormField(
          initialValue: text,
          decoration: const InputDecoration(labelText: ''),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (value) {
            var updatedConsumableData =
                _consumableData?.copyWith(price: double.tryParse(value) ?? 0.0);
            setState(() {
              _consumableData = updatedConsumableData;
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      default:
        return const Text(
          'Invalid property',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        );
    }
  }
}
