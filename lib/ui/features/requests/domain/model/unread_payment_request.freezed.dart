// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unread_payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnreadPaymentRequest _$UnreadPaymentRequestFromJson(Map<String, dynamic> json) {
  return _UnreadPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$UnreadPaymentRequest {
  int get unreadPaymentRequestCount => throw _privateConstructorUsedError;
  List<NotificationModel> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnreadPaymentRequestCopyWith<UnreadPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadPaymentRequestCopyWith<$Res> {
  factory $UnreadPaymentRequestCopyWith(UnreadPaymentRequest value,
          $Res Function(UnreadPaymentRequest) then) =
      _$UnreadPaymentRequestCopyWithImpl<$Res, UnreadPaymentRequest>;
  @useResult
  $Res call({int unreadPaymentRequestCount, List<NotificationModel> result});
}

/// @nodoc
class _$UnreadPaymentRequestCopyWithImpl<$Res,
        $Val extends UnreadPaymentRequest>
    implements $UnreadPaymentRequestCopyWith<$Res> {
  _$UnreadPaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadPaymentRequestCount = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      unreadPaymentRequestCount: null == unreadPaymentRequestCount
          ? _value.unreadPaymentRequestCount
          : unreadPaymentRequestCount // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnreadPaymentRequestImplCopyWith<$Res>
    implements $UnreadPaymentRequestCopyWith<$Res> {
  factory _$$UnreadPaymentRequestImplCopyWith(_$UnreadPaymentRequestImpl value,
          $Res Function(_$UnreadPaymentRequestImpl) then) =
      __$$UnreadPaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int unreadPaymentRequestCount, List<NotificationModel> result});
}

/// @nodoc
class __$$UnreadPaymentRequestImplCopyWithImpl<$Res>
    extends _$UnreadPaymentRequestCopyWithImpl<$Res, _$UnreadPaymentRequestImpl>
    implements _$$UnreadPaymentRequestImplCopyWith<$Res> {
  __$$UnreadPaymentRequestImplCopyWithImpl(_$UnreadPaymentRequestImpl _value,
      $Res Function(_$UnreadPaymentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadPaymentRequestCount = null,
    Object? result = null,
  }) {
    return _then(_$UnreadPaymentRequestImpl(
      unreadPaymentRequestCount: null == unreadPaymentRequestCount
          ? _value.unreadPaymentRequestCount
          : unreadPaymentRequestCount // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnreadPaymentRequestImpl implements _UnreadPaymentRequest {
  _$UnreadPaymentRequestImpl(
      {this.unreadPaymentRequestCount = 0,
      final List<NotificationModel> result = const []})
      : _result = result;

  factory _$UnreadPaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadPaymentRequestImplFromJson(json);

  @override
  @JsonKey()
  final int unreadPaymentRequestCount;
  final List<NotificationModel> _result;
  @override
  @JsonKey()
  List<NotificationModel> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'UnreadPaymentRequest(unreadPaymentRequestCount: $unreadPaymentRequestCount, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadPaymentRequestImpl &&
            (identical(other.unreadPaymentRequestCount,
                    unreadPaymentRequestCount) ||
                other.unreadPaymentRequestCount == unreadPaymentRequestCount) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unreadPaymentRequestCount,
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadPaymentRequestImplCopyWith<_$UnreadPaymentRequestImpl>
      get copyWith =>
          __$$UnreadPaymentRequestImplCopyWithImpl<_$UnreadPaymentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadPaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _UnreadPaymentRequest implements UnreadPaymentRequest {
  factory _UnreadPaymentRequest(
      {final int unreadPaymentRequestCount,
      final List<NotificationModel> result}) = _$UnreadPaymentRequestImpl;

  factory _UnreadPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$UnreadPaymentRequestImpl.fromJson;

  @override
  int get unreadPaymentRequestCount;
  @override
  List<NotificationModel> get result;
  @override
  @JsonKey(ignore: true)
  _$$UnreadPaymentRequestImplCopyWith<_$UnreadPaymentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
