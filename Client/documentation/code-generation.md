# Code Generation

This project is using [freezed](https://pub.dev/packages/freezed) and [json_serializable](https://pub.dev/packages/json_serializable)
which are dependant on [build_runner](https://pub.dev/packages/build_runner) for code generation.

Use one of the following commands to add/update code from `**.g.dart` and `**.freezed.dart` files:

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

or

```shell
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Mutable or Immutable Properties

If you don't need mutable properties please use the following annotation, which will create a class
with all fields marked as final:

```dart
@freezed
```

If you need mutable properties please use the following annotation:

```dart
@unfreezed
```

You can check more about this topic yourself [here](https://pub.dev/documentation/freezed/latest/#defining-a-mutable-class-instead-of-an-immutable-one).
