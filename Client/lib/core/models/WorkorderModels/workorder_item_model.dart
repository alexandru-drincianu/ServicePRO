import 'package:freezed_annotation/freezed_annotation.dart';

part 'workorder_item_model.freezed.dart';

part 'workorder_item_model.g.dart';

/// [WorkorderItemModel] is the model used to hold the client details

@freezed
class WorkorderItemModel with _$WorkorderItemModel {
  const factory WorkorderItemModel({
    int? id,
    @JsonKey(name: 'itemType') int? itemType,
    @JsonKey(name: 'quantity') num? quantity,
    @JsonKey(name: 'consumableId') int? consumableId,
    @JsonKey(name: 'labourId') int? labourId,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') num? price,
    @JsonKey(name: 'minutes') int? minutes,
    @JsonKey(name: 'workorderId') int? workorderId,
  }) = _WorkorderItemModel;

  factory WorkorderItemModel.fromJson(Map<String, dynamic> json) =>
      _$WorkorderItemModelFromJson(json);
}
