import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:service_pro/core/models/AddressModels/address_model.dart';
import 'package:service_pro/core/models/InvoiceModels/invoice_model.dart';

import '../models/WorkorderModels/workorder_item_model.dart';

Future<File> generateInvoicePdf(
  InvoiceModel invoice,
  List<WorkorderItemModel> workorderItems,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pw.Text(
                'SERVICEPRO',
                style:
                    pw.TextStyle(fontSize: 30, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Name:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(invoice.workorder!.vehicle!.user!.fullName!),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Address:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(formatAddress(
                    invoice.workorder!.vehicle!.user!.address!,
                  )),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Email:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(invoice.workorder!.vehicle!.user!.email!),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Telephone number:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Text(invoice.workorder!.vehicle!.user!.telephoneNumber!),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Text(
                'Invoice nr: ${invoice.number}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Workorder items',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                columnWidths: {
                  0: const pw.FlexColumnWidth(4), // Description column
                  1: const pw.FlexColumnWidth(1), // Quantity column
                  2: const pw.FlexColumnWidth(2), // Total column
                },
                children: [
                  // Table header
                  pw.TableRow(
                    children: [
                      pw.Text(
                        'Description',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text(
                          'Quantity',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text(
                          'Total',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // Table rows
                  ...workorderItems.map(
                    (item) => pw.TableRow(
                      children: [
                        pw.Text(item.description ?? ''),
                        pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text('${item.quantity ?? ''}'),
                        ),
                        pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(item.totalCost!.toStringAsFixed(2)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.bottomRight,
                child: pw.Text(
                  'TOTAL: ${calculateTotal(workorderItems).toStringAsFixed(2)}',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/${invoice.number}.pdf");

  return await file.writeAsBytes(await pdf.save());
}

String formatAddress(AddressModel address) {
  return "${address.street}, ${address.city}, ${address.country}";
}

double calculateTotal(List<WorkorderItemModel> workorderItems) {
  double total = 0;
  for (var item in workorderItems) {
    total += item.totalCost ?? 0;
  }
  return total;
}
