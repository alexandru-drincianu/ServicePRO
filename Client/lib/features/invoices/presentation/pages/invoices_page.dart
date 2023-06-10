import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/InvoiceModels/invoice_model.dart';

import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../provider/invoices_provider.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({Key? key}) : super(key: key);

  @override
  InvoicesPageState createState() => InvoicesPageState();
}

class InvoicesPageState extends State<InvoicesPage> {
  List<InvoiceModel> _invoices = [];
  List<InvoiceModel> _filterInvoices = [];
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
    final invoicesProvider = context.read<InvoicesProvider>();
    final invoicesData = await invoicesProvider.getInvoices();
    setState(() {
      _invoices = invoicesData;
      _filterInvoices = invoicesData;
      _setupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.invoices,
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
                              hintText: "Enter number",
                            ),
                            onChanged: (value) {
                              var filteredInvoices = _filterInvoices
                                  .where(
                                    (element) =>
                                        element.number!.contains(value),
                                  )
                                  .toList();
                              setState(() {
                                _invoices = filteredInvoices;
                              });
                            },
                          ),
                        ),
                        columns: const [
                          DataColumn(label: Text("Number")),
                          DataColumn(label: Text("Vehicle")),
                          DataColumn(label: Text("Created Date")),
                          DataColumn(label: Text("Client")),
                          DataColumn(label: Text("Total cost")),
                          DataColumn(label: Text("Status")),
                        ],
                        columnSpacing: 20,
                        source: _InvoicesDataSource(_invoices),
                        rowsPerPage: _invoices.isEmpty
                            ? 1
                            : _invoices.length < 10
                                ? _invoices.length
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

class _InvoicesDataSource extends DataTableSource {
  final List<InvoiceModel> _invoices;

  _InvoicesDataSource(
    this._invoices,
  );

  @override
  DataRow getRow(int index) {
    final InvoiceModel invoice = _invoices[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(invoice.number!)),
        DataCell(Text(invoice.workorder!.vehicle!.registration!)),
        DataCell(Text(
          DateFormat('yyyy-MM-dd').format(invoice.createdDate!),
        )),
        DataCell(Text(invoice.workorder!.vehicle!.user!.name)),
        DataCell(Text(invoice.workorder!.totalCost!.toStringAsFixed(2))),
        DataCell(Text(InvoiceStatusString[invoice.invoiceStatus!] ?? '')),
      ],
    );
  }

  @override
  int get rowCount => _invoices.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
