import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/vehicle_model.dart';
import 'package:service_pro/features/vehicles/provider/vehicles_provider.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  VehiclesPageState createState() => VehiclesPageState();
}

class VehiclesPageState extends State<VehiclesPage> {
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
    final vehiclesData = await vehiclesProvider.getVehicles();
    setState(() {
      _vehicles = vehiclesData;
      _filterVehicles = vehiclesData;
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
              SizedBox(
                height: 100,
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () => router.replace(const CreateVehicleRoute()),
                    icon: const Icon(Icons.add),
                    label: const Text("Create Vehicle"),
                  ),
                ),
              ),
              !_setupComplete
                  ? const CircularProgressIndicator()
                  : _vehicles.isEmpty
                      ? const Text("No vehicles available")
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
                                        (element) => element.registration!
                                            .contains(value),
                                      )
                                      .toList();
                                  setState(() {
                                    _vehicles = filteredVehicles;
                                  });
                                },
                              ),
                            ),
                            columns: const [
                              DataColumn(label: Text("")),
                              DataColumn(label: Text("Registration")),
                              DataColumn(label: Text("Client")),
                              DataColumn(label: Text("Brand")),
                              DataColumn(label: Text("Model")),
                              DataColumn(label: Text("Mileage")),
                            ],
                            source: _VehiclesDataSource(_vehicles),
                            rowsPerPage:
                                _vehicles.length <= 5 ? _vehicles.length : 5,
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
  final List<VehicleModel> _vehicles;

  _VehiclesDataSource(this._vehicles);

  @override
  DataRow getRow(int index) {
    final VehicleModel vehicle = _vehicles[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          GestureDetector(
            onTap: () {
              // Add your desired action here when the cell is tapped
              router.replace(VehicleDetailsRoute(id: vehicle.id!));
            },
            child: const Icon(Icons.visibility),
          ),
        ),
        DataCell(Text(vehicle.registration!)),
        DataCell(Text(vehicle.user!.name)),
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
