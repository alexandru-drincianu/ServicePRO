// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return _VehicleModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  ClientModel? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration')
  String? get registration => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand')
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'model')
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'vin')
  String? get vin => throw _privateConstructorUsedError;
  @JsonKey(name: 'mileage')
  num? get mileage => throw _privateConstructorUsedError;
  @JsonKey(name: 'fuelType')
  int? get fuelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'workorderId')
  int? get workorderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleModelCopyWith<VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelCopyWith<$Res> {
  factory $VehicleModelCopyWith(
          VehicleModel value, $Res Function(VehicleModel) then) =
      _$VehicleModelCopyWithImpl<$Res, VehicleModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'user') ClientModel? user,
      @JsonKey(name: 'registration') String? registration,
      @JsonKey(name: 'brand') String? brand,
      @JsonKey(name: 'model') String? model,
      @JsonKey(name: 'vin') String? vin,
      @JsonKey(name: 'mileage') num? mileage,
      @JsonKey(name: 'fuelType') int? fuelType,
      @JsonKey(name: 'workorderId') int? workorderId});

  $ClientModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$VehicleModelCopyWithImpl<$Res, $Val extends VehicleModel>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? registration = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? vin = freezed,
    Object? mileage = freezed,
    Object? fuelType = freezed,
    Object? workorderId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ClientModel?,
      registration: freezed == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as num?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as int?,
      workorderId: freezed == workorderId
          ? _value.workorderId
          : workorderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ClientModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VehicleModelCopyWith<$Res>
    implements $VehicleModelCopyWith<$Res> {
  factory _$$_VehicleModelCopyWith(
          _$_VehicleModel value, $Res Function(_$_VehicleModel) then) =
      __$$_VehicleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'user') ClientModel? user,
      @JsonKey(name: 'registration') String? registration,
      @JsonKey(name: 'brand') String? brand,
      @JsonKey(name: 'model') String? model,
      @JsonKey(name: 'vin') String? vin,
      @JsonKey(name: 'mileage') num? mileage,
      @JsonKey(name: 'fuelType') int? fuelType,
      @JsonKey(name: 'workorderId') int? workorderId});

  @override
  $ClientModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_VehicleModelCopyWithImpl<$Res>
    extends _$VehicleModelCopyWithImpl<$Res, _$_VehicleModel>
    implements _$$_VehicleModelCopyWith<$Res> {
  __$$_VehicleModelCopyWithImpl(
      _$_VehicleModel _value, $Res Function(_$_VehicleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? registration = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? vin = freezed,
    Object? mileage = freezed,
    Object? fuelType = freezed,
    Object? workorderId = freezed,
  }) {
    return _then(_$_VehicleModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ClientModel?,
      registration: freezed == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as num?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as int?,
      workorderId: freezed == workorderId
          ? _value.workorderId
          : workorderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VehicleModel implements _VehicleModel {
  const _$_VehicleModel(
      {this.id,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'registration') this.registration,
      @JsonKey(name: 'brand') this.brand,
      @JsonKey(name: 'model') this.model,
      @JsonKey(name: 'vin') this.vin,
      @JsonKey(name: 'mileage') this.mileage,
      @JsonKey(name: 'fuelType') this.fuelType,
      @JsonKey(name: 'workorderId') this.workorderId});

  factory _$_VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'userId')
  final int? userId;
  @override
  @JsonKey(name: 'user')
  final ClientModel? user;
  @override
  @JsonKey(name: 'registration')
  final String? registration;
  @override
  @JsonKey(name: 'brand')
  final String? brand;
  @override
  @JsonKey(name: 'model')
  final String? model;
  @override
  @JsonKey(name: 'vin')
  final String? vin;
  @override
  @JsonKey(name: 'mileage')
  final num? mileage;
  @override
  @JsonKey(name: 'fuelType')
  final int? fuelType;
  @override
  @JsonKey(name: 'workorderId')
  final int? workorderId;

  @override
  String toString() {
    return 'VehicleModel(id: $id, userId: $userId, user: $user, registration: $registration, brand: $brand, model: $model, vin: $vin, mileage: $mileage, fuelType: $fuelType, workorderId: $workorderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.registration, registration) ||
                other.registration == registration) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.workorderId, workorderId) ||
                other.workorderId == workorderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, user, registration,
      brand, model, vin, mileage, fuelType, workorderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleModelCopyWith<_$_VehicleModel> get copyWith =>
      __$$_VehicleModelCopyWithImpl<_$_VehicleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleModelToJson(
      this,
    );
  }
}

abstract class _VehicleModel implements VehicleModel {
  const factory _VehicleModel(
      {final int? id,
      @JsonKey(name: 'userId') final int? userId,
      @JsonKey(name: 'user') final ClientModel? user,
      @JsonKey(name: 'registration') final String? registration,
      @JsonKey(name: 'brand') final String? brand,
      @JsonKey(name: 'model') final String? model,
      @JsonKey(name: 'vin') final String? vin,
      @JsonKey(name: 'mileage') final num? mileage,
      @JsonKey(name: 'fuelType') final int? fuelType,
      @JsonKey(name: 'workorderId') final int? workorderId}) = _$_VehicleModel;

  factory _VehicleModel.fromJson(Map<String, dynamic> json) =
      _$_VehicleModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'userId')
  int? get userId;
  @override
  @JsonKey(name: 'user')
  ClientModel? get user;
  @override
  @JsonKey(name: 'registration')
  String? get registration;
  @override
  @JsonKey(name: 'brand')
  String? get brand;
  @override
  @JsonKey(name: 'model')
  String? get model;
  @override
  @JsonKey(name: 'vin')
  String? get vin;
  @override
  @JsonKey(name: 'mileage')
  num? get mileage;
  @override
  @JsonKey(name: 'fuelType')
  int? get fuelType;
  @override
  @JsonKey(name: 'workorderId')
  int? get workorderId;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleModelCopyWith<_$_VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
