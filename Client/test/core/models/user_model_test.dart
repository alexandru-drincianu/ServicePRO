import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:service_pro/core/models/user_model.dart';

void main() {
  group(
    UserModel,
    () {
      test(
        'constructor creates object with correct properties.',
        () {
          const model = UserModel(
            id: 0,
            name: '#name',
            token: '#token',
          );

          expect(model.id, 0);
          expect(model.name, '#name');
          expect(model.token, '#token');
        },
      );

      test(
        'toJson() returns correct json.',
        () {
          const model = UserModel(
            id: 0,
            name: '#name',
            token: '#token',
            themeMode: null,
            locale: null,
          );

          expect(
            model.toJson(),
            {
              'id': 0,
              'fullName': '#name',
              'token': '#token',
              'themeMode': null,
              'locale': {'languageCode': null, 'countryCode': null},
            },
          );
        },
      );

      test(
        'fromJson() returns correct object.',
        () {
          const model = UserModel(
            id: 0,
            name: '#name',
            token: '#token',
          );

          expect(
            UserModel.fromJson({
              'id': 0,
              'fullName': '#name',
              'token': '#token',
            }),
            model,
          );
        },
      );
    },
  );
}
