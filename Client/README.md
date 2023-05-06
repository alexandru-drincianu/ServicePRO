# NetRom Flutter Boilerplate 🎯

## Description 🔖

A Flutter boilerplate project to be used as a starting point for future Flutter projects.
The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project.

By using the boilerplate code as a standard initializer, we can have the same patterns in all the projects that inherit it. This will also help in reducing setup & development time by allowing you to use the same code pattern and avoid re-writing from scratch.

## Requirements 💻

This boilerplate application needs the following tools installed before running it:

- [Android Studio](https://developer.android.com/studio) / [VSCode](https://code.visualstudio.com) IDE
- [FlutterSDK](https://docs.flutter.dev/get-started)

If you want to run the Boilerplate on Windows, you have to install VS 2022  or Visual Studio Build Tools 2022. When installing you need the “Desktop development with C++” workload installed for building windows, including all of its default components.

More details about the Windows installation [here](https://docs.flutter.dev/get-started/install/windows#additional-windows-requirements).

## Getting Started 🚀

Run the following command `flutter doctor` to see if there are any platform dependencies needed to complete the setup:

Install pub dependencies:

```sh
flutter pub get
```

Run the project from your preferred IDE (Android Studio or VS Code).

For help getting started with Flutter, view the [official documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full Flutter API reference.

## What's inside this boilerplate?

In terms of code, it contains a basic set of functions/tools and other things that are the basis for any Flutter project architecture, meaning:

- ###  [General project structure](documentation/project-structure.md)

- ###  [Authentication](documentation/authentication.md)

- ###  [Routing and navigation](documentation/routing-navigation.md)

- ###  [State management](documentation/state-management.md)

- ###  [HTTP requests](documentation/http-requests.md)

- ###  [Logging](documentation/logging.md)

- ###  [Error handling](documentation/error-handling.md)

- ###  [Internationalization(i18n)](documentation/internationalization.md)

- ###  [Project features](documentation/project-features.md)

- ###  [Code Generation With Freezed](documentation/code-generation.md)

- ###  [Tests](documentation/tests.md)

In order to see this boilerplate in action please use the following [link](http://boilerplate.flutter.provider.stage02.netromsoftware.ro/#/login).

You can login using the following credentials:

- username: test
- password: 123qweASD

In order for the deployed version of the boilerplate to work, a backend API (developed in NET6) is used. Don't be afraid of making changes in the UI and save data against the API, because it's ours (deployed on our staging server).

## Import Sorter

We use [import_sorter](https://pub.dev/packages/import_sorter) pub for sorting the imports. Besides the alphabetical sorting, this
will group them in the following order: Dart imports, Flutter imports, package imports, and project imports.

You can read more about the import sorter and how to use it [here](documentation/import-sorter.md).

However, if you don't want to be so strict with imports then IDEs like Android Studio and VSCode have built-in out-of-the-box support for sorting the imports alphabetically.

## Resources 📕

A few resources to get you started if this is your first Flutter project:

- [Internal wiki](http://wiki.netrom.live/tech/) - see Flutter & Dart section
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

## Useful commands

Clean pub dependencies:

```shell
flutter clean
```

Format code from lib and test using the official dart code style. This way you will have a unified code
style within the entire team:

```shell
flutter format lib; flutter format test
```

This project uses inject library that works with code generation, execute the following command to
generate files:

```shell
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```shell
flutter packages pub run build_runner watch
```
