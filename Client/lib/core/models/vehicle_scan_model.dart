import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_pro/core/enums/enums.dart';
import 'package:service_pro/core/models/address_model.dart';
import 'package:service_pro/core/models/user_details.dart';
import 'package:service_pro/core/models/vehicle_model.dart';

part 'vehicle_scan_model.freezed.dart';

part 'vehicle_scan_model.g.dart';

/// [VehicleScanModel] is the model used to hold the client details

@freezed
class VehicleScanModel with _$VehicleScanModel {
  const factory VehicleScanModel({
    @JsonKey(name: 'licensePlate') String? licensePlate,
    @JsonKey(name: 'vehicle') VehicleModel? vehicle,
  }) = _VehicleScanModel;

  factory VehicleScanModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleScanModelFromJson(json);
}
