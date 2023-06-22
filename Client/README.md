# ServicePRO Flutter Application

## Description

This repository contains a Flutter project that serves as a web API client for interacting with backend services. With Flutter's versatility, you can create a powerful and responsive web application that consumes data from various API endpoints.

## Requirements 💻

This application needs the following tools installed before running it:

- [Android Studio](https://developer.android.com/studio) / [VSCode](https://code.visualstudio.com) IDE
- [FlutterSDK](https://docs.flutter.dev/get-started)

If you want to run the application on Windows, you have to install VS 2022  or Visual Studio Build Tools 2022. When installing you need the “Desktop development with C++” workload installed for building windows, including all of its default components.

## Getting Started 

Run the following command `flutter doctor` to see if there are any platform dependencies needed to complete the setup:

Install pub dependencies:

```sh
flutter pub get
```

Run the project from your preferred IDE (Android Studio or VS Code).

## What's inside this project?

In terms of code, it contains a basic set of functions/tools and other things that are the basis for any Flutter project architecture, meaning:

- ###  [General project structure](documentation/project-structure.md)

- ###  [Authentication](documentation/authentication.md)

- ###  [Routing and navigation](documentation/routing-navigation.md)

- ###  [HTTP requests](documentation/http-requests.md)

- ###  [Project features](documentation/project-features.md)

- ###  [Code Generation With Freezed](documentation/code-generation.md)

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
