import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_pro/core/models/UserModels/user_model.dart';

import '../../features/login/provider/login_provider.dart';
import '../../routing/routing.dart';
import '../constants/theme_constants.dart';
import '../custom_colors.dart';
import '../enums/enums.dart';
import '../localization/localization.dart';

/// [AppDrawer] is the custom drawer displayed when tapping on the 3-lines button
/// visible from all pages (except for login) in the top AppBar.
class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: CustomColors.nroGreen,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: ThemeConstants.sizeUnitL,
                  child: Column(
                    children: [
                      Text(
                        "${context.translate(TranslationKeys.welcome)}, ${_user?.name}",
                        style: const TextStyle(
                          fontSize: ThemeConstants.sizeUnitXL,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: Center(
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                router.replace(UserDetailsRoute(id: _user!.id)),
                            icon: const Icon(Icons.person),
                            label: const Text("My Profile"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: ThemeConstants.sizeUnitL,
                  right: ThemeConstants.sizeUnitL,
                  child: Text(
                    UserRoleString[_user?.role] ?? '',
                    style: const TextStyle(
                      fontSize: ThemeConstants.sizeUnitL,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
          if (_user?.role != UserRole.client.index)
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                context.translate(
                  TranslationKeys.clients,
                ),
              ),
              onTap: () => router.replace(const ClientsRoute()),
            ),
          ListTile(
            leading: const Icon(Icons.directions_car),
            title: Text(
              context.translate(
                TranslationKeys.vehicles,
              ),
            ),
            onTap: () {
              _user?.role == UserRole.client.index
                  ? router.replace(UserVehiclesRoute(id: _user!.id))
                  : router.replace(const VehiclesRoute());
            },
          ),
          if (_user?.role == UserRole.admin.index ||
              _user?.role == UserRole.client.index)
            ListTile(
              leading: const Icon(Icons.document_scanner),
              title: Text(
                context.translate(
                  TranslationKeys.invoices,
                ),
              ),
              onTap: () {
                _user?.role == UserRole.admin.index
                    ? router.replace(const InvoicesRoute())
                    : router.replace(UserInvoicesRoute(id: _user!.id));
              },
            ),
          ListTile(
            leading: const Icon(Icons.construction),
            title: Text(
              context.translate(
                TranslationKeys.workorders,
              ),
            ),
            onTap: () {
              _user?.role == UserRole.client.index
                  ? router.replace(UserWorkordersRoute(id: _user!.id))
                  : router.replace(const WorkordersRoute());
            },
          ),
          if (_user?.role != UserRole.client.index)
            ListTile(
              leading: const Icon(Icons.warehouse),
              title: Text(
                context.translate(
                  TranslationKeys.warehouse,
                ),
              ),
              onTap: () => router.replace(const WarehouseRoute()),
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
          if (_user?.role == UserRole.admin.index)
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: Text(
                context.translate(
                  TranslationKeys.adminPanel,
                ),
              ),
              onTap: () => router.replace(const AdminPanelRoute()),
            ),
        ],
      ),
    );
  }
}
