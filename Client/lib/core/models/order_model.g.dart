// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as int?,
      number: json['number'] as String,
      client: json['client'] as String,
      capacity: json['capacity'] as int,
      value: (json['value'] as num).toDouble(),
      deliveryDate: json['deliveryDate'] as String,
      isActive: json['isActive'] as bool,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['number'] = instance.number;
  val['client'] = instance.client;
  val['capacity'] = instance.capacity;
  val['value'] = instance.value;
  val['deliveryDate'] = instance.deliveryDate;
  val['isActive'] = instance.isActive;
  val['isDeleted'] = instance.isDeleted;
  return val;
}
