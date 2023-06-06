// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsumableModel _$ConsumableModelFromJson(Map<String, dynamic> json) {
  return _ConsumableModel.fromJson(json);
}

/// @nodoc
mixin _$ConsumableModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  num? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumableModelCopyWith<ConsumableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumableModelCopyWith<$Res> {
  factory $ConsumableModelCopyWith(
          ConsumableModel value, $Res Function(ConsumableModel) then) =
      _$ConsumableModelCopyWithImpl<$Res, ConsumableModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'price') num? price});
}

/// @nodoc
class _$ConsumableModelCopyWithImpl<$Res, $Val extends ConsumableModel>
    implements $ConsumableModelCopyWith<$Res> {
  _$ConsumableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? price = freezed,
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
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConsumableModelCopyWith<$Res>
    implements $ConsumableModelCopyWith<$Res> {
  factory _$$_ConsumableModelCopyWith(
          _$_ConsumableModel value, $Res Function(_$_ConsumableModel) then) =
      __$$_ConsumableModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'price') num? price});
}

/// @nodoc
class __$$_ConsumableModelCopyWithImpl<$Res>
    extends _$ConsumableModelCopyWithImpl<$Res, _$_ConsumableModel>
    implements _$$_ConsumableModelCopyWith<$Res> {
  __$$_ConsumableModelCopyWithImpl(
      _$_ConsumableModel _value, $Res Function(_$_ConsumableModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_ConsumableModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConsumableModel implements _ConsumableModel {
  const _$_ConsumableModel(
      {this.id,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'price') this.price});

  factory _$_ConsumableModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConsumableModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'price')
  final num? price;

  @override
  String toString() {
    return 'ConsumableModel(id: $id, description: $description, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConsumableModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsumableModelCopyWith<_$_ConsumableModel> get copyWith =>
      __$$_ConsumableModelCopyWithImpl<_$_ConsumableModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConsumableModelToJson(
      this,
    );
  }
}

abstract class _ConsumableModel implements ConsumableModel {
  const factory _ConsumableModel(
      {final int? id,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'price') final num? price}) = _$_ConsumableModel;

  factory _ConsumableModel.fromJson(Map<String, dynamic> json) =
      _$_ConsumableModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'price')
  num? get price;
  @override
  @JsonKey(ignore: true)
  _$$_ConsumableModelCopyWith<_$_ConsumableModel> get copyWith =>
      throw _privateConstructorUsedError;
}
