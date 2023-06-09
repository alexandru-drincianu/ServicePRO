import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/ConsumableModels/consumable_model.dart';
import 'package:service_pro/features/warehouse/provider/consumables_provider.dart';

class ConsumablesSelectionGrid extends StatefulWidget {
  const ConsumablesSelectionGrid({Key? key}) : super(key: key);

  @override
  ConsumablesSelectionGridState createState() =>
      ConsumablesSelectionGridState();
}

class ConsumablesSelectionGridState extends State<ConsumablesSelectionGrid> {
  List<ConsumableModel> _consumables = [];
  List<ConsumableModel> _filterConsumables = [];
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
    final consumablesProvider = context.read<ConsumablesProvider>();
    final consumablesData = await consumablesProvider.getConsumables();
    setState(() {
      _consumables = consumablesData;
      _filterConsumables = consumablesData;
      _setupComplete = true;
    });
  }

  void updateConsumablesList(
    List<ConsumableModel> consumables,
  ) {
    setState(() {
      _consumables = consumables;
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
                              var filteredVehicles = _filterConsumables
                                  .where(
                                    (element) =>
                                        element.description!.contains(value),
                                  )
                                  .toList();
                              setState(() {
                                _consumables = filteredVehicles;
                              });
                            },
                          ),
                        ),
                        columns: const [
                          DataColumn(label: Text("Description")),
                          DataColumn(label: Text("Price")),
                          DataColumn(label: SizedBox(width: 10)),
                        ],
                        source: _ConsumablesDataSource(
                          _consumables,
                          context,
                          updateConsumablesList,
                        ),
                        rowsPerPage: _consumables.isEmpty
                            ? 1
                            : _consumables.length < 5
                                ? _consumables.length
                                : 5,
                        columnSpacing: 100,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConsumablesDataSource extends DataTableSource {
  final List<ConsumableModel> _consumables;
  final BuildContext _context;
  final Function updateConsumablesList;

  _ConsumablesDataSource(
    this._consumables,
    this._context,
    this.updateConsumablesList,
  );

  @override
  DataRow getRow(int index) {
    final ConsumableModel consumable = _consumables[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(consumable.description!)),
        DataCell(Text(consumable.price!.toString())),
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
  int get rowCount => _consumables.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
