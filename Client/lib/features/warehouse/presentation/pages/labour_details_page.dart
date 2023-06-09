import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/LabourModels/labour_model.dart';
import 'package:service_pro/core/widgets/toast_message.dart';
import 'package:service_pro/features/warehouse/provider/labours_provider.dart';

import '../../../../core/widgets/app_drawer.dart';

class LabourDetailsPage extends StatefulWidget {
  final int? id;
  const LabourDetailsPage({Key? key, this.id}) : super(key: key);

  @override
  LabourDetailsPageState createState() => LabourDetailsPageState();
}

class LabourDetailsPageState extends State<LabourDetailsPage> {
  bool _setupComplete = false;
  bool _inEdit = false;
  late LabourModel? _labourData = const LabourModel(
    description: "",
    hourlyWage: 0,
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
    final laboursProvider = context.read<LaboursProvider>();
    final consumableData = await laboursProvider.getLabourById(widget.id!);
    setState(() {
      _labourData = consumableData!;
      _setupComplete = true;
    });
  }

  Future<void> _createLabour(BuildContext context) async {
    final laboursProvider = context.read<LaboursProvider>();
    var int = await laboursProvider.createLabour(_labourData!);
    if (int != null) {
      showToastSucceded('Labour created!');
    } else {
      showToastFailed("Error while creating!");
    }
  }

  Future<void> _updateLabour(BuildContext context) async {
    final laboursProvider = context.read<LaboursProvider>();
    var response = await laboursProvider.updateLabour(_labourData!);
    if (response.statusCode == 200) {
      showToastSucceded('Labour details updated!');
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
                  text: _labourData?.description ?? "",
                  property: "description",
                ),
                _buildRow(
                  icon: Icons.currency_exchange,
                  label: 'Hourly Wage',
                  text: _labourData?.hourlyWage.toString() ?? "",
                  property: "hourlyWage",
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
                                    _updateLabour(context),
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
                                    _createLabour(context),
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
            var updatedLabourData = _labourData?.copyWith(description: value);
            setState(() {
              _labourData = updatedLabourData;
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      case "hourlyWage":
        return TextFormField(
          initialValue: text,
          decoration: const InputDecoration(labelText: ''),
          keyboardType: const TextInputType.numberWithOptions(),
          onChanged: (value) {
            var updatedLabourData = _labourData?.copyWith(
              hourlyWage: double.tryParse(value) ?? 0.0,
            );
            setState(() {
              _labourData = updatedLabourData;
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
