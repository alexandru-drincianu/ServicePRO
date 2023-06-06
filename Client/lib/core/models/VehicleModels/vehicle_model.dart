import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_pro/core/models/UserModels/user_details.dart';

part 'vehicle_model.freezed.dart';

part 'vehicle_model.g.dart';

/// [VehicleModel] is the model used to hold the client details

@freezed
class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    int? id,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'user') UserDetails? user,
    @JsonKey(name: 'registration') String? registration,
    @JsonKey(name: 'brand') String? brand,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'vin') String? vin,
    @JsonKey(name: 'mileage') num? mileage,
    @JsonKey(name: 'fuelType') int? fuelType,
    @JsonKey(name: 'workorderId') int? workorderId,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}
