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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../core/models/order_model.dart' as _i19;
import '../features/admin/presentation/pages/admin_panel_page.dart' as _i15;
import '../features/clients/presentation/pages/clients_page.dart' as _i4;
import '../features/clients/presentation/pages/create_client_page.dart' as _i5;
import '../features/clients/presentation/pages/user_details_page.dart' as _i10;
import '../features/home/presentation/pages/home_page.dart' as _i3;
import '../features/info/presentation/pages/new_mechanic_info_page.dart'
    as _i11;
import '../features/login/presentation/pages/login_page.dart' as _i2;
import '../features/orders/presentation/pages/manage_order_page.dart' as _i13;
import '../features/orders/presentation/pages/orders_page.dart' as _i12;
import '../features/settings/presentation/pages/settings_page.dart' as _i14;
import '../features/vehicles/presentation/pages/create_vehicle_page.dart'
    as _i8;
import '../features/vehicles/presentation/pages/vehicle_details_page.dart'
    as _i9;
import '../features/vehicles/presentation/pages/vehicles_page.dart' as _i7;
import '../features/workorders/presentation/pages/workorders_page.dart' as _i6;
import 'guards/auth_guard.dart' as _i18;
import 'splash_page.dart' as _i1;

class AppRouter extends _i16.RootStackRouter {
  AppRouter({
    _i17.GlobalKey<_i17.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i18.AuthGuard authGuard;

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          onAuthenticationResult: args.onAuthenticationResult,
          key: args.key,
        ),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientsRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ClientsPage(),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateClientRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateClientPage(),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WorkordersRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.WorkordersPage(),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehiclesRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.VehiclesPage(),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateVehicleRoute.name: (routeData) {
      final args = routeData.argsAs<CreateVehicleRouteArgs>();
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i8.CreateVehiclePage(
          key: args.key,
          licensePlate: args.licensePlate,
        ),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VehicleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<VehicleDetailsRouteArgs>();
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.VehicleDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailsRouteArgs>();
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.UserDetailsPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewMechanicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewMechanicInfoRouteArgs>();
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i11.NewMechanicInfoPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(child: const _i12.OrdersPage()),
        maintainState: false,
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ManageOrderRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ManageOrderRouteArgs>(
          orElse: () => ManageOrderRouteArgs(id: pathParams.optInt('id')));
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i13.ManageOrderPage(
          id: args.id,
          orderModel: args.orderModel,
          key: args.key,
        ),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(child: const _i14.SettingsPage()),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminPanelRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.AdminPanelPage(),
        transitionsBuilder: _i16.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          SplashRoute.name,
          path: '/initial',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          LoginRoute.name,
          path: '/login',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          ClientsRoute.name,
          path: '/clients',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          CreateClientRoute.name,
          path: '/clients/create',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          WorkordersRoute.name,
          path: '/workorders',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          VehiclesRoute.name,
          path: '/vehicles',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          CreateVehicleRoute.name,
          path: '/vehicles/create',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          VehicleDetailsRoute.name,
          path: '/vehicles/:id',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          UserDetailsRoute.name,
          path: '/users/:id',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          NewMechanicInfoRoute.name,
          path: '/newMechanicInfo',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          OrdersRoute.name,
          path: '/orders',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          ManageOrderRoute.name,
          path: '/orders/edit/:id',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          '/orders/new#redirect',
          path: '/orders/new',
          redirectTo: '/orders/edit/:id',
          fullMatch: true,
        ),
        _i16.RouteConfig(
          SettingsRoute.name,
          path: '/settings',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          AdminPanelRoute.name,
          path: '/adminPanel',
          guards: [authGuard],
        ),
        _i16.RouteConfig(
          '/orders/details/:id#redirect',
          path: '/orders/details/:id',
          redirectTo: '/orders/:id',
          fullMatch: true,
        ),
        _i16.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/initial',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    void Function(bool)? onAuthenticationResult,
    _i17.Key? key,
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

  final _i17.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{onAuthenticationResult: $onAuthenticationResult, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ClientsPage]
class ClientsRoute extends _i16.PageRouteInfo<void> {
  const ClientsRoute()
      : super(
          ClientsRoute.name,
          path: '/clients',
        );

  static const String name = 'ClientsRoute';
}

/// generated route for
/// [_i5.CreateClientPage]
class CreateClientRoute extends _i16.PageRouteInfo<void> {
  const CreateClientRoute()
      : super(
          CreateClientRoute.name,
          path: '/clients/create',
        );

  static const String name = 'CreateClientRoute';
}

/// generated route for
/// [_i6.WorkordersPage]
class WorkordersRoute extends _i16.PageRouteInfo<void> {
  const WorkordersRoute()
      : super(
          WorkordersRoute.name,
          path: '/workorders',
        );

  static const String name = 'WorkordersRoute';
}

/// generated route for
/// [_i7.VehiclesPage]
class VehiclesRoute extends _i16.PageRouteInfo<void> {
  const VehiclesRoute()
      : super(
          VehiclesRoute.name,
          path: '/vehicles',
        );

  static const String name = 'VehiclesRoute';
}

/// generated route for
/// [_i8.CreateVehiclePage]
class CreateVehicleRoute extends _i16.PageRouteInfo<CreateVehicleRouteArgs> {
  CreateVehicleRoute({
    _i17.Key? key,
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

  final _i17.Key? key;

  final String licensePlate;

  @override
  String toString() {
    return 'CreateVehicleRouteArgs{key: $key, licensePlate: $licensePlate}';
  }
}

/// generated route for
/// [_i9.VehicleDetailsPage]
class VehicleDetailsRoute extends _i16.PageRouteInfo<VehicleDetailsRouteArgs> {
  VehicleDetailsRoute({
    _i17.Key? key,
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

  final _i17.Key? key;

  final int id;

  @override
  String toString() {
    return 'VehicleDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.UserDetailsPage]
class UserDetailsRoute extends _i16.PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({
    _i17.Key? key,
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

  final _i17.Key? key;

  final int id;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i11.NewMechanicInfoPage]
class NewMechanicInfoRoute
    extends _i16.PageRouteInfo<NewMechanicInfoRouteArgs> {
  NewMechanicInfoRoute({
    _i17.Key? key,
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

  final _i17.Key? key;

  final int id;

  @override
  String toString() {
    return 'NewMechanicInfoRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i12.OrdersPage]
class OrdersRoute extends _i16.PageRouteInfo<void> {
  const OrdersRoute()
      : super(
          OrdersRoute.name,
          path: '/orders',
        );

  static const String name = 'OrdersRoute';
}

/// generated route for
/// [_i13.ManageOrderPage]
class ManageOrderRoute extends _i16.PageRouteInfo<ManageOrderRouteArgs> {
  ManageOrderRoute({
    int? id,
    _i19.OrderModel? orderModel,
    _i17.Key? key,
  }) : super(
          ManageOrderRoute.name,
          path: '/orders/edit/:id',
          args: ManageOrderRouteArgs(
            id: id,
            orderModel: orderModel,
            key: key,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'ManageOrderRoute';
}

class ManageOrderRouteArgs {
  const ManageOrderRouteArgs({
    this.id,
    this.orderModel,
    this.key,
  });

  final int? id;

  final _i19.OrderModel? orderModel;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ManageOrderRouteArgs{id: $id, orderModel: $orderModel, key: $key}';
  }
}

/// generated route for
/// [_i14.SettingsPage]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i15.AdminPanelPage]
class AdminPanelRoute extends _i16.PageRouteInfo<void> {
  const AdminPanelRoute()
      : super(
          AdminPanelRoute.name,
          path: '/adminPanel',
        );

  static const String name = 'AdminPanelRoute';
}
