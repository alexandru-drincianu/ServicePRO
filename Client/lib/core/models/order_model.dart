import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

/// [OrderModel] is the model used to hold details about an Order. It can be used
/// to fetch orders or publish a new order.

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(includeIfNull: false) int? id,
    required String number,
    required String client,
    required int capacity,
    required double value,
    required String deliveryDate,
    required bool isActive,
    required bool isDeleted,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
