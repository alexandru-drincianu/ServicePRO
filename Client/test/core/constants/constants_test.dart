import 'package:flutter_test/flutter_test.dart';

import 'package:service_pro/core/constants/constants.dart';

void main() {
  group(
    Constants,
    () {
      test(
        'api base has the correct value.',
        () {
          expect(
            Constants.apiBaseUrl,
            'http://boilerplates-api.stage02.netromsoftware.ro',
          );
        },
      );
    },
  );
}
