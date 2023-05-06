// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      name: json['fullName'] as String,
      token: json['token'] as String,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
      locale: const LocaleConverter()
          .fromJson(json['locale'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.name,
      'token': instance.token,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
      'locale': const LocaleConverter().toJson(instance.locale),
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
