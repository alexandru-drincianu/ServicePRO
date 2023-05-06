// TODO: add class documentation
class MandatoryInputValidator {
  const MandatoryInputValidator._();

  // TODO: add documentation
  // TODO: check if its better to use named parameters here
  // (reason behind: this is a static function which will be accessed from
  // multiple parts of the app, and can be used by multiple developers.
  // By using named parameters we ensure visibility of the parameters and
  // readability of the code. This also helps improve the time it takes to
  // understand a given method.
  static String? validate(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
