import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/models/client_model.dart';
import 'package:service_pro/features/home/presentation/pages/client_home_page.dart';
import 'package:service_pro/features/home/presentation/pages/mechanic_home_page.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../clients/provider/clients_provider.dart';
import '../../../login/provider/login_provider.dart';

/// [HomePage] is the page displayed under Home tab in the app. It is the first
/// screen displayed after a successful login.

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  UserModel? _loggedInUser;
  ClientModel? _userDetails;
  bool setupComplete = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  /// Initializes all vital components of the app.
  Future<void> initialize() async {
    final loginProvider = context.read<LoginProvider>();
    final clientsProvider = context.read<ClientsProvider>();
    // Check if user is logged in by loading user data
    final loggedInUser = await loginProvider.getLoggedInUserData();
    final userData = await clientsProvider.getUserById(loggedInUser!.id);
    setState(() {
      _loggedInUser = loggedInUser;
      _userDetails = userData;
      setupComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!setupComplete) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.homeTitle,
          ),
        ),
      ),
      body: _loggedInUser?.role == UserRole.client.index
          ? const ClientHomePage()
          : MechanicHomePage(
              loggedInUserDetails: _userDetails!,
            ), // Add the ClientWizzardForm as a child widget here
      drawer: const AppDrawer(),
    );
  }
}
