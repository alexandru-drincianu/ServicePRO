import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../core/localization/localization.dart';
import '../core/theme/theme.dart';
import '../features/login/provider/login_provider.dart';
import 'routing.dart';

/// [SplashPage] is the first screen loaded in the app. It is used specifically
/// to check if the user is logged in and to load his details.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  /// Initializes all vital components of the app.
  Future<void> initialize() async {
    final loginProvider = context.read<LoginProvider>();
    final themeProvider = context.read<ThemeProvider>();
    final localizationProvider = context.read<LocalizationProvider>();
    await Future.delayed(const Duration(seconds: 3));
    // Check if user is logged in by loading user data
    await loginProvider.checkLoggedInUser();

    // If the user is authenticated, redirect to Home, otherwise go to Login.
    if (loginProvider.authenticationState.isSuccess) {
      // Note: We don't check for mounted since we want the navigation to take
      // place regardless of the current widget state. Theme and localizations
      // needs to be updated as well.
      await router.replaceAll(const [HomeRoute()]);

      // Force Theme and Localization to update listeners.
      themeProvider.changeTheme(themeProvider.themeMode, forceUpdate: true);
      localizationProvider.changeLocale(
        localizationProvider.selectedLocale,
        forceUpdate: true,
      );
    } else {
      router.replaceAll([LoginRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 1,
              ), // adjust the margin to move the loader below the image
              child: const CircularProgressIndicator(),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 32.0),
                child: Text(
                  'ServicePro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
