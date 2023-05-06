import 'package:flutter/material.dart';

import '../../routing/routing.dart';
import '../custom_colors.dart';
import '../localization/localization.dart';

/// [AppDrawer] is the custom drawer displayed when tapping on the 3-lines button
/// visible from all pages (except for login) in the top AppBar.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: CustomColors.nroGreen,
            ),
            child: Text(
              context.translate(
                TranslationKeys.appTitle,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              context.translate(
                TranslationKeys.homeTitle,
              ),
            ),
            onTap: () => router.replace(const HomeRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: Text(
              context.translate(
                TranslationKeys.ordersTitle,
              ),
            ),
            onTap: () => router.replace(const OrdersRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              context.translate(
                TranslationKeys.settingsTitle,
              ),
            ),
            onTap: () => router.replace(const SettingsRoute()),
          ),
        ],
      ),
    );
  }
}
