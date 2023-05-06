import 'package:get_it/get_it.dart';

import 'services/login_service.dart';
import 'services/orders_service.dart';
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
  locator.registerLazySingleton<OrdersService>(() => OrdersService());
}
