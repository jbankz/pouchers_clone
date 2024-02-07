// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_reset_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateResetPasswordModel _$ValidateResetPasswordModelFromJson(
    Map<String, dynamic> json) {
  return _ValidateResetPasswordModel.fromJson(json);
}

/// @nodoc
mixin _$ValidateResetPasswordModel {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  User? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateResetPasswordModelCopyWith<ValidateResetPasswordModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateResetPasswordModelCopyWith<$Res> {
  factory $ValidateResetPasswordModelCopyWith(ValidateResetPasswordModel value,
          $Res Function(ValidateResetPasswordModel) then) =
      _$ValidateResetPasswordModelCopyWithImpl<$Res,
          ValidateResetPasswordModel>;
  @useResult
  $Res call({String? status, String? message, int? code, User? data});

  $UserCopyWith<$Res>? get data;
}

/// @nodoc
class _$ValidateResetPasswordModelCopyWithImpl<$Res,
        $Val extends ValidateResetPasswordModel>
    implements $ValidateResetPasswordModelCopyWith<$Res> {
  _$ValidateResetPasswordModelCopyWithImpl(this._value, this._then);

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
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ValidateResetPasswordModelImplCopyWith<$Res>
    implements $ValidateResetPasswordModelCopyWith<$Res> {
  factory _$$ValidateResetPasswordModelImplCopyWith(
          _$ValidateResetPasswordModelImpl value,
          $Res Function(_$ValidateResetPasswordModelImpl) then) =
      __$$ValidateResetPasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, int? code, User? data});

  @override
  $UserCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ValidateResetPasswordModelImplCopyWithImpl<$Res>
    extends _$ValidateResetPasswordModelCopyWithImpl<$Res,
        _$ValidateResetPasswordModelImpl>
    implements _$$ValidateResetPasswordModelImplCopyWith<$Res> {
  __$$ValidateResetPasswordModelImplCopyWithImpl(
      _$ValidateResetPasswordModelImpl _value,
      $Res Function(_$ValidateResetPasswordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ValidateResetPasswordModelImpl(
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
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateResetPasswordModelImpl implements _ValidateResetPasswordModel {
  _$ValidateResetPasswordModelImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ValidateResetPasswordModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ValidateResetPasswordModelImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final User? data;

  @override
  String toString() {
    return 'ValidateResetPasswordModel(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateResetPasswordModelImpl &&
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
  _$$ValidateResetPasswordModelImplCopyWith<_$ValidateResetPasswordModelImpl>
      get copyWith => __$$ValidateResetPasswordModelImplCopyWithImpl<
          _$ValidateResetPasswordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateResetPasswordModelImplToJson(
      this,
    );
  }
}

abstract class _ValidateResetPasswordModel
    implements ValidateResetPasswordModel {
  factory _ValidateResetPasswordModel(
      {final String? status,
      final String? message,
      final int? code,
      final User? data}) = _$ValidateResetPasswordModelImpl;

  factory _ValidateResetPasswordModel.fromJson(Map<String, dynamic> json) =
      _$ValidateResetPasswordModelImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  User? get data;
  @override
  @JsonKey(ignore: true)
  _$$ValidateResetPasswordModelImplCopyWith<_$ValidateResetPasswordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
