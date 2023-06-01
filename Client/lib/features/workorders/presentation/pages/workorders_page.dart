import 'package:flutter/material.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/app_router.gr.dart';

/// [WorkordersPage] is the page displayed under Home tab in the app. It is the first
/// screen displayed after a successful login.
class WorkordersPage extends StatelessWidget {
  const WorkordersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.workorders,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            SizedBox(
              height: 100,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () => router.replace(const CreateClientRoute()),
                  icon: const Icon(Icons.add),
                  label: const Text("Create Workorder"),
                ),
              ),
            ),
          ]),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
