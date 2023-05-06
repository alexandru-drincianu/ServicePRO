import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

/// [RootObserver] is the auto route observer used to log all changes to the root
/// navigator of the app.
class RootObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('Navigating to ${route.settings.name}');
  }
}
