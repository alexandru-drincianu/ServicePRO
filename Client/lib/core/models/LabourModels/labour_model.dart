import 'package:freezed_annotation/freezed_annotation.dart';

part 'labour_model.freezed.dart';

part 'labour_model.g.dart';

@freezed
class LabourModel with _$LabourModel {
  const factory LabourModel({
    int? id,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'hourlyWage') num? hourlyWage,
    @JsonKey(name: 'minutes') int? minutes,
  }) = _LabourModel;

  factory LabourModel.fromJson(Map<String, dynamic> json) =>
      _$LabourModelFromJson(json);
}
