import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/WorkorderModels/workorder_item_model.dart';
import 'package:service_pro/core/widgets/toast_message.dart';
import 'package:service_pro/features/warehouse/presentation/widgets/consumables_selection_grid.dart';
import 'package:service_pro/features/warehouse/presentation/widgets/labours_selection_grid.dart';

import '../../../../core/models/WorkorderModels/workorder_model.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';
import '../../provider/workorder_item_provider.dart';

class WorkorderItemsPage extends StatefulWidget {
  final WorkorderModel workorder;
  const WorkorderItemsPage({Key? key, required this.workorder})
      : super(key: key);

  @override
  WorkorderItemsPageState createState() => WorkorderItemsPageState();
}

class WorkorderItemsPageState extends State<WorkorderItemsPage> {
  List<WorkorderItemModel> _workorderItems = [];
  bool _setupComplete = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initialize() async {
    final workorderItemsProvider = context.read<WorkorderItemsProvider>();
    final workorderItemsData =
        await workorderItemsProvider.getWorkorderItems(widget.workorder.id!);
    setState(() {
      _workorderItems = workorderItemsData;
      _setupComplete = true;
    });
  }

  void updateWorkorderItemList(
    List<WorkorderItemModel> workorderItems,
  ) {
    setState(() {
      _workorderItems = workorderItems;
    });
  }

  Future<void> addWorkorderItem(WorkorderItemModel workorderItem) async {
    final workorderItemsProvider = context.read<WorkorderItemsProvider>();
    int? workorderItemId =
        await workorderItemsProvider.createWorkorderItem(workorderItem);
    if (workorderItemId == null || workorderItemId == 0) {
      showToastFailed("Failed adding item");
    } else {
      showToastSucceded("Item added");
      setState(() {
        _workorderItems.add(workorderItem.copyWith(id: workorderItemId));
      });
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var wi in _workorderItems) {
      totalPrice += wi.price!;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${context.translate(
            TranslationKeys.workorderItems,
          )} - ${widget.workorder.number}",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              router.replace(WorkorderDetailsRoute(id: widget.workorder.id!)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: SizedBox(
            height: 750,
            child: Column(
              children: [
                widget.workorder.isInvoiced!
                    ? const SizedBox()
                    : SizedBox(
                        height: 50,
                        child: Center(
                          child: ElevatedButton(
                            child: const Text('Add workorder item'),
                            onPressed: () {
                              _showModal(
                                context,
                                addWorkorderItem,
                                widget.workorder,
                              );
                            },
                          ),
                        ),
                      ),
                !_setupComplete
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: PaginatedDataTable(
                          header: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Total Price: ${calculateTotalPrice().toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          columns: const [
                            DataColumn(label: Text("Type")),
                            DataColumn(label: Text("Description")),
                            DataColumn(label: Text("Quantity")),
                            DataColumn(label: Text("Minutes")),
                            DataColumn(label: Text("Price")),
                            DataColumn(label: SizedBox(width: 10)),
                          ],
                          source: _workorderItemsDataSource(
                            _workorderItems,
                            context,
                            updateWorkorderItemList,
                            widget.workorder,
                          ),
                          columnSpacing: 10,
                          rowsPerPage: _workorderItems.isEmpty
                              ? 1
                              : _workorderItems.length < 10
                                  ? _workorderItems.length
                                  : 10,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

class _workorderItemsDataSource extends DataTableSource {
  late final List<WorkorderItemModel> _workorderItems;
  final BuildContext _context;
  final Function updateWorkorderItemList;
  final WorkorderModel workorder;

  _workorderItemsDataSource(
    this._workorderItems,
    this._context,
    this.updateWorkorderItemList,
    this.workorder,
  );

  @override
  DataRow getRow(int index) {
    final WorkorderItemModel workorderItem = _workorderItems[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(workorderItem.itemType == WorkorderItemType.consumable.index
            ? const Icon(Icons.label)
            : const Icon(Icons.perm_identity)),
        DataCell(Text(workorderItem.description!)),
        DataCell(workorderItem.itemType == WorkorderItemType.consumable.index
            ? Text(workorderItem.quantity.toString())
            : const Icon(Icons.remove)),
        DataCell(workorderItem.itemType == WorkorderItemType.labour.index
            ? Text(workorderItem.minutes.toString())
            : const Icon(Icons.remove)),
        DataCell(Text(workorderItem.price!.toStringAsFixed(2))),
        DataCell(
          workorder.isInvoiced!
              ? const SizedBox()
              : GestureDetector(
                  onTap: () => showConfirmationDialog(
                    _context,
                    workorderItem,
                    _workorderItems,
                    updateWorkorderItemList,
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
  int get rowCount => _workorderItems.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

Future<void> showConfirmationDialog(
  BuildContext context,
  WorkorderItemModel workorderItem,
  List<WorkorderItemModel> workorderItems,
  updateworkorderItemsList,
) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Are you sure you want to delete ${workorderItem.description}?',
        ),
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
              final response = await context
                  .read<WorkorderItemsProvider>()
                  .deleteWorkorderItem(
                    workorderItem.id!,
                  );
              if (response.statusCode == 204) {
                List<WorkorderItemModel> updatedworkorderItems = workorderItems
                    .where((element) => element.id != workorderItem.id)
                    .toList();
                updateworkorderItemsList(updatedworkorderItems);
                showToastSucceded("Item deleted!");
              } else {
                showToastFailed(response.body);
              }
            },
          ),
        ],
      );
    },
  );
}

void _showModal(
  BuildContext context,
  void Function(WorkorderItemModel workorderItem) addWorkorderItem,
  WorkorderModel workorder,
) {
  late bool showConsumables = true;
  late bool showLabours = false;
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 600,
            color: Colors.black12,
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            showConsumables = true;
                            showLabours = false;
                          });
                        },
                        child: const Text("Consumables"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            showConsumables = false;
                            showLabours = true;
                          });
                        },
                        child: const Text("Labours"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (showConsumables)
                    ConsumablesSelectionGrid(
                      addWorkorderItem: addWorkorderItem,
                      workorder: workorder,
                    ),
                  if (showLabours)
                    LaboursSelectionGrid(
                      addWorkorderItem: addWorkorderItem,
                      workorder: workorder,
                    ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
