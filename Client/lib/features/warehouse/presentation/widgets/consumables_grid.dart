import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/ConsumableModels/consumable_model.dart';
import 'package:service_pro/features/warehouse/provider/consumables_provider.dart';

import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

class ConsumablesGrid extends StatefulWidget {
  const ConsumablesGrid({Key? key}) : super(key: key);

  @override
  ConsumablesGridState createState() => ConsumablesGridState();
}

class ConsumablesGridState extends State<ConsumablesGrid> {
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
              SizedBox(
                height: 100,
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () => router.replace(ConsumableDetailsRoute()),
                    icon: const Icon(Icons.add),
                    label: const Text("Add Consumable"),
                  ),
                ),
              ),
              !_setupComplete
                  ? const Center(child: CircularProgressIndicator())
                  : _consumables.isEmpty
                      ? const Text("No consumables available")
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
                                        (element) => element.description!
                                            .contains(value),
                                      )
                                      .toList();
                                  setState(() {
                                    _consumables = filteredVehicles;
                                  });
                                },
                              ),
                            ),
                            columns: const [
                              DataColumn(label: SizedBox(width: 10)),
                              DataColumn(label: Text("Description")),
                              DataColumn(label: Text("Price")),
                              DataColumn(label: SizedBox(width: 10)),
                            ],
                            source: _ConsumablesDataSource(
                              _consumables,
                              context,
                              updateConsumablesList,
                            ),
                            rowsPerPage: _consumables.length <= 5
                                ? _consumables.length
                                : 5,
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
        DataCell(
          GestureDetector(
            onTap: () {
              router.replace(ConsumableDetailsRoute(id: consumable.id!));
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
        DataCell(Text(consumable.description!)),
        DataCell(Text(consumable.price!.toString())),
        DataCell(
          GestureDetector(
            onTap: () => showConfirmationDialog(
              _context,
              consumable,
              _consumables,
              updateConsumablesList,
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
  int get rowCount => _consumables.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

Future<void> showConfirmationDialog(
  BuildContext context,
  ConsumableModel consumable,
  List<ConsumableModel> consumables,
  updateConsumablesList,
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
                  await context.read<ConsumablesProvider>().deleteConsumable(
                        consumable.id!,
                      );
              if (response.statusCode == 204) {
                List<ConsumableModel> updatedConsumables = consumables
                    .where((element) => element.id != consumable.id)
                    .toList();
                updateConsumablesList(updatedConsumables);
                BotToast.showText(
                  text: 'Consumable deleted!',
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
