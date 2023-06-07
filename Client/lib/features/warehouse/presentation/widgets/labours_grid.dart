import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/LabourModels/labour_model.dart';
import 'package:service_pro/features/warehouse/provider/labours_provider.dart';

import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class LaboursGrid extends StatefulWidget {
  const LaboursGrid({Key? key}) : super(key: key);

  @override
  LaboursGridState createState() => LaboursGridState();
}

class LaboursGridState extends State<LaboursGrid> {
  List<LabourModel> _labours = [];
  List<LabourModel> _filteredLabours = [];
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
    final laboursProvider = context.read<LaboursProvider>();
    final laboursData = await laboursProvider.getLabours();
    setState(() {
      _labours = laboursData;
      _filteredLabours = laboursData;
      _setupComplete = true;
    });
  }

  void updateLaboursList(
    List<LabourModel> labours,
  ) {
    setState(() {
      _labours = labours;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: SizedBox(
          height: 600,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () => router.replace(LabourDetailsRoute()),
                    icon: const Icon(Icons.add),
                    label: const Text("Add Labour"),
                  ),
                ),
              ),
              !_setupComplete
                  ? const Center(child: CircularProgressIndicator())
                  : _labours.isEmpty
                      ? const Text("No labours available")
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
                                  hintText: "Enter description",
                                ),
                                onChanged: (value) {
                                  var filteredVehicles = _filteredLabours
                                      .where(
                                        (element) => element.description!
                                            .contains(value),
                                      )
                                      .toList();
                                  setState(() {
                                    _labours = filteredVehicles;
                                  });
                                },
                              ),
                            ),
                            columns: const [
                              DataColumn(label: SizedBox(width: 10)),
                              DataColumn(label: Text("Description")),
                              DataColumn(label: Text("Hourly Wage")),
                              DataColumn(label: Text("Minutes")),
                              DataColumn(label: SizedBox(width: 10)),
                            ],
                            source: _laboursDataSource(
                              _labours,
                              context,
                              updateLaboursList,
                            ),
                            rowsPerPage:
                                _labours.length <= 5 ? _labours.length : 5,
                            columnSpacing: 15,
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

class _laboursDataSource extends DataTableSource {
  late final List<LabourModel> _labours;
  final BuildContext _context;
  final Function updateLaboursList;

  _laboursDataSource(
    this._labours,
    this._context,
    this.updateLaboursList,
  );

  @override
  DataRow getRow(int index) {
    final LabourModel labour = _labours[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          GestureDetector(
            onTap: () {
              router.replace(LabourDetailsRoute(id: labour.id!));
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
        DataCell(Text(labour.description!)),
        DataCell(Text(labour.hourlyWage!.toString())),
        DataCell(Text(labour.minutes!.toString())),
        DataCell(
          GestureDetector(
            onTap: () => showConfirmationDialog(
              _context,
              labour,
              _labours,
              updateLaboursList,
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => _labours.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

Future<void> showConfirmationDialog(
  BuildContext context,
  LabourModel labour,
  List<LabourModel> labours,
  updateLaboursList,
) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('This action cannot be undone.'),
        actions: <Widget>[
          TextButton(
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text('YES'),
            onPressed: () async {
              Navigator.of(context).pop(true);
              final response =
                  await context.read<LaboursProvider>().deleteLabour(
                        labour.id!,
                      );
              if (response.statusCode == 204) {
                List<LabourModel> updatedLabours = labours
                    .where((element) => element.id != labour.id)
                    .toList();
                updateLaboursList(updatedLabours);
                BotToast.showText(
                  text: 'Labour deleted!',
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
            },
          ),
        ],
      );
    },
  );
}
