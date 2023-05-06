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

import 'package:flutter/material.dart' as _i8;

import 'package:auto_route/auto_route.dart' as _i7;

import '../core/models/order_model.dart' as _i10;
import '../features/home/presentation/pages/home_page.dart' as _i3;
import '../features/login/presentation/pages/login_page.dart' as _i2;
import '../features/orders/presentation/pages/manage_order_page.dart' as _i5;
import '../features/orders/presentation/pages/orders_page.dart' as _i4;
import '../features/settings/presentation/pages/settings_page.dart' as _i6;
import 'guards/auth_guard.dart' as _i9;
import 'splash_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          onAuthenticationResult: args.onAuthenticationResult,
          key: args.key,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i4.OrdersPage()),
        maintainState: false,
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ManageOrderRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ManageOrderRouteArgs>(
          orElse: () => ManageOrderRouteArgs(id: pathParams.optInt('id')));
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.ManageOrderPage(
          id: args.id,
          orderModel: args.orderModel,
          key: args.key,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i6.SettingsPage()),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/initial',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          OrdersRoute.name,
          path: '/orders',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          ManageOrderRoute.name,
          path: '/orders/edit/:id',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          '/orders/new#redirect',
          path: '/orders/new',
          redirectTo: '/orders/edit/:id',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          SettingsRoute.name,
          path: '/settings',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          '/orders/details/:id#redirect',
          path: '/orders/details/:id',
          redirectTo: '/orders/:id',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/initial',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    void Function(bool)? onAuthenticationResult,
    _i8.Key? key,
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

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{onAuthenticationResult: $onAuthenticationResult, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.OrdersPage]
class OrdersRoute extends _i7.PageRouteInfo<void> {
  const OrdersRoute()
      : super(
          OrdersRoute.name,
          path: '/orders',
        );

  static const String name = 'OrdersRoute';
}

/// generated route for
/// [_i5.ManageOrderPage]
class ManageOrderRoute extends _i7.PageRouteInfo<ManageOrderRouteArgs> {
  ManageOrderRoute({
    int? id,
    _i10.OrderModel? orderModel,
    _i8.Key? key,
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

  final _i10.OrderModel? orderModel;

  final _i8.Key? key;

  @override
  String toString() {
    return 'ManageOrderRouteArgs{id: $id, orderModel: $orderModel, key: $key}';
  }
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}
