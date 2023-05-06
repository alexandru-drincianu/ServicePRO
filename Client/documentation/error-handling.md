# Error Handling

## [Flutter framework error handling](https://docs.flutter.dev/testing/errors)

The Flutter framework catches errors that occur during callbacks triggered by the framework itself,
including errors encountered during the build, layout, and paint phases.
All errors caught by Flutter are routed to the FlutterError.onError handler.

```dart
void main() {
  FlutterError.onError = (details) {
    // Handle exception
  };
  runApp(const MyApp());
}
```

## [Dart-specific error handling](https://dart.dev/articles/archive/zones#handling-asynchronous-errors)

Protect your app from exiting due to an uncaught exception thrown by asynchronous code.

```dart
void main() {
  runZonedGuarded(() async {
    runApp(MyApp()); // starting point of app
   },(error, stackTrace) {
      //Handle exception
  });
 }
```

## HTTP requests errors handling

To handle HTTP requests we are using a special model which can hold details about the state of a given HTTP request. The model can be found [here](/lib/core/models/base_state.dart).

Handling errors is done by validating the response in services and throwing exceptions if the response is not `200 OK`. After the validation logic in services, providers use a `try-catch` block to catch all exceptions and to update the state to error. This is done using the constructor `BaseState.error(exception)`. The state is then `provided` to the views which react based on the state type.

Handling the exceptions can also be done by using a boolean for `isError` but this way (using state object) is much cleaner and helps us to keep things organized. For example, a GET request will have its own state.

### Other state models

Provider does not offer us a fixed state model since it is so minimalist but you can cross-use a state model from other state management libraries if you want. We like [AsyncValue](https://pub.dev/documentation/riverpod/latest/riverpod/AsyncValue-class.html) from [riverpod](https://pub.dev/packages/riverpod).
