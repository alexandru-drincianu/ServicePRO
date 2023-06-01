import 'package:flutter/material.dart';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:service_pro/core/localization/localization.dart';

class MockAppLocalizations extends AppLocalizations {
  MockAppLocalizations() : super(const Locale('EN'));

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _MockLocalizationDelegate();

  @override
  Future<bool> load() {
    return Future.value(true);
  }

  @override
  String translate(String key) => key;
}

class _MockLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _MockLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) async => MockAppLocalizations();

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

/// [MockCallback] is a simple interface used to mock the VoidCallbacks.
class MockCallback extends Mock {
  void call();
}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockEncryptedSharedPreferences extends Mock
    implements EncryptedSharedPreferences {}

class MockStream<T> extends Mock implements Stream<T> {}
