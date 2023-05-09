// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) {
  return _ClientModel.fromJson(json);
}

/// @nodoc
mixin _$ClientModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephoneNumber')
  String get telephoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  AddressModel get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientModelCopyWith<ClientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientModelCopyWith<$Res> {
  factory $ClientModelCopyWith(
          ClientModel value, $Res Function(ClientModel) then) =
      _$ClientModelCopyWithImpl<$Res, ClientModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'telephoneNumber') String telephoneNumber,
      @JsonKey(name: 'notes') String notes,
      @JsonKey(name: 'address') AddressModel address});

  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$ClientModelCopyWithImpl<$Res, $Val extends ClientModel>
    implements $ClientModelCopyWith<$Res> {
  _$ClientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? telephoneNumber = null,
    Object? notes = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClientModelCopyWith<$Res>
    implements $ClientModelCopyWith<$Res> {
  factory _$$_ClientModelCopyWith(
          _$_ClientModel value, $Res Function(_$_ClientModel) then) =
      __$$_ClientModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'telephoneNumber') String telephoneNumber,
      @JsonKey(name: 'notes') String notes,
      @JsonKey(name: 'address') AddressModel address});

  @override
  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$_ClientModelCopyWithImpl<$Res>
    extends _$ClientModelCopyWithImpl<$Res, _$_ClientModel>
    implements _$$_ClientModelCopyWith<$Res> {
  __$$_ClientModelCopyWithImpl(
      _$_ClientModel _value, $Res Function(_$_ClientModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? telephoneNumber = null,
    Object? notes = null,
    Object? address = null,
  }) {
    return _then(_$_ClientModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientModel implements _ClientModel {
  const _$_ClientModel(
      {required this.id,
      @JsonKey(name: 'fullName') required this.fullName,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'telephoneNumber') required this.telephoneNumber,
      @JsonKey(name: 'notes') required this.notes,
      @JsonKey(name: 'address') required this.address});

  factory _$_ClientModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClientModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'fullName')
  final String fullName;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'telephoneNumber')
  final String telephoneNumber;
  @override
  @JsonKey(name: 'notes')
  final String notes;
  @override
  @JsonKey(name: 'address')
  final AddressModel address;

  @override
  String toString() {
    return 'ClientModel(id: $id, fullName: $fullName, email: $email, telephoneNumber: $telephoneNumber, notes: $notes, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fullName, email, telephoneNumber, notes, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientModelCopyWith<_$_ClientModel> get copyWith =>
      __$$_ClientModelCopyWithImpl<_$_ClientModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientModelToJson(
      this,
    );
  }
}

abstract class _ClientModel implements ClientModel {
  const factory _ClientModel(
      {required final int id,
      @JsonKey(name: 'fullName')
          required final String fullName,
      @JsonKey(name: 'email')
          required final String email,
      @JsonKey(name: 'telephoneNumber')
          required final String telephoneNumber,
      @JsonKey(name: 'notes')
          required final String notes,
      @JsonKey(name: 'address')
          required final AddressModel address}) = _$_ClientModel;

  factory _ClientModel.fromJson(Map<String, dynamic> json) =
      _$_ClientModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'fullName')
  String get fullName;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'telephoneNumber')
  String get telephoneNumber;
  @override
  @JsonKey(name: 'notes')
  String get notes;
  @override
  @JsonKey(name: 'address')
  AddressModel get address;
  @override
  @JsonKey(ignore: true)
  _$$_ClientModelCopyWith<_$_ClientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
