// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestOtpModel _$RequestOtpModelFromJson(Map<String, dynamic> json) {
  return _RequestOtpModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOtpModel {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOtpModelCopyWith<RequestOtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpModelCopyWith<$Res> {
  factory $RequestOtpModelCopyWith(
          RequestOtpModel value, $Res Function(RequestOtpModel) then) =
      _$RequestOtpModelCopyWithImpl<$Res, RequestOtpModel>;
  @useResult
  $Res call({String? status, String? message, int? code, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$RequestOtpModelCopyWithImpl<$Res, $Val extends RequestOtpModel>
    implements $RequestOtpModelCopyWith<$Res> {
  _$RequestOtpModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RequestOtpModelImplCopyWith<$Res>
    implements $RequestOtpModelCopyWith<$Res> {
  factory _$$RequestOtpModelImplCopyWith(_$RequestOtpModelImpl value,
          $Res Function(_$RequestOtpModelImpl) then) =
      __$$RequestOtpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, int? code, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RequestOtpModelImplCopyWithImpl<$Res>
    extends _$RequestOtpModelCopyWithImpl<$Res, _$RequestOtpModelImpl>
    implements _$$RequestOtpModelImplCopyWith<$Res> {
  __$$RequestOtpModelImplCopyWithImpl(
      _$RequestOtpModelImpl _value, $Res Function(_$RequestOtpModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RequestOtpModelImpl(
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
class _$RequestOtpModelImpl implements _RequestOtpModel {
  _$RequestOtpModelImpl({this.status, this.message, this.code, this.data});

  factory _$RequestOtpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOtpModelImplFromJson(json);

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
    return 'RequestOtpModel(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOtpModelImpl &&
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
  _$$RequestOtpModelImplCopyWith<_$RequestOtpModelImpl> get copyWith =>
      __$$RequestOtpModelImplCopyWithImpl<_$RequestOtpModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOtpModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOtpModel implements RequestOtpModel {
  factory _RequestOtpModel(
      {final String? status,
      final String? message,
      final int? code,
      final Data? data}) = _$RequestOtpModelImpl;

  factory _RequestOtpModel.fromJson(Map<String, dynamic> json) =
      _$RequestOtpModelImpl.fromJson;

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
  _$$RequestOtpModelImplCopyWith<_$RequestOtpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
