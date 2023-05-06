# State Management

This project uses [provider](https://pub.dev/packages/provider) as the state management ecosystem of the app. Provider is not only very popular but it is also Flutter Favorite and very easy to use.

Provider uses **observer** pattern under the hood to update the views making it the most simple state management there is. But being simple does not mean it does not have everything you need.

Whenever `notifyListeners()` method is called inside a provider, all listeners are notified which in turn can lead to view re-render if you've wired them properly.

To rebuild your widget on all `notifyListeners()` calls, it is enough to add the following line in your widget's `build()` method:

```dart
final provider = context.watch<ProviderType>();
```

You can, then, easily access any state information from inside the provider since you now have access to its instance.

However, if you have a more complex widget tree and you want to rebuild them only on some updates, you should use:

```dart
final selectedProperty = context.select<ProviderType, SelectedPropertyType>(
    (provider) => provider.someProperty,
);
```

This will return you the value of `someProperty` and whenever `notifyListeners()` method is called, the selector evaluates the property value and compares it to the previous value of the property. If the value is different, your whole widget tree under the `context` used will get rebuilt and you will get the updated property value in `selectedProperty` variable.

"This is easy, but what if I want to trigger an action but I do not want to rebuild anything?" you may ask. Well, it is easy, just use:

```dart
final provider = context.read<ProviderType>();
```

This will give you the provider value but it does not rebuild your widget tree when `notifyListeners()` is called.

For each of the above methods, there is a widget provided by the pub:

For `context.watch()`, the counter-part widget is [Consumer](https://pub.dev/documentation/provider/latest/provider/Consumer-class.html).

For `context.select()`, the counter-part widget is [Selector](https://pub.dev/documentation/provider/latest/provider/Selector-class.html).

For `context.read()` there is no counter-part widget since it only gives you the provider.

For more about provider, you can read [here](https://pub.dev/documentation/provider/latest/provider/provider-library.html) the documentation.

## Error handling with Provider

For more information regarding the error handling using provider please read [here](error-handling.md#http-requests-errors-handling).

## Other state management libraries

As you can imagine, Provider is not the only state management library. There are plenty of state management libraries, but this boilerplate uses Provider.

Here are some honorable mentions:

- [Bloc (also known as Cubit)](https://pub.dev/packages/flutter_bloc)
- [GetX](https://pub.dev/packages/get)
- [Riverpod](https://pub.dev/packages/riverpod)
