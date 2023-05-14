import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_pro/core/models/address_model.dart';

import '../converters/locale_converter.dart';

part 'client_model.freezed.dart';

part 'client_model.g.dart';

/// [ClientModel] is the model used to hold the client details

@freezed
class ClientModel with _$ClientModel {
  const factory ClientModel({
    required int id,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'telephoneNumber') required String telephoneNumber,
    @JsonKey(name: 'notes') required String notes,
    @JsonKey(name: 'address') required AddressModel address,
  }) = _ClientModel;

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);
}
