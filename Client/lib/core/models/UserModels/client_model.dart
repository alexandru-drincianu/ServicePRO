import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_pro/core/models/AddressModels/address_model.dart';

part 'client_model.freezed.dart';

part 'client_model.g.dart';

/// [ClientModel] is the model used to hold the client details

@freezed
class ClientModel with _$ClientModel {
  const factory ClientModel({
    required int id,
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'telephoneNumber') String? telephoneNumber,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'address') AddressModel? address,
  }) = _ClientModel;

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);
}
