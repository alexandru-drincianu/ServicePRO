# Tests

Within this boilerplate, we covered the tests with unit and widget tests. But it is worth mentioning
that with Flutter, integration tests on real device (or simulator) is possible. Moreover, E2E testing
is also possible thanks to [flutter_driver](https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html) library.

Pubs used for flutter widget tests:

- faker: library for generating fake data
- mocktail: Dart mock library which simplifies mocking with null safety support and no manual mocks or code generation
- mockingjay: package that makes it easy to mock, test and verify navigation calls in Flutter
- network_image_mock: utility for providing mocked Image.network response in Flutter widget tests
- test: official dart testing library
