import 'package:flutter/material.dart';

import '../../../../core/localization/localization.dart';

/// [DeleteAlertDialog] is the alert dialog shown when trying to delete an order
class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.translate(
          TranslationKeys.deleteDialogTitle,
        ),
      ),
      content: Text(
        context.translate(
          TranslationKeys.deleteDialogContent,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            context.translate(
              TranslationKeys.deleteDialogConfirm,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            context.translate(
              TranslationKeys.deleteDialogCancel,
            ),
          ),
        ),
      ],
    );
  }
}
