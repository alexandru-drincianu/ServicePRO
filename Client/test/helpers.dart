import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:service_pro/core/localization/localization.dart';
import 'mocks.dart';

/// [renderWidget] calls [tester.pumpWidget] with a default wrapper around the
/// [Widget] that is targeted for testing. [MultiProvider], [MaterialApp] with
/// [AppLocalizations] and [GlobalMaterialLocalizations].
Future<void> renderWidget(
  WidgetTester tester,
  Widget widget, {
  bool mockTranslations = true,
  List<ChangeNotifierProvider> providers = const [],
}) async {
  // Set tester screen size to 1200x600.
  tester.binding.window.physicalSizeTestValue = const Size(1200, 600);
  tester.binding.window.devicePixelRatioTestValue = 1.0;

  if (!mockTranslations) {
    await LocalizationProvider.init();
  }

  // Wrap the widget inside MaterialApp with mock localizations.
  Widget app = MaterialApp(
    home: widget,
    localizationsDelegates: [
      mockTranslations
          ? MockAppLocalizations.delegate
          : LocalizationProvider.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
  );

  // We need to do this inside if otherwise it fails on assertion in [MultiProvider].
  if (providers.isNotEmpty) {
    app = MultiProvider(
      providers: providers,
      child: app,
    );
  }

  // Render widget
  await tester.pumpWidget(app);
  await tester.pump();
}
