// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'virtual_card_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VirtualCardDetails _$VirtualCardDetailsFromJson(Map<String, dynamic> json) {
  return _VirtualCardDetails.fromJson(json);
}

/// @nodoc
mixin _$VirtualCardDetails {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VirtualCardDetailsCopyWith<VirtualCardDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualCardDetailsCopyWith<$Res> {
  factory $VirtualCardDetailsCopyWith(
          VirtualCardDetails value, $Res Function(VirtualCardDetails) then) =
      _$VirtualCardDetailsCopyWithImpl<$Res, VirtualCardDetails>;
  @useResult
  $Res call({String? status, String? message, int? code, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$VirtualCardDetailsCopyWithImpl<$Res, $Val extends VirtualCardDetails>
    implements $VirtualCardDetailsCopyWith<$Res> {
  _$VirtualCardDetailsCopyWithImpl(this._value, this._then);

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
abstract class _$$VirtualCardDetailsImplCopyWith<$Res>
    implements $VirtualCardDetailsCopyWith<$Res> {
  factory _$$VirtualCardDetailsImplCopyWith(_$VirtualCardDetailsImpl value,
          $Res Function(_$VirtualCardDetailsImpl) then) =
      __$$VirtualCardDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, int? code, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$VirtualCardDetailsImplCopyWithImpl<$Res>
    extends _$VirtualCardDetailsCopyWithImpl<$Res, _$VirtualCardDetailsImpl>
    implements _$$VirtualCardDetailsImplCopyWith<$Res> {
  __$$VirtualCardDetailsImplCopyWithImpl(_$VirtualCardDetailsImpl _value,
      $Res Function(_$VirtualCardDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$VirtualCardDetailsImpl(
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
class _$VirtualCardDetailsImpl implements _VirtualCardDetails {
  _$VirtualCardDetailsImpl({this.status, this.message, this.code, this.data});

  factory _$VirtualCardDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualCardDetailsImplFromJson(json);

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
    return 'VirtualCardDetails(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualCardDetailsImpl &&
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
  _$$VirtualCardDetailsImplCopyWith<_$VirtualCardDetailsImpl> get copyWith =>
      __$$VirtualCardDetailsImplCopyWithImpl<_$VirtualCardDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualCardDetailsImplToJson(
      this,
    );
  }
}

abstract class _VirtualCardDetails implements VirtualCardDetails {
  factory _VirtualCardDetails(
      {final String? status,
      final String? message,
      final int? code,
      final Data? data}) = _$VirtualCardDetailsImpl;

  factory _VirtualCardDetails.fromJson(Map<String, dynamic> json) =
      _$VirtualCardDetailsImpl.fromJson;

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
  _$$VirtualCardDetailsImplCopyWith<_$VirtualCardDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
