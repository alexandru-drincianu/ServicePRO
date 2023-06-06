// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_scan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleScanModel _$VehicleScanModelFromJson(Map<String, dynamic> json) {
  return _VehicleScanModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleScanModel {
  @JsonKey(name: 'licensePlate')
  String? get licensePlate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle')
  VehicleModel? get vehicle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleScanModelCopyWith<VehicleScanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleScanModelCopyWith<$Res> {
  factory $VehicleScanModelCopyWith(
          VehicleScanModel value, $Res Function(VehicleScanModel) then) =
      _$VehicleScanModelCopyWithImpl<$Res, VehicleScanModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'licensePlate') String? licensePlate,
      @JsonKey(name: 'vehicle') VehicleModel? vehicle});

  $VehicleModelCopyWith<$Res>? get vehicle;
}

/// @nodoc
class _$VehicleScanModelCopyWithImpl<$Res, $Val extends VehicleScanModel>
    implements $VehicleScanModelCopyWith<$Res> {
  _$VehicleScanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licensePlate = freezed,
    Object? vehicle = freezed,
  }) {
    return _then(_value.copyWith(
      licensePlate: freezed == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
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
abstract class _$$_VehicleScanModelCopyWith<$Res>
    implements $VehicleScanModelCopyWith<$Res> {
  factory _$$_VehicleScanModelCopyWith(
          _$_VehicleScanModel value, $Res Function(_$_VehicleScanModel) then) =
      __$$_VehicleScanModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'licensePlate') String? licensePlate,
      @JsonKey(name: 'vehicle') VehicleModel? vehicle});

  @override
  $VehicleModelCopyWith<$Res>? get vehicle;
}

/// @nodoc
class __$$_VehicleScanModelCopyWithImpl<$Res>
    extends _$VehicleScanModelCopyWithImpl<$Res, _$_VehicleScanModel>
    implements _$$_VehicleScanModelCopyWith<$Res> {
  __$$_VehicleScanModelCopyWithImpl(
      _$_VehicleScanModel _value, $Res Function(_$_VehicleScanModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licensePlate = freezed,
    Object? vehicle = freezed,
  }) {
    return _then(_$_VehicleScanModel(
      licensePlate: freezed == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VehicleScanModel implements _VehicleScanModel {
  const _$_VehicleScanModel(
      {@JsonKey(name: 'licensePlate') this.licensePlate,
      @JsonKey(name: 'vehicle') this.vehicle});

  factory _$_VehicleScanModel.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleScanModelFromJson(json);

  @override
  @JsonKey(name: 'licensePlate')
  final String? licensePlate;
  @override
  @JsonKey(name: 'vehicle')
  final VehicleModel? vehicle;

  @override
  String toString() {
    return 'VehicleScanModel(licensePlate: $licensePlate, vehicle: $vehicle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleScanModel &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, licensePlate, vehicle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleScanModelCopyWith<_$_VehicleScanModel> get copyWith =>
      __$$_VehicleScanModelCopyWithImpl<_$_VehicleScanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleScanModelToJson(
      this,
    );
  }
}

abstract class _VehicleScanModel implements VehicleScanModel {
  const factory _VehicleScanModel(
          {@JsonKey(name: 'licensePlate') final String? licensePlate,
          @JsonKey(name: 'vehicle') final VehicleModel? vehicle}) =
      _$_VehicleScanModel;

  factory _VehicleScanModel.fromJson(Map<String, dynamic> json) =
      _$_VehicleScanModel.fromJson;

  @override
  @JsonKey(name: 'licensePlate')
  String? get licensePlate;
  @override
  @JsonKey(name: 'vehicle')
  VehicleModel? get vehicle;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleScanModelCopyWith<_$_VehicleScanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
