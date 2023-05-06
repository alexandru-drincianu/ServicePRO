import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import 'package:service_pro/core/constants/text_constants.dart';
import 'package:service_pro/core/dialogs/error_dialog.dart';
import '../../helpers.dart';
import '../../mocks.dart';

void main() {
  group(
    ErrorDialog,
    () {
      testWidgets(
        'creates an [AlertDialog] with the error message as content if '
        'details is null.',
        (tester) async {
          await renderWidget(
            tester,
            ErrorDialog(
              errorMessage: '#errorMessage',
              onReturn: () {},
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.widgetWithText(AlertDialog, '#errorMessage'),
            findsOneWidget,
          );

          expect(
            find.widgetWithText(ElevatedButton, TextConstants.ok),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'creates an [AlertDialog] with the error message and details as content '
        'if details are not null.',
        (tester) async {
          await renderWidget(
            tester,
            ErrorDialog(
              errorMessage: '#errorMessage',
              details: '#details',
              onReturn: () {},
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.widgetWithText(AlertDialog, '#errorMessage #details'),
            findsOneWidget,
          );

          expect(
            find.widgetWithText(ElevatedButton, TextConstants.ok),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'calls onReturn callback when tapping on the ok button.',
        (tester) async {
          final mockOnReturn = MockCallback();

          await renderWidget(
            tester,
            ErrorDialog(
              errorMessage: '#errorMessage',
              onReturn: mockOnReturn.call,
            ),
          );

          await tester.pumpAndSettle();
          await tester.tap(find.text(TextConstants.ok));

          verify(mockOnReturn.call).called(1);
        },
      );
    },
  );
}
