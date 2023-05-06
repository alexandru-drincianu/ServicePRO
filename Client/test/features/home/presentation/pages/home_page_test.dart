import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:service_pro/core/constants/translation_keys.dart';
import 'package:service_pro/core/widgets/app_drawer.dart';
import 'package:service_pro/features/home/presentation/pages/home_page.dart';
import '../../../../helpers.dart';

void main() {
  group(
    HomePage,
    () {
      testWidgets(
        'renders correctly.',
        (tester) async {
          await renderWidget(tester, const HomePage());
          await tester.pumpAndSettle();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(
            find.widgetWithText(AppBar, TranslationKeys.appTitle),
            findsOneWidget,
          );

          expect(find.text(TranslationKeys.homeTitle), findsOneWidget);

          // Open drawer
          await tester.dragFrom(
            tester.getTopLeft(find.byType(MaterialApp)),
            const Offset(300, 0),
          );
          await tester.pumpAndSettle();

          expect(find.byType(AppDrawer), findsOneWidget);
        },
      );
    },
  );
}
