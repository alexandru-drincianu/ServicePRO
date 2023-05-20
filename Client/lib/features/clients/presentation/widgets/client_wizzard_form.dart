import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/address_model.dart';
import 'package:service_pro/core/models/client_model.dart';
import 'package:service_pro/routing/app_router.gr.dart';

import '../../../../routing/app_router.dart';
import '../../provider/clients_provider.dart';

class ClientWizzardForm extends StatefulWidget {
  const ClientWizzardForm({Key? key}) : super(key: key);

  @override
  ClientWizzardFormState createState() => ClientWizzardFormState();
}

class ClientWizzardFormState extends State<ClientWizzardForm> {
  int _currentStep = 0;
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  String? telephoneNumber = "";
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _streetController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    setState(() {
      _currentStep++;
    });
  }

  bool _validateStep() {
    switch (_currentStep) {
      case 0:
        return _fullnameController.text.isNotEmpty &&
            _emailController.text.isNotEmpty &&
            telephoneNumber!.isNotEmpty;
      case 1:
        return _streetController.text.isNotEmpty &&
            countryValue.isNotEmpty &&
            cityValue!.isNotEmpty &&
            stateValue!.isNotEmpty;
      case 2:
        return _streetController.text.isNotEmpty &&
            countryValue.isNotEmpty &&
            cityValue!.isNotEmpty &&
            stateValue!.isNotEmpty &&
            _fullnameController.text.isNotEmpty &&
            _emailController.text.isNotEmpty &&
            telephoneNumber!.isNotEmpty;
      default:
        return true;
    }
  }

  Future<void> _createAccount(BuildContext context) async {
    final clientsProvider = context.read<ClientsProvider>();
    final ClientModel client = ClientModel(
      id: 0,
      fullName: _fullnameController.text,
      username: _usernameController.text,
      email: _emailController.text,
      telephoneNumber: telephoneNumber!,
      notes: "",
      address: AddressModel(
        street: _streetController.text,
        city: cityValue!,
        country: countryValue.substring(4).trim(),
        county: stateValue!,
      ),
    );
    var response = await clientsProvider.createClient(client);
    if (response.statusCode == 200) {
      final clientName = jsonDecode(response.body)['fullName'];

      BotToast.showText(
        text: 'Client "$clientName" created!',
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
      router.replace(const ClientsRoute());
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Fields marked with * are required",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stepper(
            currentStep: _currentStep,
            onStepTapped: (value) => setState(() {
              _currentStep = value;
            }),
            onStepContinue: _goToNextStep,
            controlsBuilder: (context, details) {
              if (_currentStep == 2) {
                return Container();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Continue'),
                    ),
                  ],
                );
              }
            },
            steps: [
              Step(
                title: const Text('Details'),
                content: Column(
                  children: [
                    TextFormField(
                      controller: _fullnameController,
                      decoration:
                          const InputDecoration(labelText: 'Fullname *'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your fullname';
                        }
                        final RegExp nameExp = RegExp(r'^[a-zA-Z\s]+$');
                        if (!nameExp.hasMatch(value)) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email *'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number *',
                      ),
                      initialCountryCode: 'RO',
                      onChanged: (value) {
                        setState(() {
                          telephoneNumber = value.completeNumber;
                        });
                      },
                      validator: (value) {
                        if (value!.completeNumber.toString().isEmpty) {
                          return 'Please enter your telephone number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                isActive: _currentStep == 0,
              ),
              Step(
                title: const Text('Address'),
                content: Column(
                  children: [
                    TextFormField(
                      controller: _streetController,
                      decoration: const InputDecoration(labelText: 'Street *'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your street';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CSCPicker(
                      dropdownDecoration: const BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          left: BorderSide.none,
                          right: BorderSide.none,
                          top: BorderSide.none,
                        ),
                      ),

                      disabledDropdownDecoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        border: const Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          left: BorderSide.none,
                          right: BorderSide.none,
                          top: BorderSide.none,
                        ),
                      ),

                      ///placeholders for dropdown search field
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",

                      ///labels for dropdown
                      countryDropdownLabel: "Country *",
                      stateDropdownLabel: "State *",
                      cityDropdownLabel: "City *",

                      defaultCountry: CscCountry.Romania,

                      ///triggers once country selected in dropdown
                      onCountryChanged: (value) {
                        setState(() {
                          ///store value in country variable
                          countryValue = value;
                        });
                      },

                      ///triggers once state selected in dropdown
                      onStateChanged: (value) {
                        setState(() {
                          ///store value in state variable
                          stateValue = value ?? "";
                        });
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        setState(() {
                          ///store value in city variable
                          cityValue = value ?? "";
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                isActive: _currentStep == 1,
              ),
              Step(
                title: const Text('Create account'),
                content: Builder(
                  builder: (BuildContext context) {
                    bool isValid = _validateStep();
                    if (!isValid) {
                      return Text(
                        'Please fill out all required fields.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'You are almost done, choose an username:',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (isValid) {
                                  _createAccount(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 50),
                              ),
                              child: const Text('Create'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                isActive: _currentStep == 2,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
