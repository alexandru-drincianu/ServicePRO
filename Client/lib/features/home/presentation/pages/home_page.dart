import 'package:flutter/material.dart';

import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';

/// [HomePage] is the page displayed under Home tab in the app. It is the first
/// screen displayed after a successful login.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(
            TranslationKeys.appTitle,
          ),
        ),
      ),
      body: Center(
        child: Text(
          context.translate(
            TranslationKeys.homeTitle,
          ),
        ),
      ),
      // TODO: move app drawer above home page
      drawer: const AppDrawer(),
    );
  }
}
