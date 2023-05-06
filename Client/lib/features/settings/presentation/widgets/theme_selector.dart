import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/theme/theme.dart';

/// [ThemeSelector] is the component used to update the theme of the app.
class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${context.translate(TranslationKeys.theme)}:',
        ),
        const SizedBox(width: ThemeConstants.sizeUnitS),
        DropdownButton<ThemeMode>(
          value: context.currentTheme,
          items: ThemeMode.values
              .map(
                (theme) => DropdownMenuItem<ThemeMode>(
                  value: theme,
                  child: Text(
                    theme.displayName(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(growable: false),
          onChanged: (theme) {
            if (theme == null) return;
            context.read<ThemeProvider>().changeTheme(theme);
          },
        ),
      ],
    );
  }
}

extension DisplayName on ThemeMode {
  /// Returns the display name of this theme style
  String displayName(BuildContext context) => context.translate(name);
}
