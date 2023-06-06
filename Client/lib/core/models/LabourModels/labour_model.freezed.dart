// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labour_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LabourModel _$LabourModelFromJson(Map<String, dynamic> json) {
  return _LabourModel.fromJson(json);
}

/// @nodoc
mixin _$LabourModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'hourlyWage')
  num? get hourlyWage => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutes')
  int? get minutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LabourModelCopyWith<LabourModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabourModelCopyWith<$Res> {
  factory $LabourModelCopyWith(
          LabourModel value, $Res Function(LabourModel) then) =
      _$LabourModelCopyWithImpl<$Res, LabourModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'hourlyWage') num? hourlyWage,
      @JsonKey(name: 'minutes') int? minutes});
}

/// @nodoc
class _$LabourModelCopyWithImpl<$Res, $Val extends LabourModel>
    implements $LabourModelCopyWith<$Res> {
  _$LabourModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? hourlyWage = freezed,
    Object? minutes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hourlyWage: freezed == hourlyWage
          ? _value.hourlyWage
          : hourlyWage // ignore: cast_nullable_to_non_nullable
              as num?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LabourModelCopyWith<$Res>
    implements $LabourModelCopyWith<$Res> {
  factory _$$_LabourModelCopyWith(
          _$_LabourModel value, $Res Function(_$_LabourModel) then) =
      __$$_LabourModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'hourlyWage') num? hourlyWage,
      @JsonKey(name: 'minutes') int? minutes});
}

/// @nodoc
class __$$_LabourModelCopyWithImpl<$Res>
    extends _$LabourModelCopyWithImpl<$Res, _$_LabourModel>
    implements _$$_LabourModelCopyWith<$Res> {
  __$$_LabourModelCopyWithImpl(
      _$_LabourModel _value, $Res Function(_$_LabourModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? hourlyWage = freezed,
    Object? minutes = freezed,
  }) {
    return _then(_$_LabourModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hourlyWage: freezed == hourlyWage
          ? _value.hourlyWage
          : hourlyWage // ignore: cast_nullable_to_non_nullable
              as num?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LabourModel implements _LabourModel {
  const _$_LabourModel(
      {this.id,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'hourlyWage') this.hourlyWage,
      @JsonKey(name: 'minutes') this.minutes});

  factory _$_LabourModel.fromJson(Map<String, dynamic> json) =>
      _$$_LabourModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'hourlyWage')
  final num? hourlyWage;
  @override
  @JsonKey(name: 'minutes')
  final int? minutes;

  @override
  String toString() {
    return 'LabourModel(id: $id, description: $description, hourlyWage: $hourlyWage, minutes: $minutes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LabourModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hourlyWage, hourlyWage) ||
                other.hourlyWage == hourlyWage) &&
            (identical(other.minutes, minutes) || other.minutes == minutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, hourlyWage, minutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LabourModelCopyWith<_$_LabourModel> get copyWith =>
      __$$_LabourModelCopyWithImpl<_$_LabourModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LabourModelToJson(
      this,
    );
  }
}

abstract class _LabourModel implements LabourModel {
  const factory _LabourModel(
      {final int? id,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'hourlyWage') final num? hourlyWage,
      @JsonKey(name: 'minutes') final int? minutes}) = _$_LabourModel;

  factory _LabourModel.fromJson(Map<String, dynamic> json) =
      _$_LabourModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'hourlyWage')
  num? get hourlyWage;
  @override
  @JsonKey(name: 'minutes')
  int? get minutes;
  @override
  @JsonKey(ignore: true)
  _$$_LabourModelCopyWith<_$_LabourModel> get copyWith =>
      throw _privateConstructorUsedError;
}
