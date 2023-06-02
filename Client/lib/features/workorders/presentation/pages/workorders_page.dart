import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/models/workorder_model.dart';
import 'package:service_pro/features/workorders/provider/workorders_provider.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class WorkordersPage extends StatefulWidget {
  const WorkordersPage({Key? key}) : super(key: key);

  @override
  WorkordersPageState createState() => WorkordersPageState();
}

class WorkordersPageState extends State<WorkordersPage> {
  List<WorkorderModel> _workorders = [];
  List<WorkorderModel> _filterWorkorders = [];
  bool _setupComplete = false;
  final _searchtermController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _searchtermController.dispose();
    super.dispose();
  }

  Future<void> initialize() async {
    final workordersProvider = context.read<WorkordersProvider>();
    final workordersData = await workordersProvider.getWorkorders();
    setState(() {
      _workorders = workordersData;
      _filterWorkorders = workordersData;
      _setupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.vehicles,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              !_setupComplete
                  ? const Center(child: CircularProgressIndicator())
                  : _workorders.isEmpty
                      ? const Text("No workorders available")
                      : Expanded(
                          child: PaginatedDataTable(
                            header: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: TextField(
                                controller: _searchtermController,
                                decoration: const InputDecoration(
                                  hintText: "Enter registration or number",
                                ),
                                onChanged: (value) {
                                  var filteredVehicles = _filterWorkorders
                                      .where(
                                        (element) => element
                                            .vehicle!.registration!
                                            .contains(value),
                                      )
                                      .toList();
                                  setState(() {
                                    _workorders = filteredVehicles;
                                  });
                                },
                              ),
                            ),
                            columns: const [
                              DataColumn(label: SizedBox(width: 10)),
                              DataColumn(label: Text("Number")),
                              DataColumn(label: Text("Vehicle")),
                              DataColumn(label: Text("Client")),
                              DataColumn(label: Text("Total cost")),
                              DataColumn(label: Text("Status")),
                            ],
                            columnSpacing: 20,
                            source: _VehiclesDataSource(_workorders),
                            rowsPerPage: _workorders.length <= 5
                                ? _workorders.length
                                : 5,
                          ),
                        ),
            ],
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

class _VehiclesDataSource extends DataTableSource {
  final List<WorkorderModel> _workorders;

  _VehiclesDataSource(
    this._workorders,
  );

  @override
  DataRow getRow(int index) {
    final WorkorderModel workorder = _workorders[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          GestureDetector(
            onTap: () {
              router.replace(WorkorderDetailsRoute(id: workorder.id!));
            },
            child: const Icon(
              Icons.visibility,
              color: Color.fromARGB(
                255,
                58,
                4,
                152,
              ),
            ),
          ),
        ),
        DataCell(Text(workorder.number!)),
        DataCell(Text(workorder.vehicle!.registration!)),
        DataCell(Text(workorder.vehicle!.user!.name)),
        DataCell(Text(workorder.totalCost!.toString())),
        DataCell(Text(WorkorderStatusString[workorder.status!] ?? '')),
      ],
    );
  }

  @override
  int get rowCount => _workorders.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
