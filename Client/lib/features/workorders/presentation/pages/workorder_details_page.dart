import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/WorkorderModels/workorder_model.dart';
import 'package:service_pro/features/workorders/provider/workorders_provider.dart';

import '../../../../core/custom_colors.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class WorkorderDetailsPage extends StatefulWidget {
  final int id;
  const WorkorderDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  WorkorderDetailsPageState createState() => WorkorderDetailsPageState();
}

class WorkorderDetailsPageState extends State<WorkorderDetailsPage> {
  bool _setupComplete = false;
  late WorkorderModel _workorderData;
  final FocusNode _focusNode = FocusNode();
  late String _remarks;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final workordersProvider = context.read<WorkordersProvider>();
    final workorderData = await workordersProvider.getWorkorderById(widget.id);
    setState(() {
      _workorderData = workorderData!;
      _setupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.workorderDetails,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => router.replace(const WorkordersRoute()),
        ),
      ),
      body: _setupComplete
          ? SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: CustomColors.nroGreen,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _workorderData.number!,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: WorkorderStatusColor[_workorderData.status!],
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              WorkorderStatusString[_workorderData.status!] ??
                                  '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuButton<WorkorderStatus>(
                          icon: const Icon(Icons.arrow_drop_down),
                          itemBuilder: (BuildContext context) {
                            return WorkorderStatus.values
                                .map((WorkorderStatus status) {
                              return PopupMenuItem<WorkorderStatus>(
                                value: status,
                                child:
                                    Text(WorkorderStatusString[status.index]!),
                              );
                            }).toList();
                          },
                          onSelected: (WorkorderStatus selectedStatus) async {
                            var updatedWorkorder = _workorderData.copyWith(
                              status: selectedStatus.index,
                            );
                            await updateAndShowToast(
                              "Status updated",
                              updatedWorkorder,
                            );
                          },
                          offset: const Offset(0, 40),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildRow(
                  icon: Icons.car_rental_outlined,
                  label: 'Vehicle registration:',
                  text: _workorderData.vehicle!.registration!,
                ),
                _buildRow(
                  icon: Icons.confirmation_num,
                  label: 'VIN:',
                  text: _workorderData.vehicle!.vin!,
                ),
                _buildRow(
                  icon: Icons.ev_station,
                  label: 'Fuel:',
                  text: FuelTypeString[_workorderData.vehicle!.fuelType!] ?? '',
                ),
                _buildRow(
                  icon: Icons.note,
                  label: 'Remarks:',
                  text: "",
                ),
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      TextFormField(
                        focusNode: _focusNode,
                        initialValue: _workorderData.remarks,
                        maxLines: 5,
                        onChanged: (value) {
                          setState(() {
                            _remarks = value;
                          });
                        },
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.nroGreen,
                          ),
                          child: IconButton(
                            onPressed: () async {
                              var updatedWorkorder =
                                  _workorderData.copyWith(remarks: _remarks);
                              await updateAndShowToast(
                                "Remarks updated",
                                updatedWorkorder,
                              );
                              _focusNode.unfocus();
                            },
                            icon: const Icon(Icons.save),
                            iconSize: 30,
                            color: Colors.black,
                            tooltip: 'Save',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const AppDrawer(),
    );
  }

  Future<void> updateAndShowToast(
    String message,
    WorkorderModel updatedWorkorder,
  ) async {
    var response = await context
        .read<WorkordersProvider>()
        .updateWorkorder(updatedWorkorder);
    if (response.statusCode == 200) {
      setState(() {
        _workorderData = updatedWorkorder;
      });
      BotToast.showText(
        text: message,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        contentColor: Colors.green,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),
      );
    } else {
      BotToast.showText(
        text: response.body,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        contentColor: Colors.red,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),
      );
    }
  }

  Container _buildRow({
    required IconData icon,
    required String label,
    required String text,
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
          Column(
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
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
}
