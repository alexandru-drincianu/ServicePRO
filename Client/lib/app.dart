import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/constants.dart';
import 'core/localization/localization.dart';
import 'core/theme/theme.dart';
import 'routing/guards/auth_guard.dart';
import 'routing/observers/root_observer.dart';
import 'routing/routing.dart';

/// [App] is the root widget of this app
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    // Create app router to add auth guard here
    router = AppRouter(
      authGuard: AuthGuard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: BotToastInit(),
      routerDelegate: AutoRouterDelegate(
        router,
        navigatorObservers: () => [RootObserver()],
      ),
      routeInformationParser: router.defaultRouteParser(),
      onGenerateTitle: (context) => context.translate(
        TranslationKeys.appTitle,
      ),
      themeMode: context.currentTheme,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      locale: context.currentLocale,
      supportedLocales: Constants.supportedLocales,
      localizationsDelegates: const [
        // A class which loads the translations from JSON files
        LocalizationProvider.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
    );
  }
}
