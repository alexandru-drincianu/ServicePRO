// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workorder_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkorderItemModel _$$_WorkorderItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_WorkorderItemModel(
      id: json['id'] as int?,
      itemType: json['itemType'] as int?,
      quantity: json['quantity'] as num?,
      consumableId: json['consumableId'] as int?,
      labourId: json['labourId'] as int?,
      description: json['description'] as String?,
      pricePerUnit: json['pricePerUnit'] as num?,
      minutes: json['minutes'] as int?,
      workorderId: json['workorderId'] as int?,
      totalCost: json['totalCost'] as num?,
      labour: json['labour'] == null
          ? null
          : LabourModel.fromJson(json['labour'] as Map<String, dynamic>),
      consumable: json['consumable'] == null
          ? null
          : ConsumableModel.fromJson(
              json['consumable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WorkorderItemModelToJson(
        _$_WorkorderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemType': instance.itemType,
      'quantity': instance.quantity,
      'consumableId': instance.consumableId,
      'labourId': instance.labourId,
      'description': instance.description,
      'pricePerUnit': instance.pricePerUnit,
      'minutes': instance.minutes,
      'workorderId': instance.workorderId,
      'totalCost': instance.totalCost,
      'labour': instance.labour?.toJson(),
      'consumable': instance.consumable?.toJson(),
    };
