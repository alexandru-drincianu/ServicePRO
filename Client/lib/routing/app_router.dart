import 'package:auto_route/auto_route.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/login/presentation/pages/login_page.dart';
import '../features/orders/presentation/pages/manage_order_page.dart';
import '../features/orders/presentation/pages/orders_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import 'app_router.gr.dart';
import 'guards/auth_guard.dart';
import 'splash_page.dart';

part 'routes.dart';

// TODO: merge Home + Orders into Home screen and declare subpages as nested children.
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
      path: Routes.orders,
      page: OrdersPage,
      guards: [AuthGuard],

      /// Set to false in order to rebuild the [OrdersPage] after returning from the add/edit screen.
      maintainState: false,
    ),

    AutoRoute(
      path: Routes.editOrder,
      page: ManageOrderPage,
      guards: [AuthGuard],
    ),
    RedirectRoute(
      path: Routes.createOrder,
      redirectTo: Routes.editOrder,
    ),
    AutoRoute(
      path: Routes.settings,
      page: SettingsPage,
      guards: [AuthGuard],
    ),
    RedirectRoute(
      path: Routes._orderDetailsLong,
      redirectTo: Routes.orderDetails,
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
