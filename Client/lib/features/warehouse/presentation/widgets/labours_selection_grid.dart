import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/LabourModels/labour_model.dart';
import 'package:service_pro/features/warehouse/provider/labours_provider.dart';

import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class LaboursSelectionGrid extends StatefulWidget {
  const LaboursSelectionGrid({Key? key}) : super(key: key);

  @override
  LaboursSelectionGridState createState() => LaboursSelectionGridState();
}

class LaboursSelectionGridState extends State<LaboursSelectionGrid> {
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
              !_setupComplete
                  ? const Center(child: CircularProgressIndicator())
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
                                    (element) =>
                                        element.description!.contains(value),
                                  )
                                  .toList();
                              setState(() {
                                _labours = filteredVehicles;
                              });
                            },
                          ),
                        ),
                        columns: const [
                          DataColumn(label: Text("Description")),
                          DataColumn(label: Text("Hourly Wage")),
                          DataColumn(label: SizedBox(width: 10)),
                        ],
                        source: _laboursDataSource(
                          _labours,
                          context,
                          updateLaboursList,
                        ),
                        rowsPerPage: _labours.isEmpty
                            ? 1
                            : _labours.length < 5
                                ? _labours.length
                                : 5,
                        columnSpacing: 70,
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
        DataCell(Text(labour.description!)),
        DataCell(Text(labour.hourlyWage!.toString())),
        DataCell(
          GestureDetector(
            onTap: () => {},
            child: const Icon(
              Icons.add,
              color: Colors.green,
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
