part of 'localization.dart';

/// Extension used to add translate method on context.
extension ContextTranslations on BuildContext {
  /// Returns the current locale for this [context].
  Locale get currentLocale => watch<LocalizationProvider>().selectedLocale;

  /// Returns translation of a given key for a given locale. If the locale is not
  /// specified, current selected locale is used instead.
  ///
  /// It is using [LocalizationProvider] to get the job done.
  String translate(
    String key, {
    Locale? locale,
  }) =>
      locale != null
          ? read<LocalizationProvider>().translate(key, locale: locale)
          : Localizations.of<AppLocalizations>(this, AppLocalizations)
                  ?.translate(key) ??
              '';
}
