import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/helpers/pdf_provider.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/InvoiceModels/invoice_model.dart';
import 'package:service_pro/core/widgets/toast_message.dart';
import 'package:path/path.dart' as path;
import 'package:service_pro/routing/routing.dart';

import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../workorderItems/provider/workorder_item_provider.dart';
import '../../provider/invoices_provider.dart';

class UserInvoicesPage extends StatefulWidget {
  final int id;
  const UserInvoicesPage({Key? key, required this.id}) : super(key: key);

  @override
  UserInvoicesPageState createState() => UserInvoicesPageState();
}

class UserInvoicesPageState extends State<UserInvoicesPage> {
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
    final invoicesData = await invoicesProvider.getInvoicesForUser(widget.id);
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
                          DataColumn(label: Text("Total cost")),
                          DataColumn(label: Text("Status")),
                          DataColumn(label: SizedBox(width: 10)),
                          DataColumn(label: SizedBox(width: 10)),
                        ],
                        columnSpacing: 10,
                        source: _InvoicesDataSource(_invoices, context),
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
  final BuildContext _context;

  _InvoicesDataSource(this._invoices, this._context);

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
        DataCell(Text(invoice.workorder!.totalCost!.toStringAsFixed(2))),
        DataCell(Text(InvoiceStatusString[invoice.invoiceStatus!] ?? '')),
        DataCell(
          GestureDetector(
            onTap: () async {
              var workorderItems = await _context
                  .read<WorkorderItemsProvider>()
                  .getWorkorderItems(invoice.workorderId!);
              File file = await generateInvoicePdf(invoice, workorderItems);
              // ignore: use_build_context_synchronously
              Navigator.push(
                _context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text('PDF Preview'),
                    ),
                    body: Column(
                      children: [
                        Expanded(
                          child: PDFView(
                            filePath: file.path,
                            enableSwipe: true,
                            swipeHorizontal: true,
                            autoSpacing: false,
                            pageFling: false,
                            onError: (error) {
                              showToastFailed('Could not open PDF!');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                path.basename(file.path),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                  onPressed: () {
                                    savePDFFile(file);
                                  },
                                  icon: const Icon(Icons.download),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.picture_as_pdf,
              color: Colors.green,
            ),
          ),
        ),
        DataCell(
          invoice.invoiceStatus == InvoiceStatus.open.index
              ? GestureDetector(
                  onTap: () {
                    print("pay");
                  },
                  child: const Icon(
                    Icons.payment,
                    color: Colors.green,
                  ),
                )
              : const SizedBox(),
        ),
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

Future<void> savePDFFile(File pdfFile) async {
  try {
    final dir = await getExternalStorageDirectory();
    final path = '${dir?.path}/invoice.pdf';
    await pdfFile.copy(path);
    showToastSucceded('PDF saved successfully!');
  } on PlatformException catch (e) {
    showToastFailed('Failed to save PDF: ${e.message}');
  }
}
