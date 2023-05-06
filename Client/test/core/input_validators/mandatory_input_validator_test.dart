import 'package:flutter_test/flutter_test.dart';

import 'package:service_pro/core/input_validators/mandatory_input_validator.dart';

void main() {
  group(
    MandatoryInputValidator,
    () {
      group(
        'validate()',
        () {
          test(
            'returns error message if value is null.',
            () => expect(
              MandatoryInputValidator.validate(null, '#errorMessage'),
              '#errorMessage',
            ),
          );

          test(
            'returns error message if value is empty.',
            () => expect(
              MandatoryInputValidator.validate('', '#errorMessage'),
              '#errorMessage',
            ),
          );

          test(
            'returns null if value is not empty.',
            () => expect(
              MandatoryInputValidator.validate('#value', '#errorMessage'),
              null,
            ),
          );
        },
      );
    },
  );
}
