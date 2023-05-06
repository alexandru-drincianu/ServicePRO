import 'package:flutter/material.dart';

/// [Constants] is used to store basic constants that are needed across the app.
/// You can store almost every constant type in here apart from the text constants
/// or translations which have their dedicated files.
class Constants {
  const Constants._();

  // Time constants
  /// Seconds for which a toast is visible
  static const toastDisplayTime = 2;
  static const numberOfDaysAhead = 730;

  // Api
  static const apiBaseUrl = 'http://10.0.2.2:5000';

  // Logger
  static const logPrefix = 'boilerplate';
  static const logPostfix = '.log';

  /// The list of all supported locales. For our case it is enough to keep them
  /// here but in other cases, fetching them from api might be required.
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('nl', 'NL'),
  ];
}
