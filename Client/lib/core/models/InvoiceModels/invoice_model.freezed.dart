// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) {
  return _InvoiceModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  String? get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'workorderId')
  int? get workorderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'workorder')
  WorkorderModel? get workorder => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceStatus')
  int? get invoiceStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceModelCopyWith<InvoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceModelCopyWith<$Res> {
  factory $InvoiceModelCopyWith(
          InvoiceModel value, $Res Function(InvoiceModel) then) =
      _$InvoiceModelCopyWithImpl<$Res, InvoiceModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'number') String? number,
      @JsonKey(name: 'workorderId') int? workorderId,
      @JsonKey(name: 'workorder') WorkorderModel? workorder,
      @JsonKey(name: 'invoiceStatus') int? invoiceStatus,
      @JsonKey(name: 'createdDate') DateTime? createdDate});

  $WorkorderModelCopyWith<$Res>? get workorder;
}

/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res, $Val extends InvoiceModel>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? workorderId = freezed,
    Object? workorder = freezed,
    Object? invoiceStatus = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      workorderId: freezed == workorderId
          ? _value.workorderId
          : workorderId // ignore: cast_nullable_to_non_nullable
              as int?,
      workorder: freezed == workorder
          ? _value.workorder
          : workorder // ignore: cast_nullable_to_non_nullable
              as WorkorderModel?,
      invoiceStatus: freezed == invoiceStatus
          ? _value.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkorderModelCopyWith<$Res>? get workorder {
    if (_value.workorder == null) {
      return null;
    }

    return $WorkorderModelCopyWith<$Res>(_value.workorder!, (value) {
      return _then(_value.copyWith(workorder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InvoiceModelCopyWith<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  factory _$$_InvoiceModelCopyWith(
          _$_InvoiceModel value, $Res Function(_$_InvoiceModel) then) =
      __$$_InvoiceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'number') String? number,
      @JsonKey(name: 'workorderId') int? workorderId,
      @JsonKey(name: 'workorder') WorkorderModel? workorder,
      @JsonKey(name: 'invoiceStatus') int? invoiceStatus,
      @JsonKey(name: 'createdDate') DateTime? createdDate});

  @override
  $WorkorderModelCopyWith<$Res>? get workorder;
}

/// @nodoc
class __$$_InvoiceModelCopyWithImpl<$Res>
    extends _$InvoiceModelCopyWithImpl<$Res, _$_InvoiceModel>
    implements _$$_InvoiceModelCopyWith<$Res> {
  __$$_InvoiceModelCopyWithImpl(
      _$_InvoiceModel _value, $Res Function(_$_InvoiceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? workorderId = freezed,
    Object? workorder = freezed,
    Object? invoiceStatus = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$_InvoiceModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      workorderId: freezed == workorderId
          ? _value.workorderId
          : workorderId // ignore: cast_nullable_to_non_nullable
              as int?,
      workorder: freezed == workorder
          ? _value.workorder
          : workorder // ignore: cast_nullable_to_non_nullable
              as WorkorderModel?,
      invoiceStatus: freezed == invoiceStatus
          ? _value.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvoiceModel implements _InvoiceModel {
  const _$_InvoiceModel(
      {this.id,
      @JsonKey(name: 'number') this.number,
      @JsonKey(name: 'workorderId') this.workorderId,
      @JsonKey(name: 'workorder') this.workorder,
      @JsonKey(name: 'invoiceStatus') this.invoiceStatus,
      @JsonKey(name: 'createdDate') this.createdDate});

  factory _$_InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'number')
  final String? number;
  @override
  @JsonKey(name: 'workorderId')
  final int? workorderId;
  @override
  @JsonKey(name: 'workorder')
  final WorkorderModel? workorder;
  @override
  @JsonKey(name: 'invoiceStatus')
  final int? invoiceStatus;
  @override
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;

  @override
  String toString() {
    return 'InvoiceModel(id: $id, number: $number, workorderId: $workorderId, workorder: $workorder, invoiceStatus: $invoiceStatus, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.workorderId, workorderId) ||
                other.workorderId == workorderId) &&
            (identical(other.workorder, workorder) ||
                other.workorder == workorder) &&
            (identical(other.invoiceStatus, invoiceStatus) ||
                other.invoiceStatus == invoiceStatus) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, workorderId,
      workorder, invoiceStatus, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceModelCopyWith<_$_InvoiceModel> get copyWith =>
      __$$_InvoiceModelCopyWithImpl<_$_InvoiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceModelToJson(
      this,
    );
  }
}

abstract class _InvoiceModel implements InvoiceModel {
  const factory _InvoiceModel(
          {final int? id,
          @JsonKey(name: 'number') final String? number,
          @JsonKey(name: 'workorderId') final int? workorderId,
          @JsonKey(name: 'workorder') final WorkorderModel? workorder,
          @JsonKey(name: 'invoiceStatus') final int? invoiceStatus,
          @JsonKey(name: 'createdDate') final DateTime? createdDate}) =
      _$_InvoiceModel;

  factory _InvoiceModel.fromJson(Map<String, dynamic> json) =
      _$_InvoiceModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'number')
  String? get number;
  @override
  @JsonKey(name: 'workorderId')
  int? get workorderId;
  @override
  @JsonKey(name: 'workorder')
  WorkorderModel? get workorder;
  @override
  @JsonKey(name: 'invoiceStatus')
  int? get invoiceStatus;
  @override
  @JsonKey(name: 'createdDate')
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceModelCopyWith<_$_InvoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
