// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;

import '../core/models/WorkorderModels/workorder_model.dart' as _i26;
import '../features/admin/presentation/pages/admin_panel_page.dart' as _i13;
import '../features/clients/presentation/pages/clients_page.dart' as _i4;
import '../features/clients/presentation/pages/create_client_page.dart' as _i5;
import '../features/clients/presentation/pages/user_details_page.dart' as _i10;
import '../features/home/presentation/pages/home_page.dart' as _i3;
import '../features/info/presentation/pages/new_mechanic_info_page.dart'
    as _i11;
import '../features/invoices/presentation/pages/invoices_page.dart' as _i19;
import '../features/invoices/presentation/pages/user_invoices_page.dart'
    as _i20;
import '../features/login/presentation/pages/login_page.dart' as _i2;
import '../features/settings/presentation/pages/settings_page.dart' as _i12;
import '../features/vehicles/presentation/pages/create_vehicle_page.dart'
    as _i8;
import '../features/vehicles/presentation/pages/user_vehicle_page.dart' as _i21;
import '../features/vehicles/presentation/pages/vehicle_details_page.dart'
    as _i9;
import '../features/vehicles/presentation/pages/vehicles_page.dart' as _i7;
import '../features/warehouse/presentation/pages/consumable_details_page.dart'
    as _i16;
import '../features/warehouse/presentation/pages/labour_details_page.dart'
    as _i17;
import '../features/warehouse/presentation/pages/warehouse_page.dart' as _i15;
import '../features/workorderItems/presentation/pages/workorder_items_page.dart'
    as _i18;
import '../features/workorders/presentation/pages/user_workorders_page.dart'
    as _i22;
import '../features/workorders/presentation/pages/workorder_details_page.dart'
    as _i14;
import '../features/workorders/presentation/pages/workorders_page.dart' as _i6;
import 'guards/auth_guard.dart' as _i25;
import 'splash_page.dart' as _i1;

class AppRouter extends _i23.RootStackRouter {
  AppRouter({
    _i24.GlobalKey<_i24.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i25.AuthGuard authGuard;

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          onAuthenticationResult: args.onAuthenticationResult,
          key: args.key,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientsRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ClientsPage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateClientRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateClientPage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WorkordersRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.WorkordersPage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehiclesRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.VehiclesPage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateVehicleRoute.name: (routeData) {
      final args = routeData.argsAs<CreateVehicleRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i8.CreateVehiclePage(
          key: args.key,
          licensePlate: args.licensePlate,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleDetailsRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.VehicleDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailsRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.UserDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewMechanicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewMechanicInfoRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i11.NewMechanicInfoPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i23.WrappedRoute(child: const _i12.SettingsPage()),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminPanelRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.AdminPanelPage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WorkorderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WorkorderDetailsRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i14.WorkorderDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WarehouseRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.WarehousePage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ConsumableDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ConsumableDetailsRouteArgs>(
          orElse: () => const ConsumableDetailsRouteArgs());
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i16.ConsumableDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LabourDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<LabourDetailsRouteArgs>(
          orElse: () => const LabourDetailsRouteArgs());
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i17.LabourDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WorkorderItemsRoute.name: (routeData) {
      final args = routeData.argsAs<WorkorderItemsRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i18.WorkorderItemsPage(
          key: args.key,
          workorder: args.workorder,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    InvoicesRoute.name: (routeData) {
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i19.InvoicesPage(),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserInvoicesRoute.name: (routeData) {
      final args = routeData.argsAs<UserInvoicesRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i20.UserInvoicesPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserVehiclesRoute.name: (routeData) {
      final args = routeData.argsAs<UserVehiclesRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i21.UserVehiclesPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserWorkordersRoute.name: (routeData) {
      final args = routeData.argsAs<UserWorkordersRouteArgs>();
      return _i23.CustomPage<dynamic>(
        routeData: routeData,
        child: _i22.UserWorkordersPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i23.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i23.RouteConfig> get routes => [
        _i23.RouteConfig(
          SplashRoute.name,
          path: '/initial',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          LoginRoute.name,
          path: '/login',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          ClientsRoute.name,
          path: '/clients',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          CreateClientRoute.name,
          path: '/clients/create',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          WorkordersRoute.name,
          path: '/workorders',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          VehiclesRoute.name,
          path: '/vehicles',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          CreateVehicleRoute.name,
          path: '/vehicles/create',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          VehicleDetailsRoute.name,
          path: '/vehicles/:id',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          UserDetailsRoute.name,
          path: '/users/:id',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          NewMechanicInfoRoute.name,
          path: '/newMechanicInfo',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          SettingsRoute.name,
          path: '/settings',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          AdminPanelRoute.name,
          path: '/adminPanel',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          WorkorderDetailsRoute.name,
          path: '/workorders/:id',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          WarehouseRoute.name,
          path: '/warehouse',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          ConsumableDetailsRoute.name,
          path: '/consumables/:id',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          LabourDetailsRoute.name,
          path: '/labours/:id',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          WorkorderItemsRoute.name,
          path: '/workorders/:id/items/',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          InvoicesRoute.name,
          path: '/invoices',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          UserInvoicesRoute.name,
          path: '/user/:id/invoices',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          UserVehiclesRoute.name,
          path: '/user/:id/vehicles',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          UserWorkordersRoute.name,
          path: '/user/:id/workorders',
          guards: [authGuard],
        ),
        _i23.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i23.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/initial',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i23.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    void Function(bool)? onAuthenticationResult,
    _i24.Key? key,
  }) : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(
            onAuthenticationResult: onAuthenticationResult,
            key: key,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.onAuthenticationResult,
    this.key,
  });

  final void Function(bool)? onAuthenticationResult;

  final _i24.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{onAuthenticationResult: $onAuthenticationResult, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ClientsPage]
class ClientsRoute extends _i23.PageRouteInfo<void> {
  const ClientsRoute()
      : super(
          ClientsRoute.name,
          path: '/clients',
        );

  static const String name = 'ClientsRoute';
}

/// generated route for
/// [_i5.CreateClientPage]
class CreateClientRoute extends _i23.PageRouteInfo<void> {
  const CreateClientRoute()
      : super(
          CreateClientRoute.name,
          path: '/clients/create',
        );

  static const String name = 'CreateClientRoute';
}

/// generated route for
/// [_i6.WorkordersPage]
class WorkordersRoute extends _i23.PageRouteInfo<void> {
  const WorkordersRoute()
      : super(
          WorkordersRoute.name,
          path: '/workorders',
        );

  static const String name = 'WorkordersRoute';
}

/// generated route for
/// [_i7.VehiclesPage]
class VehiclesRoute extends _i23.PageRouteInfo<void> {
  const VehiclesRoute()
      : super(
          VehiclesRoute.name,
          path: '/vehicles',
        );

  static const String name = 'VehiclesRoute';
}

/// generated route for
/// [_i8.CreateVehiclePage]
class CreateVehicleRoute extends _i23.PageRouteInfo<CreateVehicleRouteArgs> {
  CreateVehicleRoute({
    _i24.Key? key,
    required String licensePlate,
  }) : super(
          CreateVehicleRoute.name,
          path: '/vehicles/create',
          args: CreateVehicleRouteArgs(
            key: key,
            licensePlate: licensePlate,
          ),
        );

  static const String name = 'CreateVehicleRoute';
}

class CreateVehicleRouteArgs {
  const CreateVehicleRouteArgs({
    this.key,
    required this.licensePlate,
  });

  final _i24.Key? key;

  final String licensePlate;

  @override
  String toString() {
    return 'CreateVehicleRouteArgs{key: $key, licensePlate: $licensePlate}';
  }
}

/// generated route for
/// [_i9.VehicleDetailsPage]
class VehicleDetailsRoute extends _i23.PageRouteInfo<VehicleDetailsRouteArgs> {
  VehicleDetailsRoute({
    _i24.Key? key,
    required int id,
  }) : super(
          VehicleDetailsRoute.name,
          path: '/vehicles/:id',
          args: VehicleDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'VehicleDetailsRoute';
}

class VehicleDetailsRouteArgs {
  const VehicleDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final int id;

  @override
  String toString() {
    return 'VehicleDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.UserDetailsPage]
class UserDetailsRoute extends _i23.PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({
    _i24.Key? key,
    required int id,
  }) : super(
          UserDetailsRoute.name,
          path: '/users/:id',
          args: UserDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'UserDetailsRoute';
}

class UserDetailsRouteArgs {
  const UserDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final int id;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i11.NewMechanicInfoPage]
class NewMechanicInfoRoute
    extends _i23.PageRouteInfo<NewMechanicInfoRouteArgs> {
  NewMechanicInfoRoute({
    _i24.Key? key,
    required int id,
  }) : super(
          NewMechanicInfoRoute.name,
          path: '/newMechanicInfo',
          args: NewMechanicInfoRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'NewMechanicInfoRoute';
}

class NewMechanicInfoRouteArgs {
  const NewMechanicInfoRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final int id;

  @override
  String toString() {
    return 'NewMechanicInfoRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsRoute extends _i23.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i13.AdminPanelPage]
class AdminPanelRoute extends _i23.PageRouteInfo<void> {
  const AdminPanelRoute()
      : super(
          AdminPanelRoute.name,
          path: '/adminPanel',
        );

  static const String name = 'AdminPanelRoute';
}

/// generated route for
/// [_i14.WorkorderDetailsPage]
class WorkorderDetailsRoute
    extends _i23.PageRouteInfo<WorkorderDetailsRouteArgs> {
  WorkorderDetailsRoute({
    _i24.Key? key,
    required int id,
  }) : super(
          WorkorderDetailsRoute.name,
          path: '/workorders/:id',
          args: WorkorderDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'WorkorderDetailsRoute';
}

class WorkorderDetailsRouteArgs {
  const WorkorderDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final int id;

  @override
  String toString() {
    return 'WorkorderDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i15.WarehousePage]
class WarehouseRoute extends _i23.PageRouteInfo<void> {
  const WarehouseRoute()
      : super(
          WarehouseRoute.name,
          path: '/warehouse',
        );

  static const String name = 'WarehouseRoute';
}

/// generated route for
/// [_i16.ConsumableDetailsPage]
class ConsumableDetailsRoute
    extends _i23.PageRouteInfo<ConsumableDetailsRouteArgs> {
  ConsumableDetailsRoute({
    _i24.Key? key,
    int? id,
  }) : super(
          ConsumableDetailsRoute.name,
          path: '/consumables/:id',
          args: ConsumableDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'ConsumableDetailsRoute';
}

class ConsumableDetailsRouteArgs {
  const ConsumableDetailsRouteArgs({
    this.key,
    this.id,
  });

  final _i24.Key? key;

  final int? id;

  @override
  String toString() {
    return 'ConsumableDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i17.LabourDetailsPage]
class LabourDetailsRoute extends _i23.PageRouteInfo<LabourDetailsRouteArgs> {
  LabourDetailsRoute({
    _i24.Key? key,
    int? id,
  }) : super(
          LabourDetailsRoute.name,
          path: '/labours/:id',
          args: LabourDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'LabourDetailsRoute';
}

class LabourDetailsRouteArgs {
  const LabourDetailsRouteArgs({
    this.key,
    this.id,
  });

  final _i24.Key? key;

  final int? id;

  @override
  String toString() {
    return 'LabourDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i18.WorkorderItemsPage]
class WorkorderItemsRoute extends _i23.PageRouteInfo<WorkorderItemsRouteArgs> {
  WorkorderItemsRoute({
    _i24.Key? key,
    required _i26.WorkorderModel workorder,
  }) : super(
          WorkorderItemsRoute.name,
          path: '/workorders/:id/items/',
          args: WorkorderItemsRouteArgs(
            key: key,
            workorder: workorder,
          ),
        );

  static const String name = 'WorkorderItemsRoute';
}

class WorkorderItemsRouteArgs {
  const WorkorderItemsRouteArgs({
    this.key,
    required this.workorder,
  });

  final _i24.Key? key;

  final _i26.WorkorderModel workorder;

  @override
  String toString() {
    return 'WorkorderItemsRouteArgs{key: $key, workorder: $workorder}';
  }
}

/// generated route for
/// [_i19.InvoicesPage]
class InvoicesRoute extends _i23.PageRouteInfo<void> {
  const InvoicesRoute()
      : super(
          InvoicesRoute.name,
          path: '/invoices',
        );

  static const String name = 'InvoicesRoute';
}

/// generated route for
/// [_i20.UserInvoicesPage]
class UserInvoicesRoute extends _i23.PageRouteInfo<UserInvoicesRouteArgs> {
  UserInvoicesRoute({
    _i24.Key? key,
    required int id,
  }) : super(
          UserInvoicesRoute.name,
          path: '/user/:id/invoices',
          args: UserInvoicesRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'UserInvoicesRoute';
}

class UserInvoicesRouteArgs {
  const UserInvoicesRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final int id;

  @override
  String toString() {
    return 'UserInvoicesRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i21.UserVehiclesPage]
class UserVehiclesRoute extends _i23.PageRouteInfo<UserVehiclesRouteArgs> {
  UserVehiclesRoute({
    _i24.Key? key,
    required int id,
  }) : super(
          UserVehiclesRoute.name,
          path: '/user/:id/vehicles',
          args: UserVehiclesRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'UserVehiclesRoute';
}

class UserVehiclesRouteArgs {
  const UserVehiclesRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final int id;

  @override
  String toString() {
    return 'UserVehiclesRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i22.UserWorkordersPage]
class UserWorkordersRoute extends _i23.PageRouteInfo<UserWorkordersRouteArgs> {
  UserWorkordersRoute({
    _i24.Key? key,
    required int id,
  }) : super(
          UserWorkordersRoute.name,
          path: '/user/:id/workorders',
          args: UserWorkordersRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'UserWorkordersRoute';
}

class UserWorkordersRouteArgs {
  const UserWorkordersRouteArgs({
    this.key,
    required this.id,
  });

  final _i24.Key? key;

  final int id;

  @override
  String toString() {
    return 'UserWorkordersRouteArgs{key: $key, id: $id}';
  }
}
