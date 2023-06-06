// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workorder_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkorderItemModel _$$_WorkorderItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_WorkorderItemModel(
      id: json['id'] as int?,
      userId: json['description'] as int?,
      price: json['price'] as num?,
      quantity: json['quantity'] as num?,
    );

Map<String, dynamic> _$$_WorkorderItemModelToJson(
        _$_WorkorderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.userId,
      'price': instance.price,
      'quantity': instance.quantity,
    };
