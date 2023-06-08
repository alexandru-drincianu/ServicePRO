import 'package:auto_route/auto_route.dart';
import 'package:service_pro/features/admin/presentation/pages/admin_panel_page.dart';
import 'package:service_pro/features/info/presentation/pages/new_mechanic_info_page.dart';
import 'package:service_pro/features/vehicles/presentation/pages/create_vehicle_page.dart';
import 'package:service_pro/features/workorderItems/presentation/pages/workorder_items_page.dart';
import 'package:service_pro/features/workorders/presentation/pages/workorder_details_page.dart';

import '../features/clients/presentation/pages/clients_page.dart';
import '../features/clients/presentation/pages/create_client_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/login/presentation/pages/login_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/vehicles/presentation/pages/vehicles_page.dart';
import '../features/vehicles/presentation/pages/vehicle_details_page.dart';
import '../features/warehouse/presentation/pages/consumable_details_page.dart';
import '../features/warehouse/presentation/pages/labour_details_page.dart';
import '../features/warehouse/presentation/pages/warehouse_page.dart';
import '../features/workorders/presentation/pages/workorders_page.dart';
import '../features/clients/presentation/pages/user_details_page.dart';
import 'app_router.gr.dart';
import 'guards/auth_guard.dart';
import 'splash_page.dart';

part 'routes.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: TransitionsBuilders.noTransition,
  routes: [
    AutoRoute(
      initial: true,
      path: Routes.initial,
      page: SplashPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.login,
      page: LoginPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.home,
      page: HomePage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.clients,
      page: ClientsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.createClient,
      page: CreateClientPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.workorders,
      page: WorkordersPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.vehicles,
      page: VehiclesPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.createVehicles,
      page: CreateVehiclePage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.vehicleDetails,
      page: VehicleDetailsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.userDetails,
      page: UserDetailsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.newMechanicInfo,
      page: NewMechanicInfoPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.settings,
      page: SettingsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.adminPanel,
      page: AdminPanelPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.workorderDetails,
      page: WorkorderDetailsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.warehouse,
      page: WarehousePage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.consumableDetails,
      page: ConsumableDetailsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.labourDetails,
      page: LabourDetailsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: Routes.workorderItems,
      page: WorkorderItemsPage,
      guards: [AuthGuard],
    ),
    // Unknown routes will take users to home page.
    RedirectRoute(
      path: '*',
      redirectTo: Routes.home,
    ),
  ],
)
class $AppRouter {}

/// Router of the application. Keeping the instance here allows us to navigate
/// without the use of context.
late final AppRouter router;
