// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleModel _$$_VehicleModelFromJson(Map<String, dynamic> json) =>
    _$_VehicleModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      user: json['user'] == null
          ? null
          : UserDetails.fromJson(json['user'] as Map<String, dynamic>),
      registration: json['registration'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      vin: json['vin'] as String?,
      mileage: json['mileage'] as num?,
      fuelType: json['fuelType'] as int?,
    );

Map<String, dynamic> _$$_VehicleModelToJson(_$_VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'user': instance.user?.toJson(),
      'registration': instance.registration,
      'brand': instance.brand,
      'model': instance.model,
      'vin': instance.vin,
      'mileage': instance.mileage,
      'fuelType': instance.fuelType,
    };
