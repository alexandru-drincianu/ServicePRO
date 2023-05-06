import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

/// [LocaleConverter] is a [JsonConverter] used to serialize/deserialize the
/// locale.
class LocaleConverter extends JsonConverter<Locale?, Map<String, dynamic>?> {
  const LocaleConverter();

  @override
  fromJson(json) {
    if (json == null) return null;

    final languageCode = json['languageCode'];
    final countryCode = json['countryCode'];

    if (languageCode == null) return null;
    return Locale(languageCode, countryCode);
  }

  @override
  toJson(object) {
    return {
      'languageCode': object?.languageCode,
      'countryCode': object?.countryCode,
    };
  }
}
