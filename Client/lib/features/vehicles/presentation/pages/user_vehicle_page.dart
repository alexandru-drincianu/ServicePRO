import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/models/VehicleModels/vehicle_model.dart';
import 'package:service_pro/core/models/WorkorderModels/workorder_model.dart';
import 'package:service_pro/features/vehicles/provider/vehicles_provider.dart';
import 'package:service_pro/features/workorders/provider/workorders_provider.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class UserVehiclesPage extends StatefulWidget {
  final int id;
  const UserVehiclesPage({Key? key, required this.id}) : super(key: key);

  @override
  UserVehiclesPageState createState() => UserVehiclesPageState();
}

class UserVehiclesPageState extends State<UserVehiclesPage> {
  List<VehicleModel> _vehicles = [];
  List<VehicleModel> _filterVehicles = [];
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
    final vehiclesProvider = context.read<VehiclesProvider>();
    final vehiclesData = await vehiclesProvider.getVehiclesForUser(widget.id);
    setState(() {
      _vehicles = vehiclesData;
      _filterVehicles = vehiclesData;
      _setupComplete = true;
    });
  }

  void createWorkorder(int vehicleId) async {
    final workordersProvider = context.read<WorkordersProvider>();
    final model = WorkorderModel(
      id: 0,
      vehicleId: vehicleId,
      status: WorkorderStatus.arrived.index,
      arrivedDate: DateTime.now(),
    );
    final workorderId = await workordersProvider.createWorkorder(model);
    router.replace(WorkorderDetailsRoute(id: workorderId!));
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
                  ? const CircularProgressIndicator()
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
                              hintText: "Enter registration",
                            ),
                            onChanged: (value) {
                              var filteredVehicles = _filterVehicles
                                  .where(
                                    (element) =>
                                        element.registration!.contains(value),
                                  )
                                  .toList();
                              setState(() {
                                _vehicles = filteredVehicles;
                              });
                            },
                          ),
                        ),
                        columns: const [
                          DataColumn(label: Text("Registration")),
                          DataColumn(label: Text("Brand")),
                          DataColumn(label: Text("Model")),
                          DataColumn(label: Text("Mileage")),
                        ],
                        columnSpacing: 25,
                        source: _VehiclesDataSource(
                          _vehicles,
                          createWorkorderCallback: createWorkorder,
                          context: context,
                        ),
                        rowsPerPage: _vehicles.isEmpty
                            ? 1
                            : _vehicles.length < 10
                                ? _vehicles.length
                                : 10,
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

void _showCreateWorkorderDialog(
  VehicleModel vehicle,
  BuildContext context,
  Function(int) createWorkorderCallback,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Create Workorder'),
        content: Text(
          'Do you want to create a workorder for vehicle: "${vehicle.registration}"?',
        ),
        actions: [
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
              createWorkorderCallback(vehicle.id!);
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _VehiclesDataSource extends DataTableSource {
  final List<VehicleModel> _vehicles;
  final Function(int) createWorkorderCallback;
  final BuildContext context;

  _VehiclesDataSource(
    this._vehicles, {
    required this.createWorkorderCallback,
    required this.context,
  });

  @override
  DataRow getRow(int index) {
    final VehicleModel vehicle = _vehicles[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(vehicle.registration!)),
        DataCell(Text(vehicle.brand!)),
        DataCell(Text(vehicle.model!)),
        DataCell(Text(vehicle.mileage.toString())),
      ],
    );
  }

  @override
  int get rowCount => _vehicles.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
