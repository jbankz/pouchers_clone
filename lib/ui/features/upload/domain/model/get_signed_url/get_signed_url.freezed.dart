// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_signed_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetSignedUrl _$GetSignedUrlFromJson(Map<String, dynamic> json) {
  return _GetSignedUrl.fromJson(json);
}

/// @nodoc
mixin _$GetSignedUrl {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSignedUrlCopyWith<GetSignedUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSignedUrlCopyWith<$Res> {
  factory $GetSignedUrlCopyWith(
          GetSignedUrl value, $Res Function(GetSignedUrl) then) =
      _$GetSignedUrlCopyWithImpl<$Res, GetSignedUrl>;
  @useResult
  $Res call({String? status, String? message, int? code, String? data});
}

/// @nodoc
class _$GetSignedUrlCopyWithImpl<$Res, $Val extends GetSignedUrl>
    implements $GetSignedUrlCopyWith<$Res> {
  _$GetSignedUrlCopyWithImpl(this._value, this._then);

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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSignedUrlImplCopyWith<$Res>
    implements $GetSignedUrlCopyWith<$Res> {
  factory _$$GetSignedUrlImplCopyWith(
          _$GetSignedUrlImpl value, $Res Function(_$GetSignedUrlImpl) then) =
      __$$GetSignedUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, int? code, String? data});
}

/// @nodoc
class __$$GetSignedUrlImplCopyWithImpl<$Res>
    extends _$GetSignedUrlCopyWithImpl<$Res, _$GetSignedUrlImpl>
    implements _$$GetSignedUrlImplCopyWith<$Res> {
  __$$GetSignedUrlImplCopyWithImpl(
      _$GetSignedUrlImpl _value, $Res Function(_$GetSignedUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetSignedUrlImpl(
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSignedUrlImpl implements _GetSignedUrl {
  _$GetSignedUrlImpl({this.status, this.message, this.code, this.data});

  factory _$GetSignedUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSignedUrlImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final String? data;

  @override
  String toString() {
    return 'GetSignedUrl(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSignedUrlImpl &&
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
  _$$GetSignedUrlImplCopyWith<_$GetSignedUrlImpl> get copyWith =>
      __$$GetSignedUrlImplCopyWithImpl<_$GetSignedUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSignedUrlImplToJson(
      this,
    );
  }
}

abstract class _GetSignedUrl implements GetSignedUrl {
  factory _GetSignedUrl(
      {final String? status,
      final String? message,
      final int? code,
      final String? data}) = _$GetSignedUrlImpl;

  factory _GetSignedUrl.fromJson(Map<String, dynamic> json) =
      _$GetSignedUrlImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetSignedUrlImplCopyWith<_$GetSignedUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
