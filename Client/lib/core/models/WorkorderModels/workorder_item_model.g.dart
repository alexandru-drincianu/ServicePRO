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
      consumable: json['consumable'] == null
          ? null
          : ConsumableModel.fromJson(
              json['consumable'] as Map<String, dynamic>),
      labourId: json['labourId'] as int?,
      labour: json['labour'] == null
          ? null
          : LabourModel.fromJson(json['labour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WorkorderItemModelToJson(
        _$_WorkorderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemType': instance.itemType,
      'quantity': instance.quantity,
      'consumableId': instance.consumableId,
      'consumable': instance.consumable?.toJson(),
      'labourId': instance.labourId,
      'labour': instance.labour?.toJson(),
    };
