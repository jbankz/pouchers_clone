// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requested_money_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestedMoneyModel _$RequestedMoneyModelFromJson(Map<String, dynamic> json) {
  return _RequestedMoneyModel.fromJson(json);
}

/// @nodoc
mixin _$RequestedMoneyModel {
  num? get id => throw _privateConstructorUsedError;
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
  @DateTimeSerializer()
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestedMoneyModelCopyWith<RequestedMoneyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestedMoneyModelCopyWith<$Res> {
  factory $RequestedMoneyModelCopyWith(
          RequestedMoneyModel value, $Res Function(RequestedMoneyModel) then) =
      _$RequestedMoneyModelCopyWithImpl<$Res, RequestedMoneyModel>;
  @useResult
  $Res call(
      {num? id,
      @JsonKey(name: 'request_id') String? requestId,
      @JsonKey(name: 'requestee_user_id') String? requesteeUserId,
      @JsonKey(name: 'requester_user_id') String? requesterUserId,
      @StringToNumSerializer() num amount,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      num fulfilledAmount,
      @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
      @DateTimeSerializer() @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? note,
      String? status,
      String? reason});
}

/// @nodoc
class _$RequestedMoneyModelCopyWithImpl<$Res, $Val extends RequestedMoneyModel>
    implements $RequestedMoneyModelCopyWith<$Res> {
  _$RequestedMoneyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? requestId = freezed,
    Object? requesteeUserId = freezed,
    Object? requesterUserId = freezed,
    Object? amount = null,
    Object? fulfilledAmount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestedMoneyModelImplCopyWith<$Res>
    implements $RequestedMoneyModelCopyWith<$Res> {
  factory _$$RequestedMoneyModelImplCopyWith(_$RequestedMoneyModelImpl value,
          $Res Function(_$RequestedMoneyModelImpl) then) =
      __$$RequestedMoneyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? id,
      @JsonKey(name: 'request_id') String? requestId,
      @JsonKey(name: 'requestee_user_id') String? requesteeUserId,
      @JsonKey(name: 'requester_user_id') String? requesterUserId,
      @StringToNumSerializer() num amount,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      num fulfilledAmount,
      @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
      @DateTimeSerializer() @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? note,
      String? status,
      String? reason});
}

/// @nodoc
class __$$RequestedMoneyModelImplCopyWithImpl<$Res>
    extends _$RequestedMoneyModelCopyWithImpl<$Res, _$RequestedMoneyModelImpl>
    implements _$$RequestedMoneyModelImplCopyWith<$Res> {
  __$$RequestedMoneyModelImplCopyWithImpl(_$RequestedMoneyModelImpl _value,
      $Res Function(_$RequestedMoneyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? requestId = freezed,
    Object? requesteeUserId = freezed,
    Object? requesterUserId = freezed,
    Object? amount = null,
    Object? fulfilledAmount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$RequestedMoneyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestedMoneyModelImpl implements _RequestedMoneyModel {
  _$RequestedMoneyModelImpl(
      {this.id,
      @JsonKey(name: 'request_id') this.requestId,
      @JsonKey(name: 'requestee_user_id') this.requesteeUserId,
      @JsonKey(name: 'requester_user_id') this.requesterUserId,
      @StringToNumSerializer() this.amount = 0,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      this.fulfilledAmount = 0,
      @DateTimeSerializer() @JsonKey(name: 'created_at') this.createdAt,
      @DateTimeSerializer() @JsonKey(name: 'updated_at') this.updatedAt,
      this.note,
      this.status,
      this.reason});

  factory _$RequestedMoneyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestedMoneyModelImplFromJson(json);

  @override
  final num? id;
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
  @DateTimeSerializer()
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final String? note;
  @override
  final String? status;
  @override
  final String? reason;

  @override
  String toString() {
    return 'RequestedMoneyModel(id: $id, requestId: $requestId, requesteeUserId: $requesteeUserId, requesterUserId: $requesterUserId, amount: $amount, fulfilledAmount: $fulfilledAmount, createdAt: $createdAt, updatedAt: $updatedAt, note: $note, status: $status, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestedMoneyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      requestId,
      requesteeUserId,
      requesterUserId,
      amount,
      fulfilledAmount,
      createdAt,
      updatedAt,
      note,
      status,
      reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestedMoneyModelImplCopyWith<_$RequestedMoneyModelImpl> get copyWith =>
      __$$RequestedMoneyModelImplCopyWithImpl<_$RequestedMoneyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestedMoneyModelImplToJson(
      this,
    );
  }
}

abstract class _RequestedMoneyModel implements RequestedMoneyModel {
  factory _RequestedMoneyModel(
      {final num? id,
      @JsonKey(name: 'request_id') final String? requestId,
      @JsonKey(name: 'requestee_user_id') final String? requesteeUserId,
      @JsonKey(name: 'requester_user_id') final String? requesterUserId,
      @StringToNumSerializer() final num amount,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      final num fulfilledAmount,
      @DateTimeSerializer()
      @JsonKey(name: 'created_at')
      final DateTime? createdAt,
      @DateTimeSerializer()
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt,
      final String? note,
      final String? status,
      final String? reason}) = _$RequestedMoneyModelImpl;

  factory _RequestedMoneyModel.fromJson(Map<String, dynamic> json) =
      _$RequestedMoneyModelImpl.fromJson;

  @override
  num? get id;
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
  @DateTimeSerializer()
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  String? get note;
  @override
  String? get status;
  @override
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$RequestedMoneyModelImplCopyWith<_$RequestedMoneyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
