import 'package:freezed_annotation/freezed_annotation.dart';

part 'workorder_item_model.freezed.dart';

part 'workorder_item_model.g.dart';

/// [WorkorderItemModel] is the model used to hold the client details

@freezed
class WorkorderItemModel with _$WorkorderItemModel {
  const factory WorkorderItemModel({
    int? id,
    @JsonKey(name: 'description') int? userId,
    @JsonKey(name: 'price') num? price,
    @JsonKey(name: 'quantity') num? quantity,
  }) = _WorkorderItemModel;

  factory WorkorderItemModel.fromJson(Map<String, dynamic> json) =>
      _$WorkorderItemModelFromJson(json);
}
