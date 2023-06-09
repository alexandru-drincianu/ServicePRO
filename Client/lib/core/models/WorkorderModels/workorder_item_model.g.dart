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
      price: json['price'] as num?,
      minutes: json['minutes'] as int?,
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
      'price': instance.price,
      'minutes': instance.minutes,
    };
