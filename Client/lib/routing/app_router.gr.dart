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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../core/models/order_model.dart' as _i13;
import '../features/admin/presentation/pages/admin_panel_page.dart' as _i9;
import '../features/clients/presentation/pages/clients_page.dart' as _i4;
import '../features/clients/presentation/pages/create_client_page.dart' as _i5;
import '../features/home/presentation/pages/home_page.dart' as _i3;
import '../features/login/presentation/pages/login_page.dart' as _i2;
import '../features/orders/presentation/pages/manage_order_page.dart' as _i7;
import '../features/orders/presentation/pages/orders_page.dart' as _i6;
import '../features/settings/presentation/pages/settings_page.dart' as _i8;
import 'guards/auth_guard.dart' as _i12;
import 'splash_page.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          onAuthenticationResult: args.onAuthenticationResult,
          key: args.key,
        ),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientsRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ClientsPage(),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateClientRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateClientPage(),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i6.OrdersPage()),
        maintainState: false,
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ManageOrderRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ManageOrderRouteArgs>(
          orElse: () => ManageOrderRouteArgs(id: pathParams.optInt('id')));
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.ManageOrderPage(
          id: args.id,
          orderModel: args.orderModel,
          key: args.key,
        ),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i8.SettingsPage()),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminPanelRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.AdminPanelPage(),
        transitionsBuilder: _i10.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashRoute.name,
          path: '/initial',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          LoginRoute.name,
          path: '/login',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          ClientsRoute.name,
          path: '/clients',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          CreateClientRoute.name,
          path: '/clients/create',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          OrdersRoute.name,
          path: '/orders',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          ManageOrderRoute.name,
          path: '/orders/edit/:id',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          '/orders/new#redirect',
          path: '/orders/new',
          redirectTo: '/orders/edit/:id',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          SettingsRoute.name,
          path: '/settings',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          AdminPanelRoute.name,
          path: '/adminPanel',
          guards: [authGuard],
        ),
        _i10.RouteConfig(
          '/orders/details/:id#redirect',
          path: '/orders/details/:id',
          redirectTo: '/orders/:id',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/initial',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    void Function(bool)? onAuthenticationResult,
    _i11.Key? key,
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

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{onAuthenticationResult: $onAuthenticationResult, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ClientsPage]
class ClientsRoute extends _i10.PageRouteInfo<void> {
  const ClientsRoute()
      : super(
          ClientsRoute.name,
          path: '/clients',
        );

  static const String name = 'ClientsRoute';
}

/// generated route for
/// [_i5.CreateClientPage]
class CreateClientRoute extends _i10.PageRouteInfo<void> {
  const CreateClientRoute()
      : super(
          CreateClientRoute.name,
          path: '/clients/create',
        );

  static const String name = 'CreateClientRoute';
}

/// generated route for
/// [_i6.OrdersPage]
class OrdersRoute extends _i10.PageRouteInfo<void> {
  const OrdersRoute()
      : super(
          OrdersRoute.name,
          path: '/orders',
        );

  static const String name = 'OrdersRoute';
}

/// generated route for
/// [_i7.ManageOrderPage]
class ManageOrderRoute extends _i10.PageRouteInfo<ManageOrderRouteArgs> {
  ManageOrderRoute({
    int? id,
    _i13.OrderModel? orderModel,
    _i11.Key? key,
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

  final _i13.OrderModel? orderModel;

  final _i11.Key? key;

  @override
  String toString() {
    return 'ManageOrderRouteArgs{id: $id, orderModel: $orderModel, key: $key}';
  }
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i9.AdminPanelPage]
class AdminPanelRoute extends _i10.PageRouteInfo<void> {
  const AdminPanelRoute()
      : super(
          AdminPanelRoute.name,
          path: '/adminPanel',
        );

  static const String name = 'AdminPanelRoute';
}
