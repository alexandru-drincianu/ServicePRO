import 'package:flutter/material.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';
import '../widgets/client_wizzard_form.dart';

class CreateClientPage extends StatefulWidget {
  const CreateClientPage({Key? key}) : super(key: key);

  @override
  CreateClientPageState createState() => CreateClientPageState();
}

class CreateClientPageState extends State<CreateClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.createClient,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => router.replace(const ClientsRoute()),
        ),
      ),
      body:
          const ClientWizzardForm(), // Add the ClientWizzardForm as a child widget here
      drawer: const AppDrawer(),
    );
  }
}
