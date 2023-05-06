import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fimber_io/fimber_io.dart';
import 'package:path_provider/path_provider.dart';

import 'app_wrapper.dart';
import 'core/constants/constants.dart';
import 'core/localization/localization.dart';
import 'core/locator.dart';

void main() {
  runZonedGuarded(
    () async {
      Future.microtask(() => {_configureLogger()});
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (FlutterErrorDetails details) {
        Fimber.e(
          'Flutter error',
          ex: details.exception,
          stacktrace: details.stack,
        );
      };

      setupLocator();

      await LocalizationProvider.init();
      runApp(const AppWrapper());
    },
    (
      e,
      stacktrace,
    ) {
      // TODO: there seems to be no handling in case the app crashes
      // The only thing the app will do is print the error
      Fimber.e(
        'Unhandled error',
        ex: e,
        stacktrace: stacktrace,
      );
    },
  );
}

// TODO: I feel like this is not the place to keep this method
// Anyway, what's the reason for keeping logs in files?
Future _configureLogger() async {
  final directory = await getExternalStorageDirectory();
  if (directory?.path != null) {
    final Directory appDocDirFolder = Directory('${directory!.path}/Log');
    if (!await appDocDirFolder.exists()) {
      await appDocDirFolder.create(recursive: true);
    }
    var logTree = SizeRollingFileTree(
      DataSize.mega(10),
      filenamePrefix: '${appDocDirFolder.path}/${Constants.logPrefix}',
      filenamePostfix: Constants.logPostfix,
    );
    Fimber.plantTree(logTree);
  }
}
