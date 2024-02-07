// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) {
  return _RequestModel.fromJson(json);
}

/// @nodoc
mixin _$RequestModel {
  @JsonKey(name: 'request_id')
  String? get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestee_user_id')
  String? get requesteeUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'requester_user_id')
  String? get requesterUserId => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num get amount => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  @JsonKey(name: 'fulfilled_amount')
  num get fulfilledAmount => throw _privateConstructorUsedError;
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestModelCopyWith<RequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestModelCopyWith<$Res> {
  factory $RequestModelCopyWith(
          RequestModel value, $Res Function(RequestModel) then) =
      _$RequestModelCopyWithImpl<$Res, RequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'request_id') String? requestId,
      @JsonKey(name: 'requestee_user_id') String? requesteeUserId,
      @JsonKey(name: 'requester_user_id') String? requesterUserId,
      @StringToNumSerializer() num amount,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      num fulfilledAmount,
      @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
      String? note,
      String? status,
      String? reason,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_picture') String? profilePicture});
}

/// @nodoc
class _$RequestModelCopyWithImpl<$Res, $Val extends RequestModel>
    implements $RequestModelCopyWith<$Res> {
  _$RequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? requesteeUserId = freezed,
    Object? requesterUserId = freezed,
    Object? amount = null,
    Object? fulfilledAmount = null,
    Object? createdAt = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      requesteeUserId: freezed == requesteeUserId
          ? _value.requesteeUserId
          : requesteeUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      requesterUserId: freezed == requesterUserId
          ? _value.requesterUserId
          : requesterUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      fulfilledAmount: null == fulfilledAmount
          ? _value.fulfilledAmount
          : fulfilledAmount // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestModelImplCopyWith<$Res>
    implements $RequestModelCopyWith<$Res> {
  factory _$$RequestModelImplCopyWith(
          _$RequestModelImpl value, $Res Function(_$RequestModelImpl) then) =
      __$$RequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'request_id') String? requestId,
      @JsonKey(name: 'requestee_user_id') String? requesteeUserId,
      @JsonKey(name: 'requester_user_id') String? requesterUserId,
      @StringToNumSerializer() num amount,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      num fulfilledAmount,
      @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
      String? note,
      String? status,
      String? reason,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_picture') String? profilePicture});
}

/// @nodoc
class __$$RequestModelImplCopyWithImpl<$Res>
    extends _$RequestModelCopyWithImpl<$Res, _$RequestModelImpl>
    implements _$$RequestModelImplCopyWith<$Res> {
  __$$RequestModelImplCopyWithImpl(
      _$RequestModelImpl _value, $Res Function(_$RequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? requesteeUserId = freezed,
    Object? requesterUserId = freezed,
    Object? amount = null,
    Object? fulfilledAmount = null,
    Object? createdAt = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$RequestModelImpl(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      requesteeUserId: freezed == requesteeUserId
          ? _value.requesteeUserId
          : requesteeUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      requesterUserId: freezed == requesterUserId
          ? _value.requesterUserId
          : requesterUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      fulfilledAmount: null == fulfilledAmount
          ? _value.fulfilledAmount
          : fulfilledAmount // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestModelImpl implements _RequestModel {
  _$RequestModelImpl(
      {@JsonKey(name: 'request_id') this.requestId,
      @JsonKey(name: 'requestee_user_id') this.requesteeUserId,
      @JsonKey(name: 'requester_user_id') this.requesterUserId,
      @StringToNumSerializer() this.amount = 0,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      this.fulfilledAmount = 0,
      @DateTimeSerializer() @JsonKey(name: 'created_at') this.createdAt,
      this.note,
      this.status,
      this.reason,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'profile_picture') this.profilePicture});

  factory _$RequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'request_id')
  final String? requestId;
  @override
  @JsonKey(name: 'requestee_user_id')
  final String? requesteeUserId;
  @override
  @JsonKey(name: 'requester_user_id')
  final String? requesterUserId;
  @override
  @JsonKey()
  @StringToNumSerializer()
  final num amount;
  @override
  @StringToNumSerializer()
  @JsonKey(name: 'fulfilled_amount')
  final num fulfilledAmount;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  final String? note;
  @override
  final String? status;
  @override
  final String? reason;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  @override
  String toString() {
    return 'RequestModel(requestId: $requestId, requesteeUserId: $requesteeUserId, requesterUserId: $requesterUserId, amount: $amount, fulfilledAmount: $fulfilledAmount, createdAt: $createdAt, note: $note, status: $status, reason: $reason, firstName: $firstName, lastName: $lastName, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.requesteeUserId, requesteeUserId) ||
                other.requesteeUserId == requesteeUserId) &&
            (identical(other.requesterUserId, requesterUserId) ||
                other.requesterUserId == requesterUserId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fulfilledAmount, fulfilledAmount) ||
                other.fulfilledAmount == fulfilledAmount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      requesteeUserId,
      requesterUserId,
      amount,
      fulfilledAmount,
      createdAt,
      note,
      status,
      reason,
      firstName,
      lastName,
      profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestModelImplCopyWith<_$RequestModelImpl> get copyWith =>
      __$$RequestModelImplCopyWithImpl<_$RequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestModelImplToJson(
      this,
    );
  }
}

abstract class _RequestModel implements RequestModel {
  factory _RequestModel(
          {@JsonKey(name: 'request_id') final String? requestId,
          @JsonKey(name: 'requestee_user_id') final String? requesteeUserId,
          @JsonKey(name: 'requester_user_id') final String? requesterUserId,
          @StringToNumSerializer() final num amount,
          @StringToNumSerializer()
          @JsonKey(name: 'fulfilled_amount')
          final num fulfilledAmount,
          @DateTimeSerializer()
          @JsonKey(name: 'created_at')
          final DateTime? createdAt,
          final String? note,
          final String? status,
          final String? reason,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'profile_picture') final String? profilePicture}) =
      _$RequestModelImpl;

  factory _RequestModel.fromJson(Map<String, dynamic> json) =
      _$RequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'request_id')
  String? get requestId;
  @override
  @JsonKey(name: 'requestee_user_id')
  String? get requesteeUserId;
  @override
  @JsonKey(name: 'requester_user_id')
  String? get requesterUserId;
  @override
  @StringToNumSerializer()
  num get amount;
  @override
  @StringToNumSerializer()
  @JsonKey(name: 'fulfilled_amount')
  num get fulfilledAmount;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  String? get note;
  @override
  String? get status;
  @override
  String? get reason;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$RequestModelImplCopyWith<_$RequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
