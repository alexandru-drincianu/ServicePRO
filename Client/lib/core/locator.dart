import 'package:get_it/get_it.dart';
import 'package:service_pro/core/services/consumables_service.dart';
import 'package:service_pro/core/services/invoices_service.dart';
import 'package:service_pro/core/services/labours_service.dart';
import 'package:service_pro/core/services/users_service.dart';
import 'package:service_pro/core/services/vehicles_service.dart';
import 'package:service_pro/core/services/workorder_item_service.dart';
import 'package:service_pro/core/services/workorders_service.dart';

import 'services/login_service.dart';
import 'services/shared_preference_service.dart';
import 'services/user_settings_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SharedPreferenceService>(
    () => SharedPreferenceService(),
  );
  locator.registerLazySingleton<UserSettingsService>(
    () => UserSettingsService(),
  );
  locator.registerLazySingleton<LoginService>(() => LoginService());
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<VehicleService>(() => VehicleService());
  locator.registerLazySingleton<WorkorderService>(() => WorkorderService());
  locator.registerLazySingleton<ConsumableService>(() => ConsumableService());
  locator.registerLazySingleton<LabourService>(() => LabourService());
  locator.registerLazySingleton<WorkorderItemService>(
    () => WorkorderItemService(),
  );
  locator.registerLazySingleton<InvoiceService>(() => InvoiceService());
}
