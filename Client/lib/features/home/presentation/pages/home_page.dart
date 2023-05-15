import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/features/clients/presentation/widgets/client_wizzard_form.dart';
import 'package:service_pro/features/home/presentation/pages/client_home_page.dart';
import 'package:service_pro/features/home/presentation/pages/mechanic_home_page.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../login/provider/login_provider.dart';

/// [HomePage] is the page displayed under Home tab in the app. It is the first
/// screen displayed after a successful login.

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  UserModel? _user;
  bool setupComplete = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  /// Initializes all vital components of the app.
  Future<void> initialize() async {
    final loginProvider = context.read<LoginProvider>();
    // Check if user is logged in by loading user data
    final userData = await loginProvider.getLoggedInUserData();
    setState(() {
      _user = userData;
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
      body: _user?.role == UserRole.client.index
          ? const ClientHomePage()
          : const MechanicHomePage(), // Add the ClientWizzardForm as a child widget here
      drawer: const AppDrawer(),
    );
  }
}
