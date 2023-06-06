// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LabourModel _$$_LabourModelFromJson(Map<String, dynamic> json) =>
    _$_LabourModel(
      id: json['id'] as int?,
      description: json['description'] as String?,
      hourlyWage: json['hourlyWage'] as num?,
      minutes: json['minutes'] as int?,
    );

Map<String, dynamic> _$$_LabourModelToJson(_$_LabourModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'hourlyWage': instance.hourlyWage,
      'minutes': instance.minutes,
    };
