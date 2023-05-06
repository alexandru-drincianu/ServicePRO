import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/locale_converter.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

/// [UserModel] is the model used to hold the user name, token, and id. It is received
/// after a successful api login.

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    @JsonKey(name: 'fullName') required String name,
    required String token,
    ThemeMode? themeMode,
    @LocaleConverter() Locale? locale,
    @JsonKey(name: 'role') required int role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
