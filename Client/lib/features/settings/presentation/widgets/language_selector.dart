import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../../../core/localization/localization.dart';

/// [LanguageSelector] is the component used to update the locale of the app.
class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${context.translate(TranslationKeys.language)}:',
        ),
        const SizedBox(width: ThemeConstants.sizeUnitS),
        DropdownButton<Locale>(
          value: Localizations.localeOf(context),
          items: Constants.supportedLocales
              .map(
                (locale) => DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(
                    // We want to get the translated locale name (for each
                    // locale).
                    context.translate(
                      TranslationKeys.localeName,
                      locale: locale,
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(growable: false),
          onChanged: (locale) {
            if (locale == null) return;
            context.read<LocalizationProvider>().changeLocale(locale);
          },
        ),
      ],
    );
  }
}
