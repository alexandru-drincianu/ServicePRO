import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:service_pro/features/admin/provider/register_provider.dart';
import 'package:service_pro/features/admin/provider/user_provider.dart';
import 'package:service_pro/features/clients/provider/clients_provider.dart';
import 'package:service_pro/features/vehicles/provider/vehicles_provider.dart';

import 'app.dart';
import 'core/localization/localization.dart';
import 'core/theme/theme.dart';
import 'features/login/provider/login_provider.dart';
import 'features/orders/provider/orders_provider.dart';

/// [AppWrapper] is used to wrap the [App] widget so that is has immediate access
/// to required providers.
class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Login provider needs to be accessible in the whole app since routing
        // guards are based on it.
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),

        ChangeNotifierProvider<RegisterProvider>(
          create: (context) => RegisterProvider(),
        ),

        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),

        ChangeNotifierProvider<ClientsProvider>(
          create: (context) => ClientsProvider(),
        ),

        ChangeNotifierProvider<VehiclesProvider>(
          create: (context) => VehiclesProvider(),
        ),

        // Locale provider needs to be accessible in the whole app since locales
        // depends on it.
        ChangeNotifierProvider<LocalizationProvider>(
          create: (context) => LocalizationProvider(),
        ),

        // Theme provider is used to provide the theme style in the whole app.
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),

        // OrdersProvider needs to be accessible in all order widgets.
        ChangeNotifierProvider<OrdersProvider>(
          create: (context) => OrdersProvider(),
        ),
      ],
      child: const App(),
    );
  }
}
