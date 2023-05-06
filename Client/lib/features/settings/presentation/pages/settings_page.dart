import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routing/routing.dart';
import '../../../login/provider/login_provider.dart';
import '../widgets/language_selector.dart';
import '../widgets/theme_selector.dart';

/// [SettingsPage] is the page accessible from app drawer and it is used to
/// manage the settings of the current user. Currently only theme changing and
/// logging out are possible.
class SettingsPage extends StatelessWidget with AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ThemeConstants.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LanguageSelector(),
          const ThemeSelector(),
          const SizedBox(height: ThemeConstants.sizeUnitS),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context.read<LoginProvider>().logout();
              router.replaceAll([LoginRoute()]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeConstants.paddingM,
              ),
              child: Text(
                context.translate(TranslationKeys.logout),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(TranslationKeys.settingsTitle),
        ),
      ),
      body: this,
      // TODO: move app drawer above home page (out of scope for current ticket)
      drawer: const AppDrawer(),
    );
  }
}
