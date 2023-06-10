// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvoiceModel _$$_InvoiceModelFromJson(Map<String, dynamic> json) =>
    _$_InvoiceModel(
      id: json['id'] as int?,
      number: json['number'] as String?,
      workorderId: json['workorderId'] as int?,
      workorder: json['workorder'] == null
          ? null
          : WorkorderModel.fromJson(json['workorder'] as Map<String, dynamic>),
      invoiceStatus: json['invoiceStatus'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_InvoiceModelToJson(_$_InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'workorderId': instance.workorderId,
      'workorder': instance.workorder?.toJson(),
      'invoiceStatus': instance.invoiceStatus,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
