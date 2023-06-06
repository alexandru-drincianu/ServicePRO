import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_pro/core/models/ConsumableModels/consumable_model.dart';
import 'package:service_pro/core/models/LabourModels/labour_model.dart';

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
    @JsonKey(name: 'consumable') ConsumableModel? consumable,
    @JsonKey(name: 'labourId') int? labourId,
    @JsonKey(name: 'labour') LabourModel? labour,
  }) = _WorkorderItemModel;

  factory WorkorderItemModel.fromJson(Map<String, dynamic> json) =>
      _$WorkorderItemModelFromJson(json);
}
