part of 'app_router.dart';

/// [Routes] contains the path of all the named routes  accessible across the app.
class Routes {
  const Routes._();

  // miscellaneous
  static const initial = '/initial';
  static const home = '/';
  static const login = '/login';
  static const settings = '/settings';

  // users
  static const clients = '/clients';
  static const createClient = '/clients/create';
  static const adminPanel = '/adminPanel';
  static const userDetails = '/users/:id';
  static const newMechanicInfo = '/newMechanicInfo';

  // vehicle
  static const vehicles = '/vehicles';
  static const createVehicles = '/vehicles/create';
  static const vehicleDetails = '/vehicles/:id';
  static const userVehicles = '/user/:id/vehicles';

  // workorder
  static const workorders = '/workorders';
  static const workorderDetails = '/workorders/:id';
  static const workorderItems = '/workorders/:id/items/';
  static const userWorkorders = '/user/:id/workorders';

  // warehouse
  static const warehouse = '/warehouse';
  static const consumableDetails = '/consumables/:id';
  static const labourDetails = '/labours/:id';

  // invoices
  static const invoices = '/invoices';
  static const userInvoices = '/user/:id/invoices';
}
