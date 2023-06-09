import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/UserModels/user_details.dart';
import 'package:service_pro/core/widgets/toast_message.dart';
import 'package:service_pro/features/admin/provider/user_provider.dart';

import '../../../../core/input_validators/mandatory_input_validator.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../dtos/paginated_result.dart';
import '../../provider/register_provider.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  AdminPanelPageState createState() => AdminPanelPageState();
}

class AdminPanelPageState extends State<AdminPanelPage> {
  bool _showUserList = false;
  bool _showCreateMechanicForm = false;
  List<UserDetails> _users = [];
  List<UserDetails> _filterUsers = [];
  int _usersCount = 0;
  bool sort = true;
  bool _showLoader = false;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _searchtermController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    _searchtermController.dispose();
    super.dispose();
  }

  Future<void> _toggleUserList(
    PaginatedResult<UserDetails> paginatedResult,
  ) async {
    setState(() {
      _showUserList = true;
      _showCreateMechanicForm = false;
      _users = paginatedResult.data;
      _filterUsers = paginatedResult.data;
      _usersCount = paginatedResult.rowscount;
    });
  }

  void updateUserList(
    List<UserDetails> user,
    int userCount,
  ) {
    setState(() {
      _users = user;
      _usersCount = userCount;
    });
  }

  void _toggleCreateMechanicForm() {
    setState(() {
      _showUserList = false;
      _showCreateMechanicForm = true;
    });
  }

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        _filterUsers.sort((a, b) => a.name.compareTo(b.name));
        updateUserList(_filterUsers, _filterUsers.length);
      } else {
        _filterUsers.sort((a, b) => b.name.compareTo(a.name));
        updateUserList(_filterUsers, _filterUsers.length);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.adminPanel,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _showLoader = true;
                    });
                    final users = await context.read<UserProvider>().getUsers(
                          pageIndex: 0,
                          itemsNumber: 1000,
                          searchTerm: "",
                        );
                    await _toggleUserList(users);
                    setState(() {
                      // add this line to update the state
                      _showLoader = false;
                    });
                  },
                  child: Text(context.translate(
                    TranslationKeys.userList,
                  )),
                ),
                ElevatedButton(
                  onPressed: _toggleCreateMechanicForm,
                  child: Text(context.translate(
                    TranslationKeys.createMechanic,
                  )),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_showUserList)
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: _showLoader
                          ? const CircularProgressIndicator()
                          : PaginatedDataTable(
                              sortColumnIndex: 0,
                              sortAscending: sort,
                              header: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: TextField(
                                  controller: _searchtermController,
                                  decoration: const InputDecoration(
                                    hintText: "Enter username",
                                  ),
                                  onChanged: (value) {
                                    _users = _filterUsers
                                        .where(
                                          (element) =>
                                              element.name.contains(value),
                                        )
                                        .toList();
                                    updateUserList(_users, _users.length);
                                  },
                                ),
                              ),
                              columns: [
                                DataColumn(
                                  label: const Text('Name'),
                                  onSort: (columnIndex, ascending) {
                                    setState(() {
                                      sort = !sort;
                                    });

                                    onsortColum(columnIndex, ascending);
                                  },
                                ),
                                const DataColumn(label: Text('Role')),
                                const DataColumn(label: Text('Actions')),
                              ],
                              source: _UserDataSource(
                                _users,
                                _usersCount,
                                context,
                                updateUserList,
                              ),
                              rowsPerPage: 5,
                              columnSpacing: 80,
                            ),
                    ),
                  ],
                ),
              ),
            if (_showCreateMechanicForm)
              Expanded(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          validator: (username) =>
                              MandatoryInputValidator.validate(
                            username,
                            context.translate(
                              'mandatory_input',
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: context.translate(
                              TranslationKeys.username,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          validator: (password) =>
                              MandatoryInputValidator.validate(
                            password,
                            context.translate(
                              'mandatory_input',
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: context.translate(
                              TranslationKeys.password,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _fullnameController,
                          validator: (fullname) =>
                              MandatoryInputValidator.validate(
                            fullname,
                            context.translate(
                              'mandatory_input',
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: context.translate(
                              TranslationKeys.fullName,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState == null ||
                                !formKey.currentState!.validate()) {
                              return;
                            }

                            var response =
                                await context.read<RegisterProvider>().register(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                      fullname: _fullnameController.text,
                                      role: UserRole.mechanic,
                                    );

                            if (response.statusCode == 200) {
                              final mechanicName =
                                  jsonDecode(response.body)['fullName'];
                              showToastSucceded(
                                'Mechanic "$mechanicName" created!',
                              );
                              _usernameController.clear();
                              _passwordController.clear();
                              _fullnameController.clear();
                            } else {
                              showToastFailed(response.body);
                            }
                          },
                          child: Text(context.translate(
                            TranslationKeys.createAccount,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

Future<void> showConfirmationDialog(
  BuildContext context,
  UserDetails user,
  List<UserDetails> users,
  updateUserList,
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
              final response = await context.read<UserProvider>().deleteUser(
                    userId: user.id,
                  );
              if (response.statusCode == 204) {
                List<UserDetails> updatedUsers =
                    users.where((element) => element.id != user.id).toList();
                updateUserList(updatedUsers, updatedUsers.length);
                showToastSucceded('User deleted!');
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

class _UserDataSource extends DataTableSource {
  final List<UserDetails> _users;
  final int _usersCount;
  final BuildContext _context;
  final int _selectedRowCount = 0;
  final Function updateUserList;

  _UserDataSource(
    this._users,
    this._usersCount,
    this._context,
    this.updateUserList,
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _users.length) {
      return null;
    }

    final user = _users[index];

    Widget deleteButton = const SizedBox.shrink(); // default to empty widget

    if (user.role != UserRole.admin.index) {
      // show delete button only if user is not admin
      deleteButton = IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => showConfirmationDialog(
          _context,
          user,
          _users,
          updateUserList,
        ),
      );
    }

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(user.name)),
        DataCell(Text(UserRoleString[user.role] ?? '')),
        DataCell(Row(
          children: [
            deleteButton,
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _usersCount;

  @override
  int get selectedRowCount => _selectedRowCount;
}
