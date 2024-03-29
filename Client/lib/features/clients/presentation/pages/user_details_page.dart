import 'package:bot_toast/bot_toast.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/localization/localization.dart';
import 'package:service_pro/core/models/AddressModels/address_model.dart';
import 'package:service_pro/core/models/UserModels/client_model.dart';
import 'package:service_pro/core/models/UserModels/user_model.dart';
import 'package:service_pro/core/widgets/toast_message.dart';
import 'package:service_pro/features/clients/provider/clients_provider.dart';

import '../../../../core/custom_colors.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';
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
  late ClientModel _userData;
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

  Country? getCountryFromPhoneNumber(
    String phoneNumber,
    List<Country> countries,
  ) {
    String cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    for (Country country in countries) {
      if (cleanPhoneNumber.startsWith(country.dialCode) &&
          cleanPhoneNumber.length >=
              (country.dialCode.length + country.minLength) &&
          cleanPhoneNumber.length <=
              (country.dialCode.length + country.maxLength)) {
        return country;
      }
    }

    return null; // No matching country found
  }

  String? getCountryPhoneNumber(String phoneNumber, List<Country> countries) {
    String cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    for (Country country in countries) {
      if (cleanPhoneNumber.startsWith(country.dialCode) &&
          cleanPhoneNumber.length >=
              (country.dialCode.length + country.minLength) &&
          cleanPhoneNumber.length <=
              (country.dialCode.length + country.maxLength)) {
        String number = cleanPhoneNumber.substring(country.dialCode.length);
        return number;
      }
    }

    return null; // No matching country found
  }

  Future<void> _updateUser(BuildContext context) async {
    final clientsProvider = context.read<ClientsProvider>();
    var response = await clientsProvider.updateAccountDetails(_userData);
    if (response.statusCode == 200) {
      showToastSucceded('Account details updated!');
    } else {
      showToastFailed(response.body);
    }
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
                  property: "telephoneNumber",
                ),
                _buildRow(
                  icon: Icons.mail,
                  label: 'E-mail:',
                  text: _userData.email ?? "",
                  property: "email",
                ),
                _buildRow(
                  icon: Icons.signpost,
                  label: 'Street:',
                  text: _userData.address != null
                      ? _userData.address!.street
                      : "",
                  property: "street",
                ),
                _buildRow(
                  icon: Icons.location_city,
                  label: 'City:',
                  text: _userData.address != null
                      ? "${_userData.address!.city}, ${_userData.address!.country}"
                      : "",
                  property: "city",
                ),
                _buildRow(
                  icon: Icons.notes,
                  label: 'Notes:',
                  text: _userData.notes ?? "",
                  property: "notes",
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
                                onPressed: () async => {
                                  _updateUser(context),
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
    required String property,
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
                    ? _propertyField(property, text)
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

  Widget _propertyField(String property, String text) {
    switch (property) {
      case "telephoneNumber":
        return IntlPhoneField(
          decoration: const InputDecoration(
            labelText: 'Phone Number *',
          ),
          initialCountryCode: getCountryFromPhoneNumber(text, countries)?.code,
          initialValue: getCountryPhoneNumber(text, countries),
          onChanged: (value) {
            var updatedUserData =
                _userData.copyWith(telephoneNumber: value.completeNumber);
            setState(() {
              _userData = updatedUserData;
            });
          },
          validator: (value) {
            if (value!.completeNumber.toString().isEmpty) {
              return 'Please enter your telephone number';
            }
            return null;
          },
        );
      case "email":
        return TextFormField(
          initialValue: text,
          decoration: const InputDecoration(labelText: 'Email *'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onChanged: (value) {
            var updatedUserData = _userData.copyWith(email: value);
            setState(() {
              _userData = updatedUserData;
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      case "street":
        return TextFormField(
          initialValue: text,
          decoration: const InputDecoration(labelText: 'Street *'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your street';
            }
            return null;
          },
          onChanged: (value) {
            var updatedUserData = _userData.address != null
                ? _userData.copyWith(
                    address: _userData.address?.copyWith(street: value),
                  )
                : _userData.copyWith(
                    address: AddressModel(
                      county: "",
                      city: "",
                      street: value,
                      country: "",
                    ),
                  );
            setState(() {
              _userData = updatedUserData;
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      case "city":
        return CSCPicker(
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

          currentCity: _userData.address?.city ?? "",
          currentCountry: _userData.address?.country ?? "",
          currentState: _userData.address?.county ?? "",

          ///triggers once country selected in dropdown
          onCountryChanged: (value) {
            var updatedUserData = _userData.address != null
                ? _userData.copyWith(
                    address: _userData.address
                        ?.copyWith(country: value.substring(4).trim()),
                  )
                : _userData.copyWith(
                    address: AddressModel(
                      county: "",
                      city: "",
                      street: "",
                      country: value.substring(4).trim(),
                    ),
                  );
            setState(() {
              _userData = updatedUserData;
            });
          },

          ///triggers once state selected in dropdown
          onStateChanged: (value) {
            var updatedUserData = _userData.copyWith(
              address: _userData.address?.copyWith(county: value ?? ""),
            );
            setState(() {
              _userData = updatedUserData;
            });
          },

          ///triggers once city selected in dropdown
          onCityChanged: (value) {
            var updatedUserData = _userData.copyWith(
              address: _userData.address?.copyWith(city: value ?? ""),
            );
            setState(() {
              _userData = updatedUserData;
            });
          },
        );
      case "notes":
        return TextFormField(
          initialValue: text,
          decoration: const InputDecoration(labelText: 'Notes'),
          onChanged: (value) {
            var updatedUserData = _userData.copyWith(notes: value);
            setState(() {
              _userData = updatedUserData;
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
      default:
        return const Text(
          'Invalid property',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        );
    }
  }
}
