import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/locale_converter.dart';

part 'address_model.freezed.dart';

part 'address_model.g.dart';

/// [AddressModel] is the model used to hold the address details

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @JsonKey(name: 'street') required String street,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'county') required String county,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
