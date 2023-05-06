# Logging

This project uses [fimber](https://pub.dev/packages/fimber) pub for extra logging.

The Fimber setup is done in the 'main.dart' file, where you are able to config params like log file name, maximum file size, log format and log levels.

```dart
    var logTree = SizeRollingFileTree(
        DataSize.mega(10),
        filenamePrefix: '${appDocDirFolder.path}/${Constants.logPrefix}',
        filenamePostfix: Constants.logPostfix,
    );
    Fimber.plantTree(logTree);
```

With this pub, the logs will be saved in the path '/storage/emulated/0/Android/data/com.netrom.provider_boilerplate/files/Log/boilerplate1.log'.

Log levels used in Fimber are:

```dart
    Fimber.v(...) // Verbose level logging
    Fimber.d(...) // Debug level logging
    Fimber.i(...) // Info level logging
    Fimber.w(...) // Warning level logging
    Fimber.e(...) // Error level logging
```

and the default one is 'DEFAULT = ["D", "I", "W", "E"]';
