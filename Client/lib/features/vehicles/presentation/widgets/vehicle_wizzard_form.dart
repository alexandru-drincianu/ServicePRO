import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/UserModels/client_model.dart';
import 'package:service_pro/core/models/VehicleModels/vehicle_model.dart';
import 'package:service_pro/features/vehicles/provider/vehicles_provider.dart';
import 'package:service_pro/routing/app_router.gr.dart';

import '../../../../core/enums/enums.dart';
import '../../../../routing/app_router.dart';
import '../../../clients/provider/clients_provider.dart';

class VehicleWizzardForm extends StatefulWidget {
  const VehicleWizzardForm({Key? key, required this.licensePlate})
      : super(key: key);
  final String licensePlate;
  @override
  VehicleWizzardFormState createState() => VehicleWizzardFormState();
}

class VehicleWizzardFormState extends State<VehicleWizzardForm> {
  List<ClientModel> _clients = [];
  bool _setupComplete = false;
  final TextEditingController _clientSearchController = TextEditingController();
  final TextEditingController _typeAheadController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _vinController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  FuelType fuelType = FuelType.diesel;
  ClientModel? _selectedClient;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    _registrationController.text = widget.licensePlate;
    final clientsProvider = context.read<ClientsProvider>();
    final clientsData = await clientsProvider.getClients();
    setState(() {
      _clients = clientsData;
      _setupComplete = true;
    });
  }

  int _currentStep = 0;

  @override
  void dispose() {
    _vinController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _clientSearchController.dispose();
    _typeAheadController.dispose();
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
        return _selectedClient != null;
      case 1:
        return _brandController.text.isNotEmpty &&
            _modelController.text.isNotEmpty &&
            _vinController.text.isNotEmpty;
      case 2:
        return _registrationController.text.isNotEmpty &&
            _mileageController.text.isNotEmpty;
      case 3:
        return _brandController.text.isNotEmpty &&
            _modelController.text.isNotEmpty &&
            _vinController.text.isNotEmpty &&
            _registrationController.text.isNotEmpty &&
            _mileageController.text.isNotEmpty &&
            _selectedClient != null;
      default:
        return true;
    }
  }

  Future<void> _createVehicle(BuildContext context) async {
    final vehiclesProvider = context.read<VehiclesProvider>();
    final VehicleModel vehicleModel = VehicleModel(
      userId: _selectedClient?.id,
      registration: _registrationController.text,
      brand: _brandController.text,
      model: _modelController.text,
      vin: _vinController.text,
      mileage: num.parse(_mileageController.text),
      fuelType: fuelType.index,
    );
    var response = await vehiclesProvider.createVehicle(vehicleModel);
    if (response.statusCode == 200) {
      final vehicleRegistration = jsonDecode(response.body)['registration'];

      BotToast.showText(
        text: 'Vehicle "$vehicleRegistration" created!',
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
      router.replace(const VehiclesRoute());
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
    if (!_setupComplete) {
      return const Center(child: CircularProgressIndicator());
    }
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
              if (_currentStep == 3) {
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
                title: const Text('Ownership'),
                content: Column(
                  children: [
                    TypeAheadFormField<ClientModel>(
                      getImmediateSuggestions: true,
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select a client',
                        ),
                        controller: _typeAheadController,
                      ),
                      suggestionsCallback: (pattern) async {
                        return _clients
                            .where((item) =>
                                item.fullName!
                                    .toLowerCase()
                                    .startsWith(pattern.toLowerCase()) ||
                                item.telephoneNumber!.startsWith(pattern))
                            .toList();
                      },
                      itemBuilder: (context, ClientModel suggestion) {
                        return ListTile(
                          title: Text(suggestion.fullName!),
                          subtitle: Text(suggestion.telephoneNumber!),
                        );
                      },
                      onSuggestionSelected: (ClientModel suggestion) {
                        _typeAheadController.text = suggestion.fullName!;
                        _selectedClient = suggestion;
                      },
                      validator: (value) =>
                          value!.isEmpty ? 'Please select a client' : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          router.replace(const ClientsRoute());
                        },
                        child: const Text(
                          'Client not here? Please create one!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.lightBlue,
                            decoration: TextDecoration
                                .underline, // Optional: Add underline to simulate hyperlink
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                isActive: _currentStep == 0,
              ),
              Step(
                title: const Text('Vehicle identification'),
                content: Column(
                  children: [
                    TextFormField(
                      controller: _brandController,
                      decoration: const InputDecoration(labelText: 'Brand *'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the brand';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _modelController,
                      decoration: const InputDecoration(labelText: 'Model *'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the model';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLength: 17,
                      controller: _vinController,
                      decoration: const InputDecoration(labelText: 'VIN *'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the VIN';
                        }
                        if (!RegExp(r'^([0-9A-Za-z]{13}[0-9]{4})$')
                            .hasMatch(value)) {
                          return 'Please enter a valid VIN';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                isActive: _currentStep == 1,
              ),
              Step(
                title: const Text('Vehicle details'),
                content: Column(
                  children: [
                    TextFormField(
                      maxLength: 10,
                      controller: _registrationController,
                      decoration: const InputDecoration(
                        labelText: 'Registration plate *',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the registration number';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9\- ]+$').hasMatch(value)) {
                          return 'Please enter a valid registration number';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLength: 8,
                      controller: _mileageController,
                      decoration: const InputDecoration(labelText: 'Mileage *'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the mileage';
                        }
                        if (!RegExp(r'^([0-9]+)$').hasMatch(value)) {
                          return 'Please enter a valid mileage';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Select the fuel type!',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 100,
                      child: DropdownButton<FuelType>(
                        value: fuelType,
                        items: FuelType.values.map((fuelType) {
                          return DropdownMenuItem<FuelType>(
                            value: fuelType,
                            child: Text(FuelTypeString[fuelType.index]!),
                          );
                        }).toList(),
                        onChanged: (FuelType? newValue) {
                          setState(() {
                            fuelType = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                isActive: _currentStep == 2,
              ),
              Step(
                title: const Text('Create vehicle'),
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
                              'You are done!',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (isValid) {
                                  _createVehicle(context);
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
                isActive: _currentStep == 3,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
