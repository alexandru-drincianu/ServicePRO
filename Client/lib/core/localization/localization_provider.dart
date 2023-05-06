part of 'localization.dart';

/// [LocalizationProvider] is the provider of the current selected locale.
class LocalizationProvider extends ChangeNotifier {
  final _userSettingsService = locator<UserSettingsService>();
  static final _defaultLocale = Constants.supportedLocales[0];

  /// The list of all localizations available to this app
  static final _localizations = <Locale, AppLocalizations>{}..addEntries(
      Constants.supportedLocales.map(
        (locale) => MapEntry(
          locale,
          AppLocalizations(locale),
        ),
      ),
    );

  /// Returns the selected locale
  Locale get selectedLocale => _userSettingsService.locale ?? _defaultLocale;

  /// Returns the current localizations delegate
  static const delegate = _AppLocalizationsDelegate();

  /// Initializes all localizations
  static Future<void> init() async {
    for (final localization in _localizations.values) {
      await localization.load();
    }
  }

  /// Updates the locale and rebuilds the app
  void changeLocale(Locale locale, {bool forceUpdate = false}) {
    // If the locale is the same as the current selected locale,
    // or if the locale isn't supported, we return without making any changes.
    if (!forceUpdate &&
        (selectedLocale == locale ||
            !Constants.supportedLocales.contains(locale))) {
      return;
    }

    _userSettingsService.locale = locale;
    notifyListeners();
  }

  /// Returns translation of a given key for a given locale. If the locale is not
  /// specified, current selected locale is used instead.
  String translate(String key, {Locale? locale}) {
    return _localizations[locale ?? selectedLocale]?.translate(key) ?? '';
  }
}
