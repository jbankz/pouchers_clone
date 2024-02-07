// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  num? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  String? get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get recipient => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_category')
  String? get subCategory => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'mapped_frequency')
  String? get mappedFrequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_operator_public_id')
  String? get mobileOperatorPublicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_operator_service_id')
  String? get mobileOperatorServiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchant_account')
  String? get merchantAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchant_service')
  String? get merchantService => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {num? id,
      @JsonKey(name: 'schedule_id') String? scheduleId,
      @JsonKey(name: 'user_id') String? userId,
      String? amount,
      String? recipient,
      String? category,
      @JsonKey(name: 'sub_category') String? subCategory,
      String? frequency,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      @JsonKey(name: 'mapped_frequency') String? mappedFrequency,
      @JsonKey(name: 'bank_name') String? bankName,
      String? note,
      String? status,
      @JsonKey(name: 'mobile_operator_public_id')
      String? mobileOperatorPublicId,
      @JsonKey(name: 'mobile_operator_service_id')
      String? mobileOperatorServiceId,
      @JsonKey(name: 'merchant_account') String? merchantAccount,
      @JsonKey(name: 'merchant_service') String? merchantService});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? scheduleId = freezed,
    Object? userId = freezed,
    Object? amount = freezed,
    Object? recipient = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? frequency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mappedFrequency = freezed,
    Object? bankName = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? mobileOperatorPublicId = freezed,
    Object? mobileOperatorServiceId = freezed,
    Object? merchantAccount = freezed,
    Object? merchantService = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mappedFrequency: freezed == mappedFrequency
          ? _value.mappedFrequency
          : mappedFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileOperatorPublicId: freezed == mobileOperatorPublicId
          ? _value.mobileOperatorPublicId
          : mobileOperatorPublicId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileOperatorServiceId: freezed == mobileOperatorServiceId
          ? _value.mobileOperatorServiceId
          : mobileOperatorServiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantAccount: freezed == merchantAccount
          ? _value.merchantAccount
          : merchantAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantService: freezed == merchantService
          ? _value.merchantService
          : merchantService // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? id,
      @JsonKey(name: 'schedule_id') String? scheduleId,
      @JsonKey(name: 'user_id') String? userId,
      String? amount,
      String? recipient,
      String? category,
      @JsonKey(name: 'sub_category') String? subCategory,
      String? frequency,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      @JsonKey(name: 'mapped_frequency') String? mappedFrequency,
      @JsonKey(name: 'bank_name') String? bankName,
      String? note,
      String? status,
      @JsonKey(name: 'mobile_operator_public_id')
      String? mobileOperatorPublicId,
      @JsonKey(name: 'mobile_operator_service_id')
      String? mobileOperatorServiceId,
      @JsonKey(name: 'merchant_account') String? merchantAccount,
      @JsonKey(name: 'merchant_service') String? merchantService});
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? scheduleId = freezed,
    Object? userId = freezed,
    Object? amount = freezed,
    Object? recipient = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? frequency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? mappedFrequency = freezed,
    Object? bankName = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? mobileOperatorPublicId = freezed,
    Object? mobileOperatorServiceId = freezed,
    Object? merchantAccount = freezed,
    Object? merchantService = freezed,
  }) {
    return _then(_$ScheduleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mappedFrequency: freezed == mappedFrequency
          ? _value.mappedFrequency
          : mappedFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileOperatorPublicId: freezed == mobileOperatorPublicId
          ? _value.mobileOperatorPublicId
          : mobileOperatorPublicId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileOperatorServiceId: freezed == mobileOperatorServiceId
          ? _value.mobileOperatorServiceId
          : mobileOperatorServiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantAccount: freezed == merchantAccount
          ? _value.merchantAccount
          : merchantAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantService: freezed == merchantService
          ? _value.merchantService
          : merchantService // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl implements _Schedule {
  _$ScheduleImpl(
      {this.id = 0,
      @JsonKey(name: 'schedule_id') this.scheduleId,
      @JsonKey(name: 'user_id') this.userId,
      this.amount,
      this.recipient,
      this.category,
      @JsonKey(name: 'sub_category') this.subCategory,
      this.frequency,
      @JsonKey(name: 'created_at') @DateTimeSerializer() this.createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() this.updatedAt,
      @JsonKey(name: 'mapped_frequency') this.mappedFrequency,
      @JsonKey(name: 'bank_name') this.bankName,
      this.note,
      this.status,
      @JsonKey(name: 'mobile_operator_public_id') this.mobileOperatorPublicId,
      @JsonKey(name: 'mobile_operator_service_id') this.mobileOperatorServiceId,
      @JsonKey(name: 'merchant_account') this.merchantAccount,
      @JsonKey(name: 'merchant_service') this.merchantService});

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  @JsonKey()
  final num? id;
  @override
  @JsonKey(name: 'schedule_id')
  final String? scheduleId;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? amount;
  @override
  final String? recipient;
  @override
  final String? category;
  @override
  @JsonKey(name: 'sub_category')
  final String? subCategory;
  @override
  final String? frequency;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'mapped_frequency')
  final String? mappedFrequency;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;
  @override
  final String? note;
  @override
  final String? status;
  @override
  @JsonKey(name: 'mobile_operator_public_id')
  final String? mobileOperatorPublicId;
  @override
  @JsonKey(name: 'mobile_operator_service_id')
  final String? mobileOperatorServiceId;
  @override
  @JsonKey(name: 'merchant_account')
  final String? merchantAccount;
  @override
  @JsonKey(name: 'merchant_service')
  final String? merchantService;

  @override
  String toString() {
    return 'Schedule(id: $id, scheduleId: $scheduleId, userId: $userId, amount: $amount, recipient: $recipient, category: $category, subCategory: $subCategory, frequency: $frequency, createdAt: $createdAt, updatedAt: $updatedAt, mappedFrequency: $mappedFrequency, bankName: $bankName, note: $note, status: $status, mobileOperatorPublicId: $mobileOperatorPublicId, mobileOperatorServiceId: $mobileOperatorServiceId, merchantAccount: $merchantAccount, merchantService: $merchantService)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.mappedFrequency, mappedFrequency) ||
                other.mappedFrequency == mappedFrequency) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mobileOperatorPublicId, mobileOperatorPublicId) ||
                other.mobileOperatorPublicId == mobileOperatorPublicId) &&
            (identical(
                    other.mobileOperatorServiceId, mobileOperatorServiceId) ||
                other.mobileOperatorServiceId == mobileOperatorServiceId) &&
            (identical(other.merchantAccount, merchantAccount) ||
                other.merchantAccount == merchantAccount) &&
            (identical(other.merchantService, merchantService) ||
                other.merchantService == merchantService));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      scheduleId,
      userId,
      amount,
      recipient,
      category,
      subCategory,
      frequency,
      createdAt,
      updatedAt,
      mappedFrequency,
      bankName,
      note,
      status,
      mobileOperatorPublicId,
      mobileOperatorServiceId,
      merchantAccount,
      merchantService);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  factory _Schedule(
          {final num? id,
          @JsonKey(name: 'schedule_id') final String? scheduleId,
          @JsonKey(name: 'user_id') final String? userId,
          final String? amount,
          final String? recipient,
          final String? category,
          @JsonKey(name: 'sub_category') final String? subCategory,
          final String? frequency,
          @JsonKey(name: 'created_at')
          @DateTimeSerializer()
          final DateTime? createdAt,
          @JsonKey(name: 'updated_at')
          @DateTimeSerializer()
          final DateTime? updatedAt,
          @JsonKey(name: 'mapped_frequency') final String? mappedFrequency,
          @JsonKey(name: 'bank_name') final String? bankName,
          final String? note,
          final String? status,
          @JsonKey(name: 'mobile_operator_public_id')
          final String? mobileOperatorPublicId,
          @JsonKey(name: 'mobile_operator_service_id')
          final String? mobileOperatorServiceId,
          @JsonKey(name: 'merchant_account') final String? merchantAccount,
          @JsonKey(name: 'merchant_service') final String? merchantService}) =
      _$ScheduleImpl;

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  num? get id;
  @override
  @JsonKey(name: 'schedule_id')
  String? get scheduleId;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get amount;
  @override
  String? get recipient;
  @override
  String? get category;
  @override
  @JsonKey(name: 'sub_category')
  String? get subCategory;
  @override
  String? get frequency;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'mapped_frequency')
  String? get mappedFrequency;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName;
  @override
  String? get note;
  @override
  String? get status;
  @override
  @JsonKey(name: 'mobile_operator_public_id')
  String? get mobileOperatorPublicId;
  @override
  @JsonKey(name: 'mobile_operator_service_id')
  String? get mobileOperatorServiceId;
  @override
  @JsonKey(name: 'merchant_account')
  String? get merchantAccount;
  @override
  @JsonKey(name: 'merchant_service')
  String? get merchantService;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
