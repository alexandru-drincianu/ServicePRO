// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleScanModel _$$_VehicleScanModelFromJson(Map<String, dynamic> json) =>
    _$_VehicleScanModel(
      licensePlate: json['licensePlate'] as String?,
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_VehicleScanModelToJson(_$_VehicleScanModel instance) =>
    <String, dynamic>{
      'licensePlate': instance.licensePlate,
      'vehicle': instance.vehicle?.toJson(),
    };
