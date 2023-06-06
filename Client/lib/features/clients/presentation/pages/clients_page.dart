import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/UserModels/client_model.dart';
import 'package:service_pro/features/clients/provider/clients_provider.dart';
import 'package:service_pro/routing/app_router.gr.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  ClientsPageState createState() => ClientsPageState();
}

class ClientsPageState extends State<ClientsPage> {
  List<ClientModel> _clients = [];
  List<ClientModel> _filterClients = [];
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
    final clientsProvider = context.read<ClientsProvider>();
    final clientsData = await clientsProvider.getClients();
    setState(() {
      _clients = clientsData;
      _filterClients = clientsData;
      _setupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.clients,
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
                    onPressed: () => router.replace(const CreateClientRoute()),
                    icon: const Icon(Icons.add),
                    label: const Text("Create Client"),
                  ),
                ),
              ),
              !_setupComplete
                  ? const CircularProgressIndicator()
                  : _clients.isEmpty
                      ? const Text("No clients available")
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
                                  hintText: "Enter username",
                                ),
                                onChanged: (value) {
                                  var filteredClients = _filterClients
                                      .where(
                                        (element) =>
                                            element.fullName!.contains(value),
                                      )
                                      .toList();
                                  setState(() {
                                    _clients = filteredClients;
                                  });
                                },
                              ),
                            ),
                            columns: const [
                              DataColumn(label: Text("")),
                              DataColumn(label: Text("Name")),
                              DataColumn(label: Text("Telephone")),
                              DataColumn(label: Text("Email")),
                              DataColumn(label: Text("Location")),
                            ],
                            source: _ClientsDataSource(_clients),
                            rowsPerPage:
                                _clients.length <= 5 ? _clients.length : 5,
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

class _ClientsDataSource extends DataTableSource {
  final List<ClientModel> _clients;

  _ClientsDataSource(this._clients);

  @override
  DataRow getRow(int index) {
    final ClientModel client = _clients[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          GestureDetector(
            onTap: () {
              // Add your desired action here when the cell is tapped
              router.replace(UserDetailsRoute(id: client.id));
            },
            child: const Icon(Icons.visibility),
          ),
        ),
        DataCell(Text(client.fullName!)),
        DataCell(Text(client.telephoneNumber!)),
        DataCell(Text(client.email!)),
        DataCell(Text("${client.address!.city}, ${client.address!.country}")),
      ],
    );
  }

  @override
  int get rowCount => _clients.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
