import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/models/vehicle_model.dart';
import 'package:service_pro/core/models/workorder_item_model.dart';

part 'workorder_model.freezed.dart';

part 'workorder_model.g.dart';

/// [WorkorderModel]

@freezed
class WorkorderModel with _$WorkorderModel {
  const factory WorkorderModel({
    int? id,
    @JsonKey(name: 'vehicleId') int? vehicleId,
    @JsonKey(name: 'vehicle') VehicleModel? vehicle,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(name: 'arrivedDate') DateTime? arrivedDate,
    @JsonKey(name: 'departedDate') DateTime? departedDate,
    @JsonKey(name: 'totalCost') num? totalCost,
    @JsonKey(name: 'isInvoiced') bool? isInvoiced,
    @JsonKey(name: 'workorderItems') List<WorkorderItemModel>? workorderItems,
    @JsonKey(name: 'number') String? number,
  }) = _WorkorderModel;

  factory WorkorderModel.fromJson(Map<String, dynamic> json) =>
      _$WorkorderModelFromJson(json);
}
