import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumable_model.freezed.dart';

part 'consumable_model.g.dart';

@freezed
class ConsumableModel with _$ConsumableModel {
  const factory ConsumableModel({
    int? id,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') num? price,
  }) = _ConsumableModel;

  factory ConsumableModel.fromJson(Map<String, dynamic> json) =>
      _$ConsumableModelFromJson(json);
}
