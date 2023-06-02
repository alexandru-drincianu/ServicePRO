// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workorder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkorderModel _$$_WorkorderModelFromJson(Map<String, dynamic> json) =>
    _$_WorkorderModel(
      id: json['id'] as int?,
      vehicleId: json['vehicleId'] as int?,
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      status: json['status'] as int?,
      remarks: json['remarks'] as String?,
      arrivedDate: json['arrivedDate'] == null
          ? null
          : DateTime.parse(json['arrivedDate'] as String),
      departedDate: json['departedDate'] == null
          ? null
          : DateTime.parse(json['departedDate'] as String),
      totalCost: json['totalCost'] as num?,
      isInvoiced: json['isInvoiced'] as bool?,
      workorderItems: (json['workorderItems'] as List<dynamic>?)
          ?.map((e) => WorkorderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: json['number'] as String?,
    );

Map<String, dynamic> _$$_WorkorderModelToJson(_$_WorkorderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'vehicle': instance.vehicle?.toJson(),
      'status': instance.status,
      'remarks': instance.remarks,
      'arrivedDate': instance.arrivedDate?.toIso8601String(),
      'departedDate': instance.departedDate?.toIso8601String(),
      'totalCost': instance.totalCost,
      'isInvoiced': instance.isInvoiced,
      'workorderItems':
          instance.workorderItems?.map((e) => e.toJson()).toList(),
      'number': instance.number,
    };
