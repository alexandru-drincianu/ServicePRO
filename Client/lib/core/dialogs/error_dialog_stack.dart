import 'package:flutter/material.dart';

import '../constants/text_constants.dart';

// TODO: add documentation
class ErrorDialogStack extends AlertDialog {
  const ErrorDialogStack({
    required this.errorMessage,
    required this.onReturn,
    this.details,
    super.key,
  });

  /// The message shown in the content of the AlertDialog
  final String errorMessage;

  /// [onReturn] is called when the OK button is tapped
  final void Function() onReturn;

  /// The details of the error. This is appended to the [errorMessage].
  final String? details;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TODO: properties are not customizable enough
        // TODO: error dialog can be merged with error dialog stack
        const Opacity(
          opacity: 0.1,
          child: ModalBarrier(
            dismissible: false,
          ),
        ),
        // TODO: reimplementation of ErrorDialog
        AlertDialog(
          content: details == null
              ? Text(errorMessage)
              : Text('$errorMessage $details'),
          actions: [
            ElevatedButton(
              onPressed: onReturn,
              child: const Text(TextConstants.ok),
            ),
          ],
        ),
      ],
    );
  }
}
