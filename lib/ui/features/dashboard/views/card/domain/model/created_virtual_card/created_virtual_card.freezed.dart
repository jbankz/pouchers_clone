// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_virtual_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreatedVirtualCard _$CreatedVirtualCardFromJson(Map<String, dynamic> json) {
  return _CreatedVirtualCard.fromJson(json);
}

/// @nodoc
mixin _$CreatedVirtualCard {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedVirtualCardCopyWith<CreatedVirtualCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedVirtualCardCopyWith<$Res> {
  factory $CreatedVirtualCardCopyWith(
          CreatedVirtualCard value, $Res Function(CreatedVirtualCard) then) =
      _$CreatedVirtualCardCopyWithImpl<$Res, CreatedVirtualCard>;
  @useResult
  $Res call({String? status, String? message, int? code, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CreatedVirtualCardCopyWithImpl<$Res, $Val extends CreatedVirtualCard>
    implements $CreatedVirtualCardCopyWith<$Res> {
  _$CreatedVirtualCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatedVirtualCardImplCopyWith<$Res>
    implements $CreatedVirtualCardCopyWith<$Res> {
  factory _$$CreatedVirtualCardImplCopyWith(_$CreatedVirtualCardImpl value,
          $Res Function(_$CreatedVirtualCardImpl) then) =
      __$$CreatedVirtualCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, int? code, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CreatedVirtualCardImplCopyWithImpl<$Res>
    extends _$CreatedVirtualCardCopyWithImpl<$Res, _$CreatedVirtualCardImpl>
    implements _$$CreatedVirtualCardImplCopyWith<$Res> {
  __$$CreatedVirtualCardImplCopyWithImpl(_$CreatedVirtualCardImpl _value,
      $Res Function(_$CreatedVirtualCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CreatedVirtualCardImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedVirtualCardImpl implements _CreatedVirtualCard {
  _$CreatedVirtualCardImpl({this.status, this.message, this.code, this.data});

  factory _$CreatedVirtualCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedVirtualCardImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final Data? data;

  @override
  String toString() {
    return 'CreatedVirtualCard(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedVirtualCardImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedVirtualCardImplCopyWith<_$CreatedVirtualCardImpl> get copyWith =>
      __$$CreatedVirtualCardImplCopyWithImpl<_$CreatedVirtualCardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedVirtualCardImplToJson(
      this,
    );
  }
}

abstract class _CreatedVirtualCard implements CreatedVirtualCard {
  factory _CreatedVirtualCard(
      {final String? status,
      final String? message,
      final int? code,
      final Data? data}) = _$CreatedVirtualCardImpl;

  factory _CreatedVirtualCard.fromJson(Map<String, dynamic> json) =
      _$CreatedVirtualCardImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$CreatedVirtualCardImplCopyWith<_$CreatedVirtualCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
