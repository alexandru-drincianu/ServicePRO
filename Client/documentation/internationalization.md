# Internationalization

This project uses a custom-made internationalization mechanism. All translations are saved in json files and loaded automatically in the app based on the current user locale.

You can find each json file organized by locale under [assets/lang](../assets/lang/) directory.

This method of custom-made internationalization works just fine however there is an easier way to do it, provided by flutter framework which uses generated classes based on .arb files. Nowadays, generated files are more reliable to use since it ensures an error-less development experience and more efficient since it spares you from writing boilerplate code which can be error-prone. For more details please read [here](https://docs.flutter.dev/development/accessibility-and-localization/internationalization).
