import 'package:auto_route/auto_route.dart';

import '../../core/locator.dart';
import '../../core/services/user_settings_service.dart';
import '../routing.dart';

// TODO: replace AuthGuard by AutoRedirectGuard for asynchronous support.
// (out of scope for #23, low priority)

/// [AuthGuard] is used to guard routes against the unauthenticated attackers
/// trying to access pages outside their scope.
class AuthGuard extends AutoRouteGuard {
  final _userSettingsService = locator<UserSettingsService>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isLoaded = _userSettingsService.isLoaded;

    if (resolver.route.path == const SplashRoute().path) {
      resolver.next(!isLoaded);
      return;
    } else if (!isLoaded) {
      // We need this case since the initial property of [AutoRoute] doesn't work,
      // loading HomeRoute instead of SplashRoute.
      router.replaceAll([const SplashRoute()]);
      return;
    }

    final authenticated = _userSettingsService.isAuthenticated;

    // If the user tries to go to login page but is already authenticated.
    if (resolver.route.path == LoginRoute().path) {
      resolver.next(!authenticated);
      return;
    }

    if (authenticated) {
      // If the user is authenticated, proceed with navigation.
      resolver.next(true);
    } else {
      // If the user is not logged in, redirect to login page.
      router.push(
        LoginRoute(
          onAuthenticationResult: (isAuthenticated) {
            // If user has logged in we let him continue his navigation,
            // otherwise it will be aborted. This is useful in case the user
            // wants to access orders page directly without being logged in.
            resolver.next(isAuthenticated);
          },
        ),
      );
    }
  }
}
