import 'package:flutter/material.dart';

import '../constants/text_constants.dart';

/// [ErrorDialog] is the common dialog used to show errors to user.
/// It contains an 'OK' button.
class ErrorDialog extends AlertDialog {
  const ErrorDialog({
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
    return AlertDialog(
      content:
          details == null ? Text(errorMessage) : Text('$errorMessage $details'),
      actions: [
        ElevatedButton(
          onPressed: onReturn,
          child: const Text(
            TextConstants.ok,
          ),
        ),
      ],
    );
  }
}
