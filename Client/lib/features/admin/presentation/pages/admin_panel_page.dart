import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/localization/localization.dart';

import '../../../../core/input_validators/mandatory_input_validator.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../provider/register_provider.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  AdminPanelPageState createState() => AdminPanelPageState();
}

class AdminPanelPageState extends State<AdminPanelPage> {
  bool _showUserList = false;
  bool _showCreateMechanicForm = false;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    super.dispose();
  }

  void _toggleUserList() {
    setState(() {
      _showUserList = true;
      _showCreateMechanicForm = false;
    });
  }

  void _toggleCreateMechanicForm() {
    setState(() {
      _showUserList = false;
      _showCreateMechanicForm = true;
    });
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _toggleUserList,
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
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual user count
                itemBuilder: (context, index) => ListTile(
                  title: Text('User ${index + 1}'),
                ),
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

                            BotToast.showText(
                              text: 'Mechanic "$mechanicName" created!',
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              contentColor: Colors.green,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 16.0,
                              ),
                            );
                            _usernameController.clear();
                            _passwordController.clear();
                            _fullnameController.clear();
                          } else {
                            BotToast.showText(
                              text: response.body,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              contentColor: Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 16.0,
                              ),
                            );
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
      drawer: const AppDrawer(),
    );
  }
}
