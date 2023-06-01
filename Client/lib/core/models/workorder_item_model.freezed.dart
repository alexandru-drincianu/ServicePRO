// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workorder_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkorderItemModel _$WorkorderItemModelFromJson(Map<String, dynamic> json) {
  return _WorkorderItemModel.fromJson(json);
}

/// @nodoc
mixin _$WorkorderItemModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  num? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  num? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkorderItemModelCopyWith<WorkorderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkorderItemModelCopyWith<$Res> {
  factory $WorkorderItemModelCopyWith(
          WorkorderItemModel value, $Res Function(WorkorderItemModel) then) =
      _$WorkorderItemModelCopyWithImpl<$Res, WorkorderItemModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'description') int? userId,
      @JsonKey(name: 'price') num? price,
      @JsonKey(name: 'quantity') num? quantity});
}

/// @nodoc
class _$WorkorderItemModelCopyWithImpl<$Res, $Val extends WorkorderItemModel>
    implements $WorkorderItemModelCopyWith<$Res> {
  _$WorkorderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
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
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkorderItemModelCopyWith<$Res>
    implements $WorkorderItemModelCopyWith<$Res> {
  factory _$$_WorkorderItemModelCopyWith(_$_WorkorderItemModel value,
          $Res Function(_$_WorkorderItemModel) then) =
      __$$_WorkorderItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'description') int? userId,
      @JsonKey(name: 'price') num? price,
      @JsonKey(name: 'quantity') num? quantity});
}

/// @nodoc
class __$$_WorkorderItemModelCopyWithImpl<$Res>
    extends _$WorkorderItemModelCopyWithImpl<$Res, _$_WorkorderItemModel>
    implements _$$_WorkorderItemModelCopyWith<$Res> {
  __$$_WorkorderItemModelCopyWithImpl(
      _$_WorkorderItemModel _value, $Res Function(_$_WorkorderItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_WorkorderItemModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkorderItemModel implements _WorkorderItemModel {
  const _$_WorkorderItemModel(
      {this.id,
      @JsonKey(name: 'description') this.userId,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'quantity') this.quantity});

  factory _$_WorkorderItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_WorkorderItemModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'description')
  final int? userId;
  @override
  @JsonKey(name: 'price')
  final num? price;
  @override
  @JsonKey(name: 'quantity')
  final num? quantity;

  @override
  String toString() {
    return 'WorkorderItemModel(id: $id, userId: $userId, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkorderItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, price, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkorderItemModelCopyWith<_$_WorkorderItemModel> get copyWith =>
      __$$_WorkorderItemModelCopyWithImpl<_$_WorkorderItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkorderItemModelToJson(
      this,
    );
  }
}

abstract class _WorkorderItemModel implements WorkorderItemModel {
  const factory _WorkorderItemModel(
      {final int? id,
      @JsonKey(name: 'description') final int? userId,
      @JsonKey(name: 'price') final num? price,
      @JsonKey(name: 'quantity') final num? quantity}) = _$_WorkorderItemModel;

  factory _WorkorderItemModel.fromJson(Map<String, dynamic> json) =
      _$_WorkorderItemModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'description')
  int? get userId;
  @override
  @JsonKey(name: 'price')
  num? get price;
  @override
  @JsonKey(name: 'quantity')
  num? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_WorkorderItemModelCopyWith<_$_WorkorderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
