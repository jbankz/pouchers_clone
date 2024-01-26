// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) {
  return _ScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModel {
  @StringToNumSerializer()
  num get amount => throw _privateConstructorUsedError;
  String? get recipient => throw _privateConstructorUsedError;
  ServiceCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  String? get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_category')
  String? get subCategory => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'beneficiary_account_name')
  String? get beneficiaryAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_provider')
  String? get currentProvider => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_operator_public_id')
  String? get mobileOperatorPublicId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
          ScheduleModel value, $Res Function(ScheduleModel) then) =
      _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call(
      {@StringToNumSerializer() num amount,
      String? recipient,
      ServiceCategory? category,
      @JsonKey(name: 'schedule_id') String? scheduleId,
      @JsonKey(name: 'sub_category') String? subCategory,
      String? frequency,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'beneficiary_account_name') String? beneficiaryAccountName,
      @JsonKey(name: 'current_provider') String? currentProvider,
      String? status,
      @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'mobile_operator_public_id')
      String? mobileOperatorPublicId});
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? recipient = freezed,
    Object? category = freezed,
    Object? scheduleId = freezed,
    Object? subCategory = freezed,
    Object? frequency = freezed,
    Object? bankName = freezed,
    Object? beneficiaryAccountName = freezed,
    Object? currentProvider = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? mobileOperatorPublicId = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategory?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryAccountName: freezed == beneficiaryAccountName
          ? _value.beneficiaryAccountName
          : beneficiaryAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentProvider: freezed == currentProvider
          ? _value.currentProvider
          : currentProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobileOperatorPublicId: freezed == mobileOperatorPublicId
          ? _value.mobileOperatorPublicId
          : mobileOperatorPublicId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleModelImplCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$ScheduleModelImplCopyWith(
          _$ScheduleModelImpl value, $Res Function(_$ScheduleModelImpl) then) =
      __$$ScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringToNumSerializer() num amount,
      String? recipient,
      ServiceCategory? category,
      @JsonKey(name: 'schedule_id') String? scheduleId,
      @JsonKey(name: 'sub_category') String? subCategory,
      String? frequency,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'beneficiary_account_name') String? beneficiaryAccountName,
      @JsonKey(name: 'current_provider') String? currentProvider,
      String? status,
      @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'mobile_operator_public_id')
      String? mobileOperatorPublicId});
}

/// @nodoc
class __$$ScheduleModelImplCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$ScheduleModelImpl>
    implements _$$ScheduleModelImplCopyWith<$Res> {
  __$$ScheduleModelImplCopyWithImpl(
      _$ScheduleModelImpl _value, $Res Function(_$ScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? recipient = freezed,
    Object? category = freezed,
    Object? scheduleId = freezed,
    Object? subCategory = freezed,
    Object? frequency = freezed,
    Object? bankName = freezed,
    Object? beneficiaryAccountName = freezed,
    Object? currentProvider = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? mobileOperatorPublicId = freezed,
  }) {
    return _then(_$ScheduleModelImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategory?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryAccountName: freezed == beneficiaryAccountName
          ? _value.beneficiaryAccountName
          : beneficiaryAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentProvider: freezed == currentProvider
          ? _value.currentProvider
          : currentProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobileOperatorPublicId: freezed == mobileOperatorPublicId
          ? _value.mobileOperatorPublicId
          : mobileOperatorPublicId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleModelImpl implements _ScheduleModel {
  _$ScheduleModelImpl(
      {@StringToNumSerializer() this.amount = 0,
      this.recipient,
      this.category,
      @JsonKey(name: 'schedule_id') this.scheduleId,
      @JsonKey(name: 'sub_category') this.subCategory,
      this.frequency,
      @JsonKey(name: 'bank_name') this.bankName,
      @JsonKey(name: 'beneficiary_account_name') this.beneficiaryAccountName,
      @JsonKey(name: 'current_provider') this.currentProvider,
      this.status,
      @DateTimeSerializer() @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'mobile_operator_public_id') this.mobileOperatorPublicId});

  factory _$ScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleModelImplFromJson(json);

  @override
  @JsonKey()
  @StringToNumSerializer()
  final num amount;
  @override
  final String? recipient;
  @override
  final ServiceCategory? category;
  @override
  @JsonKey(name: 'schedule_id')
  final String? scheduleId;
  @override
  @JsonKey(name: 'sub_category')
  final String? subCategory;
  @override
  final String? frequency;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;
  @override
  @JsonKey(name: 'beneficiary_account_name')
  final String? beneficiaryAccountName;
  @override
  @JsonKey(name: 'current_provider')
  final String? currentProvider;
  @override
  final String? status;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'mobile_operator_public_id')
  final String? mobileOperatorPublicId;

  @override
  String toString() {
    return 'ScheduleModel(amount: $amount, recipient: $recipient, category: $category, scheduleId: $scheduleId, subCategory: $subCategory, frequency: $frequency, bankName: $bankName, beneficiaryAccountName: $beneficiaryAccountName, currentProvider: $currentProvider, status: $status, createdAt: $createdAt, mobileOperatorPublicId: $mobileOperatorPublicId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.beneficiaryAccountName, beneficiaryAccountName) ||
                other.beneficiaryAccountName == beneficiaryAccountName) &&
            (identical(other.currentProvider, currentProvider) ||
                other.currentProvider == currentProvider) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.mobileOperatorPublicId, mobileOperatorPublicId) ||
                other.mobileOperatorPublicId == mobileOperatorPublicId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      recipient,
      category,
      scheduleId,
      subCategory,
      frequency,
      bankName,
      beneficiaryAccountName,
      currentProvider,
      status,
      createdAt,
      mobileOperatorPublicId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      __$$ScheduleModelImplCopyWithImpl<_$ScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _ScheduleModel implements ScheduleModel {
  factory _ScheduleModel(
      {@StringToNumSerializer() final num amount,
      final String? recipient,
      final ServiceCategory? category,
      @JsonKey(name: 'schedule_id') final String? scheduleId,
      @JsonKey(name: 'sub_category') final String? subCategory,
      final String? frequency,
      @JsonKey(name: 'bank_name') final String? bankName,
      @JsonKey(name: 'beneficiary_account_name')
      final String? beneficiaryAccountName,
      @JsonKey(name: 'current_provider') final String? currentProvider,
      final String? status,
      @DateTimeSerializer()
      @JsonKey(name: 'created_at')
      final DateTime? createdAt,
      @JsonKey(name: 'mobile_operator_public_id')
      final String? mobileOperatorPublicId}) = _$ScheduleModelImpl;

  factory _ScheduleModel.fromJson(Map<String, dynamic> json) =
      _$ScheduleModelImpl.fromJson;

  @override
  @StringToNumSerializer()
  num get amount;
  @override
  String? get recipient;
  @override
  ServiceCategory? get category;
  @override
  @JsonKey(name: 'schedule_id')
  String? get scheduleId;
  @override
  @JsonKey(name: 'sub_category')
  String? get subCategory;
  @override
  String? get frequency;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName;
  @override
  @JsonKey(name: 'beneficiary_account_name')
  String? get beneficiaryAccountName;
  @override
  @JsonKey(name: 'current_provider')
  String? get currentProvider;
  @override
  String? get status;
  @override
  @DateTimeSerializer()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'mobile_operator_public_id')
  String? get mobileOperatorPublicId;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
