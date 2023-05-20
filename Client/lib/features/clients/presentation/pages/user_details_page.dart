import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/client_model.dart';
import 'package:service_pro/features/clients/provider/clients_provider.dart';

import '../../../../core/custom_colors.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../login/provider/login_provider.dart';

class UserDetailsPage extends StatefulWidget {
  final int id;
  const UserDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  UserDetailsPageState createState() => UserDetailsPageState();
}

class UserDetailsPageState extends State<UserDetailsPage> {
  bool _setupComplete = false;
  bool _inEdit = false;
  late final ClientModel _userData;
  UserModel? _loggedInUser;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final clientsProvider = context.read<ClientsProvider>();
    final loginProvider = context.read<LoginProvider>();
    final userData = await clientsProvider.getUserById(widget.id);
    final loggedInUser = await loginProvider.getLoggedInUserData();
    setState(() {
      _userData = userData!;
      _loggedInUser = loggedInUser!;
      _setupComplete = true;
    });
  }

  bool shouldShowEditButton() {
    return _loggedInUser?.id == _userData.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.userDetails,
          ),
        ),
      ),
      body: _setupComplete
          ? SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: CustomColors.nroGreen,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _userData.fullName!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildRow(
                  icon: Icons.phone,
                  label: 'Telephone number:',
                  text: _userData.telephoneNumber ?? "",
                ),
                _buildRow(
                  icon: Icons.mail,
                  label: 'E-mail:',
                  text: _userData.email ?? "",
                ),
                _buildRow(
                  icon: Icons.signpost,
                  label: 'Street:',
                  text: _userData.address != null
                      ? _userData.address!.street
                      : "",
                ),
                _buildRow(
                  icon: Icons.location_city,
                  label: 'City:',
                  text: _userData.address != null
                      ? "${_userData.address!.city}, ${_userData.address!.country}"
                      : "",
                ),
                _buildRow(
                  icon: Icons.notes,
                  label: 'Notes:',
                  text: _userData.notes ?? "",
                ),
                shouldShowEditButton()
                    ? !_inEdit
                        ? SizedBox(
                            height: 100,
                            child: Center(
                              child: ElevatedButton.icon(
                                onPressed: () => {
                                  setState(() {
                                    _inEdit = true;
                                  }),
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 100,
                            child: Center(
                              child: ElevatedButton.icon(
                                onPressed: () => {
                                  setState(() {
                                    _inEdit = false;
                                  }),
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          )
                    : const SizedBox(),
              ]),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const AppDrawer(),
    );
  }

  Container _buildRow({
    required IconData icon,
    required String label,
    required String text,
    String? buttonLabel,
    VoidCallback? onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                _inEdit
                    ? TextFormField(
                        initialValue: text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ],
            ),
          ),
          if (buttonLabel != null)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    buttonLabel,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
