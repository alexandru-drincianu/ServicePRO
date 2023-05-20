// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientModel _$$_ClientModelFromJson(Map<String, dynamic> json) =>
    _$_ClientModel(
      id: json['id'] as int,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
      notes: json['notes'] as String?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClientModelToJson(_$_ClientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'username': instance.username,
      'email': instance.email,
      'telephoneNumber': instance.telephoneNumber,
      'notes': instance.notes,
      'address': instance.address?.toJson(),
    };
