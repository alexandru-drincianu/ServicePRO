// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workorder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkorderModel _$WorkorderModelFromJson(Map<String, dynamic> json) {
  return _WorkorderModel.fromJson(json);
}

/// @nodoc
mixin _$WorkorderModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicleId')
  int? get vehicleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle')
  VehicleModel? get vehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrivedDate')
  DateTime? get arrivedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'departedDate')
  DateTime? get departedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCost')
  num? get totalCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'isInvoiced')
  bool? get isInvoiced => throw _privateConstructorUsedError;
  @JsonKey(name: 'workorderItems')
  List<WorkorderItemModel>? get workorderItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkorderModelCopyWith<WorkorderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkorderModelCopyWith<$Res> {
  factory $WorkorderModelCopyWith(
          WorkorderModel value, $Res Function(WorkorderModel) then) =
      _$WorkorderModelCopyWithImpl<$Res, WorkorderModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'vehicleId')
          int? vehicleId,
      @JsonKey(name: 'vehicle')
          VehicleModel? vehicle,
      @JsonKey(name: 'status')
          int? status,
      @JsonKey(name: 'remarks')
          String? remarks,
      @JsonKey(name: 'arrivedDate')
          DateTime? arrivedDate,
      @JsonKey(name: 'departedDate')
          DateTime? departedDate,
      @JsonKey(name: 'totalCost')
          num? totalCost,
      @JsonKey(name: 'isInvoiced')
          bool? isInvoiced,
      @JsonKey(name: 'workorderItems')
          List<WorkorderItemModel>? workorderItems});

  $VehicleModelCopyWith<$Res>? get vehicle;
}

/// @nodoc
class _$WorkorderModelCopyWithImpl<$Res, $Val extends WorkorderModel>
    implements $WorkorderModelCopyWith<$Res> {
  _$WorkorderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vehicleId = freezed,
    Object? vehicle = freezed,
    Object? status = freezed,
    Object? remarks = freezed,
    Object? arrivedDate = freezed,
    Object? departedDate = freezed,
    Object? totalCost = freezed,
    Object? isInvoiced = freezed,
    Object? workorderItems = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivedDate: freezed == arrivedDate
          ? _value.arrivedDate
          : arrivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      departedDate: freezed == departedDate
          ? _value.departedDate
          : departedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num?,
      isInvoiced: freezed == isInvoiced
          ? _value.isInvoiced
          : isInvoiced // ignore: cast_nullable_to_non_nullable
              as bool?,
      workorderItems: freezed == workorderItems
          ? _value.workorderItems
          : workorderItems // ignore: cast_nullable_to_non_nullable
              as List<WorkorderItemModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleModelCopyWith<$Res>? get vehicle {
    if (_value.vehicle == null) {
      return null;
    }

    return $VehicleModelCopyWith<$Res>(_value.vehicle!, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkorderModelCopyWith<$Res>
    implements $WorkorderModelCopyWith<$Res> {
  factory _$$_WorkorderModelCopyWith(
          _$_WorkorderModel value, $Res Function(_$_WorkorderModel) then) =
      __$$_WorkorderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'vehicleId')
          int? vehicleId,
      @JsonKey(name: 'vehicle')
          VehicleModel? vehicle,
      @JsonKey(name: 'status')
          int? status,
      @JsonKey(name: 'remarks')
          String? remarks,
      @JsonKey(name: 'arrivedDate')
          DateTime? arrivedDate,
      @JsonKey(name: 'departedDate')
          DateTime? departedDate,
      @JsonKey(name: 'totalCost')
          num? totalCost,
      @JsonKey(name: 'isInvoiced')
          bool? isInvoiced,
      @JsonKey(name: 'workorderItems')
          List<WorkorderItemModel>? workorderItems});

  @override
  $VehicleModelCopyWith<$Res>? get vehicle;
}

/// @nodoc
class __$$_WorkorderModelCopyWithImpl<$Res>
    extends _$WorkorderModelCopyWithImpl<$Res, _$_WorkorderModel>
    implements _$$_WorkorderModelCopyWith<$Res> {
  __$$_WorkorderModelCopyWithImpl(
      _$_WorkorderModel _value, $Res Function(_$_WorkorderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vehicleId = freezed,
    Object? vehicle = freezed,
    Object? status = freezed,
    Object? remarks = freezed,
    Object? arrivedDate = freezed,
    Object? departedDate = freezed,
    Object? totalCost = freezed,
    Object? isInvoiced = freezed,
    Object? workorderItems = freezed,
  }) {
    return _then(_$_WorkorderModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivedDate: freezed == arrivedDate
          ? _value.arrivedDate
          : arrivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      departedDate: freezed == departedDate
          ? _value.departedDate
          : departedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num?,
      isInvoiced: freezed == isInvoiced
          ? _value.isInvoiced
          : isInvoiced // ignore: cast_nullable_to_non_nullable
              as bool?,
      workorderItems: freezed == workorderItems
          ? _value._workorderItems
          : workorderItems // ignore: cast_nullable_to_non_nullable
              as List<WorkorderItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkorderModel implements _WorkorderModel {
  const _$_WorkorderModel(
      {this.id,
      @JsonKey(name: 'vehicleId')
          this.vehicleId,
      @JsonKey(name: 'vehicle')
          this.vehicle,
      @JsonKey(name: 'status')
          this.status,
      @JsonKey(name: 'remarks')
          this.remarks,
      @JsonKey(name: 'arrivedDate')
          this.arrivedDate,
      @JsonKey(name: 'departedDate')
          this.departedDate,
      @JsonKey(name: 'totalCost')
          this.totalCost,
      @JsonKey(name: 'isInvoiced')
          this.isInvoiced,
      @JsonKey(name: 'workorderItems')
          final List<WorkorderItemModel>? workorderItems})
      : _workorderItems = workorderItems;

  factory _$_WorkorderModel.fromJson(Map<String, dynamic> json) =>
      _$$_WorkorderModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'vehicleId')
  final int? vehicleId;
  @override
  @JsonKey(name: 'vehicle')
  final VehicleModel? vehicle;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'arrivedDate')
  final DateTime? arrivedDate;
  @override
  @JsonKey(name: 'departedDate')
  final DateTime? departedDate;
  @override
  @JsonKey(name: 'totalCost')
  final num? totalCost;
  @override
  @JsonKey(name: 'isInvoiced')
  final bool? isInvoiced;
  final List<WorkorderItemModel>? _workorderItems;
  @override
  @JsonKey(name: 'workorderItems')
  List<WorkorderItemModel>? get workorderItems {
    final value = _workorderItems;
    if (value == null) return null;
    if (_workorderItems is EqualUnmodifiableListView) return _workorderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkorderModel(id: $id, vehicleId: $vehicleId, vehicle: $vehicle, status: $status, remarks: $remarks, arrivedDate: $arrivedDate, departedDate: $departedDate, totalCost: $totalCost, isInvoiced: $isInvoiced, workorderItems: $workorderItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkorderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.arrivedDate, arrivedDate) ||
                other.arrivedDate == arrivedDate) &&
            (identical(other.departedDate, departedDate) ||
                other.departedDate == departedDate) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.isInvoiced, isInvoiced) ||
                other.isInvoiced == isInvoiced) &&
            const DeepCollectionEquality()
                .equals(other._workorderItems, _workorderItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      vehicleId,
      vehicle,
      status,
      remarks,
      arrivedDate,
      departedDate,
      totalCost,
      isInvoiced,
      const DeepCollectionEquality().hash(_workorderItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkorderModelCopyWith<_$_WorkorderModel> get copyWith =>
      __$$_WorkorderModelCopyWithImpl<_$_WorkorderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkorderModelToJson(
      this,
    );
  }
}

abstract class _WorkorderModel implements WorkorderModel {
  const factory _WorkorderModel(
      {final int? id,
      @JsonKey(name: 'vehicleId')
          final int? vehicleId,
      @JsonKey(name: 'vehicle')
          final VehicleModel? vehicle,
      @JsonKey(name: 'status')
          final int? status,
      @JsonKey(name: 'remarks')
          final String? remarks,
      @JsonKey(name: 'arrivedDate')
          final DateTime? arrivedDate,
      @JsonKey(name: 'departedDate')
          final DateTime? departedDate,
      @JsonKey(name: 'totalCost')
          final num? totalCost,
      @JsonKey(name: 'isInvoiced')
          final bool? isInvoiced,
      @JsonKey(name: 'workorderItems')
          final List<WorkorderItemModel>? workorderItems}) = _$_WorkorderModel;

  factory _WorkorderModel.fromJson(Map<String, dynamic> json) =
      _$_WorkorderModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'vehicleId')
  int? get vehicleId;
  @override
  @JsonKey(name: 'vehicle')
  VehicleModel? get vehicle;
  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'arrivedDate')
  DateTime? get arrivedDate;
  @override
  @JsonKey(name: 'departedDate')
  DateTime? get departedDate;
  @override
  @JsonKey(name: 'totalCost')
  num? get totalCost;
  @override
  @JsonKey(name: 'isInvoiced')
  bool? get isInvoiced;
  @override
  @JsonKey(name: 'workorderItems')
  List<WorkorderItemModel>? get workorderItems;
  @override
  @JsonKey(ignore: true)
  _$$_WorkorderModelCopyWith<_$_WorkorderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
