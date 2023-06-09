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
  @JsonKey(name: 'itemType')
  int? get itemType => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  num? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'consumableId')
  int? get consumableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'labourId')
  int? get labourId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  num? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutes')
  int? get minutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'workorderId')
  int? get workorderId => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'itemType') int? itemType,
      @JsonKey(name: 'quantity') num? quantity,
      @JsonKey(name: 'consumableId') int? consumableId,
      @JsonKey(name: 'labourId') int? labourId,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'price') num? price,
      @JsonKey(name: 'minutes') int? minutes,
      @JsonKey(name: 'workorderId') int? workorderId});
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
    Object? itemType = freezed,
    Object? quantity = freezed,
    Object? consumableId = freezed,
    Object? labourId = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? minutes = freezed,
    Object? workorderId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      itemType: freezed == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num?,
      consumableId: freezed == consumableId
          ? _value.consumableId
          : consumableId // ignore: cast_nullable_to_non_nullable
              as int?,
      labourId: freezed == labourId
          ? _value.labourId
          : labourId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int?,
      workorderId: freezed == workorderId
          ? _value.workorderId
          : workorderId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'itemType') int? itemType,
      @JsonKey(name: 'quantity') num? quantity,
      @JsonKey(name: 'consumableId') int? consumableId,
      @JsonKey(name: 'labourId') int? labourId,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'price') num? price,
      @JsonKey(name: 'minutes') int? minutes,
      @JsonKey(name: 'workorderId') int? workorderId});
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
    Object? itemType = freezed,
    Object? quantity = freezed,
    Object? consumableId = freezed,
    Object? labourId = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? minutes = freezed,
    Object? workorderId = freezed,
  }) {
    return _then(_$_WorkorderItemModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      itemType: freezed == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num?,
      consumableId: freezed == consumableId
          ? _value.consumableId
          : consumableId // ignore: cast_nullable_to_non_nullable
              as int?,
      labourId: freezed == labourId
          ? _value.labourId
          : labourId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
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
class _$_WorkorderItemModel implements _WorkorderItemModel {
  const _$_WorkorderItemModel(
      {this.id,
      @JsonKey(name: 'itemType') this.itemType,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'consumableId') this.consumableId,
      @JsonKey(name: 'labourId') this.labourId,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'minutes') this.minutes,
      @JsonKey(name: 'workorderId') this.workorderId});

  factory _$_WorkorderItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_WorkorderItemModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'itemType')
  final int? itemType;
  @override
  @JsonKey(name: 'quantity')
  final num? quantity;
  @override
  @JsonKey(name: 'consumableId')
  final int? consumableId;
  @override
  @JsonKey(name: 'labourId')
  final int? labourId;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'price')
  final num? price;
  @override
  @JsonKey(name: 'minutes')
  final int? minutes;
  @override
  @JsonKey(name: 'workorderId')
  final int? workorderId;

  @override
  String toString() {
    return 'WorkorderItemModel(id: $id, itemType: $itemType, quantity: $quantity, consumableId: $consumableId, labourId: $labourId, description: $description, price: $price, minutes: $minutes, workorderId: $workorderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkorderItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.consumableId, consumableId) ||
                other.consumableId == consumableId) &&
            (identical(other.labourId, labourId) ||
                other.labourId == labourId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.workorderId, workorderId) ||
                other.workorderId == workorderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemType, quantity,
      consumableId, labourId, description, price, minutes, workorderId);

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
          @JsonKey(name: 'itemType') final int? itemType,
          @JsonKey(name: 'quantity') final num? quantity,
          @JsonKey(name: 'consumableId') final int? consumableId,
          @JsonKey(name: 'labourId') final int? labourId,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'price') final num? price,
          @JsonKey(name: 'minutes') final int? minutes,
          @JsonKey(name: 'workorderId') final int? workorderId}) =
      _$_WorkorderItemModel;

  factory _WorkorderItemModel.fromJson(Map<String, dynamic> json) =
      _$_WorkorderItemModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'itemType')
  int? get itemType;
  @override
  @JsonKey(name: 'quantity')
  num? get quantity;
  @override
  @JsonKey(name: 'consumableId')
  int? get consumableId;
  @override
  @JsonKey(name: 'labourId')
  int? get labourId;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'price')
  num? get price;
  @override
  @JsonKey(name: 'minutes')
  int? get minutes;
  @override
  @JsonKey(name: 'workorderId')
  int? get workorderId;
  @override
  @JsonKey(ignore: true)
  _$$_WorkorderItemModelCopyWith<_$_WorkorderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
