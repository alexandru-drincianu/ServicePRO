part of 'app_router.dart';

/// [Routes] contains the path of all the named routes  accessible across the app.
class Routes {
  const Routes._();

  static const initial = '/initial';

  static const home = '/';
  static const login = '/login';
  static const orders = '/orders';
  static const settings = '/settings';
  static const adminPanel = '/adminPanel';
  static const clients = '/clients';
  static const createClient = '/clients/create';
  static const workorders = '/workorders';
  static const vehicles = '/vehicles';

  // TODO: https://pub.dev/packages/auto_route#working-with-paths
  static const createOrder = '/orders/new';
  static const editOrder = '/orders/edit/:id';
  static const orderDetails = '/orders/:id';

  // Redirect routes should not be accessible from outside
  static const _orderDetailsLong = '/orders/details/:id';
}
