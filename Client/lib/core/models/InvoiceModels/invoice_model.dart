import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_pro/core/models/WorkorderModels/workorder_model.dart';

part 'invoice_model.freezed.dart';

part 'invoice_model.g.dart';

@freezed
class InvoiceModel with _$InvoiceModel {
  const factory InvoiceModel({
    int? id,
    @JsonKey(name: 'number') String? number,
    @JsonKey(name: 'workorderId') int? workorderId,
    @JsonKey(name: 'workorder') WorkorderModel? workorder,
    @JsonKey(name: 'invoiceStatus') int? invoiceStatus,
    @JsonKey(name: 'createdDate') DateTime? createdDate,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
}
