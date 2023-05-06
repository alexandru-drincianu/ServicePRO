part of 'localization.dart';

@visibleForTesting
class AppLocalizations {
  final Locale locale;

  @visibleForTesting
  AppLocalizations(this.locale);

  /// Holds the translations for the given [locale].
  Map<String, String> _localizedStrings = {};

  /// Loads the translations values.
  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    try {
      final jsonString = await rootBundle.loadString(
        'assets/lang/${locale.languageCode}.json',
      );
      final Map<String, Object?> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });

      return true;
    } catch (ex) {
      log(ex.toString());
      return false;
    }
  }

  /// Returns the translated text for the given key.
  String translate(String key) {
    return _localizedStrings[key] ?? '';
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final supportedAppLocalizations = LocalizationProvider._localizations;
    final appLocalizations = supportedAppLocalizations[locale] ??
        supportedAppLocalizations[LocalizationProvider._defaultLocale];
    return appLocalizations!;
  }

  @override
  bool isSupported(Locale locale) {
    return Constants.supportedLocales.contains(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
