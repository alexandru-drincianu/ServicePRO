import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import 'package:service_pro/core/services/shared_preference_service.dart';
import '../../mocks.dart';

void main() {
  group(
    SharedPreferenceService,
    () {
      late final MockSharedPreferences mockSharedPreferences;
      late final MockEncryptedSharedPreferences mockEncryptedSharedPreferences;

      late final SharedPreferenceService service;

      setUpAll(() async {
        mockSharedPreferences = MockSharedPreferences();
        mockEncryptedSharedPreferences = MockEncryptedSharedPreferences();

        service = SharedPreferenceService(
          sharedPreferences: mockSharedPreferences,
          encryptedSharedPreferences: mockEncryptedSharedPreferences,
        );
      });

      test(
        'write() calls sharedPrefs.setString with the given key and value.',
        () async {
          when(
            () => mockSharedPreferences.setString(any(), any()),
          ).thenAnswer(
            (_) => Future.value(true),
          );

          await service.write('#key', '#value');

          verify(
            () => mockSharedPreferences.setString('#key', '#value'),
          ).called(1);
        },
      );

      test(
        'writeEncrypted() calls encryptedSharedPrefs.setString with the given '
        'key and value.',
        () async {
          when(
            () => mockEncryptedSharedPreferences.setString(any(), any()),
          ).thenAnswer(
            (_) => Future.value(true),
          );

          await service.writeEncrypted('#key', '#value');

          verify(
            () => mockEncryptedSharedPreferences.setString('#key', '#value'),
          ).called(1);
        },
      );
    },
  );
}
