// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  @HiveField(0)
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(3)
  @StringToNumSerializer()
  num get amount => throw _privateConstructorUsedError;
  @HiveField(4)
  @StringToNumSerializer()
  @JsonKey(name: 'transaction_fee')
  num get transactionFee => throw _privateConstructorUsedError;
  @HiveField(5)
  Currency get currency => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'transaction_type')
  @HiveField(7)
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'transaction_category')
  ServiceCategory? get transactionCategory =>
      throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'transaction_reference')
  String? get transactionReference => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'beneficiary_name')
  String? get beneficiaryName => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'extra_details')
  ExtraDetails? get extraDetails => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get remarks => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get status => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'transaction_id') String? transactionId,
      @HiveField(2) @JsonKey(name: 'user_id') String? userId,
      @HiveField(3) @StringToNumSerializer() num amount,
      @HiveField(4)
      @StringToNumSerializer()
      @JsonKey(name: 'transaction_fee')
      num transactionFee,
      @HiveField(5) Currency currency,
      @HiveField(6)
      @JsonKey(name: 'transaction_type')
      @HiveField(7)
      TransactionType transactionType,
      @HiveField(8)
      @JsonKey(name: 'transaction_category')
      ServiceCategory? transactionCategory,
      @HiveField(9)
      @JsonKey(name: 'transaction_reference')
      String? transactionReference,
      @HiveField(10) @JsonKey(name: 'beneficiary_name') String? beneficiaryName,
      @HiveField(11) @JsonKey(name: 'extra_details') ExtraDetails? extraDetails,
      @HiveField(12) String? remarks,
      @HiveField(13) String? status,
      @HiveField(14)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      DateTime? createdAt,
      @HiveField(15)
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      DateTime? updatedAt});

  $ExtraDetailsCopyWith<$Res>? get extraDetails;
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? userId = freezed,
    Object? amount = null,
    Object? transactionFee = null,
    Object? currency = null,
    Object? transactionType = null,
    Object? transactionCategory = freezed,
    Object? transactionReference = freezed,
    Object? beneficiaryName = freezed,
    Object? extraDetails = freezed,
    Object? remarks = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      transactionFee: null == transactionFee
          ? _value.transactionFee
          : transactionFee // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      transactionCategory: freezed == transactionCategory
          ? _value.transactionCategory
          : transactionCategory // ignore: cast_nullable_to_non_nullable
              as ServiceCategory?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryName: freezed == beneficiaryName
          ? _value.beneficiaryName
          : beneficiaryName // ignore: cast_nullable_to_non_nullable
              as String?,
      extraDetails: freezed == extraDetails
          ? _value.extraDetails
          : extraDetails // ignore: cast_nullable_to_non_nullable
              as ExtraDetails?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtraDetailsCopyWith<$Res>? get extraDetails {
    if (_value.extraDetails == null) {
      return null;
    }

    return $ExtraDetailsCopyWith<$Res>(_value.extraDetails!, (value) {
      return _then(_value.copyWith(extraDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionHistoryImplCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$TransactionHistoryImplCopyWith(_$TransactionHistoryImpl value,
          $Res Function(_$TransactionHistoryImpl) then) =
      __$$TransactionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'transaction_id') String? transactionId,
      @HiveField(2) @JsonKey(name: 'user_id') String? userId,
      @HiveField(3) @StringToNumSerializer() num amount,
      @HiveField(4)
      @StringToNumSerializer()
      @JsonKey(name: 'transaction_fee')
      num transactionFee,
      @HiveField(5) Currency currency,
      @HiveField(6)
      @JsonKey(name: 'transaction_type')
      @HiveField(7)
      TransactionType transactionType,
      @HiveField(8)
      @JsonKey(name: 'transaction_category')
      ServiceCategory? transactionCategory,
      @HiveField(9)
      @JsonKey(name: 'transaction_reference')
      String? transactionReference,
      @HiveField(10) @JsonKey(name: 'beneficiary_name') String? beneficiaryName,
      @HiveField(11) @JsonKey(name: 'extra_details') ExtraDetails? extraDetails,
      @HiveField(12) String? remarks,
      @HiveField(13) String? status,
      @HiveField(14)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      DateTime? createdAt,
      @HiveField(15)
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      DateTime? updatedAt});

  @override
  $ExtraDetailsCopyWith<$Res>? get extraDetails;
}

/// @nodoc
class __$$TransactionHistoryImplCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$TransactionHistoryImpl>
    implements _$$TransactionHistoryImplCopyWith<$Res> {
  __$$TransactionHistoryImplCopyWithImpl(_$TransactionHistoryImpl _value,
      $Res Function(_$TransactionHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? userId = freezed,
    Object? amount = null,
    Object? transactionFee = null,
    Object? currency = null,
    Object? transactionType = null,
    Object? transactionCategory = freezed,
    Object? transactionReference = freezed,
    Object? beneficiaryName = freezed,
    Object? extraDetails = freezed,
    Object? remarks = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TransactionHistoryImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      transactionFee: null == transactionFee
          ? _value.transactionFee
          : transactionFee // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      transactionCategory: freezed == transactionCategory
          ? _value.transactionCategory
          : transactionCategory // ignore: cast_nullable_to_non_nullable
              as ServiceCategory?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryName: freezed == beneficiaryName
          ? _value.beneficiaryName
          : beneficiaryName // ignore: cast_nullable_to_non_nullable
              as String?,
      extraDetails: freezed == extraDetails
          ? _value.extraDetails
          : extraDetails // ignore: cast_nullable_to_non_nullable
              as ExtraDetails?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 17, adapterName: 'TransactionHistoryAdapter')
class _$TransactionHistoryImpl implements _TransactionHistory {
  _$TransactionHistoryImpl(
      {@HiveField(0) @JsonKey(name: 'transaction_id') this.transactionId,
      @HiveField(2) @JsonKey(name: 'user_id') this.userId,
      @HiveField(3) @StringToNumSerializer() this.amount = 0,
      @HiveField(4)
      @StringToNumSerializer()
      @JsonKey(name: 'transaction_fee')
      this.transactionFee = 0,
      @HiveField(5) this.currency = Currency.NGN,
      @HiveField(6)
      @JsonKey(name: 'transaction_type')
      @HiveField(7)
      this.transactionType = TransactionType.debit,
      @HiveField(8)
      @JsonKey(name: 'transaction_category')
      this.transactionCategory,
      @HiveField(9)
      @JsonKey(name: 'transaction_reference')
      this.transactionReference,
      @HiveField(10) @JsonKey(name: 'beneficiary_name') this.beneficiaryName,
      @HiveField(11) @JsonKey(name: 'extra_details') this.extraDetails,
      @HiveField(12) this.remarks,
      @HiveField(13) this.status,
      @HiveField(14)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      this.createdAt,
      @HiveField(15)
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      this.updatedAt});

  factory _$TransactionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @override
  @HiveField(2)
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey()
  @HiveField(3)
  @StringToNumSerializer()
  final num amount;
  @override
  @HiveField(4)
  @StringToNumSerializer()
  @JsonKey(name: 'transaction_fee')
  final num transactionFee;
  @override
  @JsonKey()
  @HiveField(5)
  final Currency currency;
  @override
  @HiveField(6)
  @JsonKey(name: 'transaction_type')
  @HiveField(7)
  final TransactionType transactionType;
  @override
  @HiveField(8)
  @JsonKey(name: 'transaction_category')
  final ServiceCategory? transactionCategory;
  @override
  @HiveField(9)
  @JsonKey(name: 'transaction_reference')
  final String? transactionReference;
  @override
  @HiveField(10)
  @JsonKey(name: 'beneficiary_name')
  final String? beneficiaryName;
  @override
  @HiveField(11)
  @JsonKey(name: 'extra_details')
  final ExtraDetails? extraDetails;
  @override
  @HiveField(12)
  final String? remarks;
  @override
  @HiveField(13)
  final String? status;
  @override
  @HiveField(14)
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  final DateTime? createdAt;
  @override
  @HiveField(15)
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TransactionHistory(transactionId: $transactionId, userId: $userId, amount: $amount, transactionFee: $transactionFee, currency: $currency, transactionType: $transactionType, transactionCategory: $transactionCategory, transactionReference: $transactionReference, beneficiaryName: $beneficiaryName, extraDetails: $extraDetails, remarks: $remarks, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionFee, transactionFee) ||
                other.transactionFee == transactionFee) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.transactionCategory, transactionCategory) ||
                other.transactionCategory == transactionCategory) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.beneficiaryName, beneficiaryName) ||
                other.beneficiaryName == beneficiaryName) &&
            (identical(other.extraDetails, extraDetails) ||
                other.extraDetails == extraDetails) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      userId,
      amount,
      transactionFee,
      currency,
      transactionType,
      transactionCategory,
      transactionReference,
      beneficiaryName,
      extraDetails,
      remarks,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      __$$TransactionHistoryImplCopyWithImpl<_$TransactionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryImplToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  factory _TransactionHistory(
      {@HiveField(0)
      @JsonKey(name: 'transaction_id')
      final String? transactionId,
      @HiveField(2) @JsonKey(name: 'user_id') final String? userId,
      @HiveField(3) @StringToNumSerializer() final num amount,
      @HiveField(4)
      @StringToNumSerializer()
      @JsonKey(name: 'transaction_fee')
      final num transactionFee,
      @HiveField(5) final Currency currency,
      @HiveField(6)
      @JsonKey(name: 'transaction_type')
      @HiveField(7)
      final TransactionType transactionType,
      @HiveField(8)
      @JsonKey(name: 'transaction_category')
      final ServiceCategory? transactionCategory,
      @HiveField(9)
      @JsonKey(name: 'transaction_reference')
      final String? transactionReference,
      @HiveField(10)
      @JsonKey(name: 'beneficiary_name')
      final String? beneficiaryName,
      @HiveField(11)
      @JsonKey(name: 'extra_details')
      final ExtraDetails? extraDetails,
      @HiveField(12) final String? remarks,
      @HiveField(13) final String? status,
      @HiveField(14)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      final DateTime? createdAt,
      @HiveField(15)
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      final DateTime? updatedAt}) = _$TransactionHistoryImpl;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  @HiveField(2)
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @HiveField(3)
  @StringToNumSerializer()
  num get amount;
  @override
  @HiveField(4)
  @StringToNumSerializer()
  @JsonKey(name: 'transaction_fee')
  num get transactionFee;
  @override
  @HiveField(5)
  Currency get currency;
  @override
  @HiveField(6)
  @JsonKey(name: 'transaction_type')
  @HiveField(7)
  TransactionType get transactionType;
  @override
  @HiveField(8)
  @JsonKey(name: 'transaction_category')
  ServiceCategory? get transactionCategory;
  @override
  @HiveField(9)
  @JsonKey(name: 'transaction_reference')
  String? get transactionReference;
  @override
  @HiveField(10)
  @JsonKey(name: 'beneficiary_name')
  String? get beneficiaryName;
  @override
  @HiveField(11)
  @JsonKey(name: 'extra_details')
  ExtraDetails? get extraDetails;
  @override
  @HiveField(12)
  String? get remarks;
  @override
  @HiveField(13)
  String? get status;
  @override
  @HiveField(14)
  @JsonKey(name: 'created_at')
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @HiveField(15)
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtraDetails _$ExtraDetailsFromJson(Map<String, dynamic> json) {
  return _ExtraDetails.fromJson(json);
}

/// @nodoc
mixin _$ExtraDetails {
  @HiveField(0)
  @JsonKey(name: 'sender_name')
  String? get senderName => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'sender_tag')
  @TagSerializer()
  String? get senderTag => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'receiver_tag')
  @TagSerializer()
  String? get receiverTag => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'receiver_picture')
  String? get receiverPicture => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(5)
  ServiceCategory? get category => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get subCategory => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  @HiveField(7)
  num get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtraDetailsCopyWith<ExtraDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraDetailsCopyWith<$Res> {
  factory $ExtraDetailsCopyWith(
          ExtraDetails value, $Res Function(ExtraDetails) then) =
      _$ExtraDetailsCopyWithImpl<$Res, ExtraDetails>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'sender_name') String? senderName,
      @HiveField(1)
      @JsonKey(name: 'sender_tag')
      @TagSerializer()
      String? senderTag,
      @HiveField(2)
      @JsonKey(name: 'receiver_tag')
      @TagSerializer()
      String? receiverTag,
      @HiveField(3) @JsonKey(name: 'receiver_picture') String? receiverPicture,
      @HiveField(4) String? phoneNumber,
      @HiveField(5) ServiceCategory? category,
      @HiveField(6) String? subCategory,
      @StringToNumSerializer() @HiveField(7) num amount});
}

/// @nodoc
class _$ExtraDetailsCopyWithImpl<$Res, $Val extends ExtraDetails>
    implements $ExtraDetailsCopyWith<$Res> {
  _$ExtraDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderName = freezed,
    Object? senderTag = freezed,
    Object? receiverTag = freezed,
    Object? receiverPicture = freezed,
    Object? phoneNumber = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderTag: freezed == senderTag
          ? _value.senderTag
          : senderTag // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverTag: freezed == receiverTag
          ? _value.receiverTag
          : receiverTag // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverPicture: freezed == receiverPicture
          ? _value.receiverPicture
          : receiverPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategory?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtraDetailsImplCopyWith<$Res>
    implements $ExtraDetailsCopyWith<$Res> {
  factory _$$ExtraDetailsImplCopyWith(
          _$ExtraDetailsImpl value, $Res Function(_$ExtraDetailsImpl) then) =
      __$$ExtraDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'sender_name') String? senderName,
      @HiveField(1)
      @JsonKey(name: 'sender_tag')
      @TagSerializer()
      String? senderTag,
      @HiveField(2)
      @JsonKey(name: 'receiver_tag')
      @TagSerializer()
      String? receiverTag,
      @HiveField(3) @JsonKey(name: 'receiver_picture') String? receiverPicture,
      @HiveField(4) String? phoneNumber,
      @HiveField(5) ServiceCategory? category,
      @HiveField(6) String? subCategory,
      @StringToNumSerializer() @HiveField(7) num amount});
}

/// @nodoc
class __$$ExtraDetailsImplCopyWithImpl<$Res>
    extends _$ExtraDetailsCopyWithImpl<$Res, _$ExtraDetailsImpl>
    implements _$$ExtraDetailsImplCopyWith<$Res> {
  __$$ExtraDetailsImplCopyWithImpl(
      _$ExtraDetailsImpl _value, $Res Function(_$ExtraDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderName = freezed,
    Object? senderTag = freezed,
    Object? receiverTag = freezed,
    Object? receiverPicture = freezed,
    Object? phoneNumber = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? amount = null,
  }) {
    return _then(_$ExtraDetailsImpl(
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderTag: freezed == senderTag
          ? _value.senderTag
          : senderTag // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverTag: freezed == receiverTag
          ? _value.receiverTag
          : receiverTag // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverPicture: freezed == receiverPicture
          ? _value.receiverPicture
          : receiverPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategory?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 18, adapterName: 'ExtraDetailsAdapter')
class _$ExtraDetailsImpl implements _ExtraDetails {
  _$ExtraDetailsImpl(
      {@HiveField(0) @JsonKey(name: 'sender_name') this.senderName,
      @HiveField(1)
      @JsonKey(name: 'sender_tag')
      @TagSerializer()
      this.senderTag,
      @HiveField(2)
      @JsonKey(name: 'receiver_tag')
      @TagSerializer()
      this.receiverTag,
      @HiveField(3) @JsonKey(name: 'receiver_picture') this.receiverPicture,
      @HiveField(4) this.phoneNumber,
      @HiveField(5) this.category,
      @HiveField(6) this.subCategory,
      @StringToNumSerializer() @HiveField(7) this.amount = 0});

  factory _$ExtraDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtraDetailsImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'sender_name')
  final String? senderName;
  @override
  @HiveField(1)
  @JsonKey(name: 'sender_tag')
  @TagSerializer()
  final String? senderTag;
  @override
  @HiveField(2)
  @JsonKey(name: 'receiver_tag')
  @TagSerializer()
  final String? receiverTag;
  @override
  @HiveField(3)
  @JsonKey(name: 'receiver_picture')
  final String? receiverPicture;
  @override
  @HiveField(4)
  final String? phoneNumber;
  @override
  @HiveField(5)
  final ServiceCategory? category;
  @override
  @HiveField(6)
  final String? subCategory;
  @override
  @JsonKey()
  @StringToNumSerializer()
  @HiveField(7)
  final num amount;

  @override
  String toString() {
    return 'ExtraDetails(senderName: $senderName, senderTag: $senderTag, receiverTag: $receiverTag, receiverPicture: $receiverPicture, phoneNumber: $phoneNumber, category: $category, subCategory: $subCategory, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraDetailsImpl &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderTag, senderTag) ||
                other.senderTag == senderTag) &&
            (identical(other.receiverTag, receiverTag) ||
                other.receiverTag == receiverTag) &&
            (identical(other.receiverPicture, receiverPicture) ||
                other.receiverPicture == receiverPicture) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, senderName, senderTag,
      receiverTag, receiverPicture, phoneNumber, category, subCategory, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraDetailsImplCopyWith<_$ExtraDetailsImpl> get copyWith =>
      __$$ExtraDetailsImplCopyWithImpl<_$ExtraDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtraDetailsImplToJson(
      this,
    );
  }
}

abstract class _ExtraDetails implements ExtraDetails {
  factory _ExtraDetails(
          {@HiveField(0) @JsonKey(name: 'sender_name') final String? senderName,
          @HiveField(1)
          @JsonKey(name: 'sender_tag')
          @TagSerializer()
          final String? senderTag,
          @HiveField(2)
          @JsonKey(name: 'receiver_tag')
          @TagSerializer()
          final String? receiverTag,
          @HiveField(3)
          @JsonKey(name: 'receiver_picture')
          final String? receiverPicture,
          @HiveField(4) final String? phoneNumber,
          @HiveField(5) final ServiceCategory? category,
          @HiveField(6) final String? subCategory,
          @StringToNumSerializer() @HiveField(7) final num amount}) =
      _$ExtraDetailsImpl;

  factory _ExtraDetails.fromJson(Map<String, dynamic> json) =
      _$ExtraDetailsImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'sender_name')
  String? get senderName;
  @override
  @HiveField(1)
  @JsonKey(name: 'sender_tag')
  @TagSerializer()
  String? get senderTag;
  @override
  @HiveField(2)
  @JsonKey(name: 'receiver_tag')
  @TagSerializer()
  String? get receiverTag;
  @override
  @HiveField(3)
  @JsonKey(name: 'receiver_picture')
  String? get receiverPicture;
  @override
  @HiveField(4)
  String? get phoneNumber;
  @override
  @HiveField(5)
  ServiceCategory? get category;
  @override
  @HiveField(6)
  String? get subCategory;
  @override
  @StringToNumSerializer()
  @HiveField(7)
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$ExtraDetailsImplCopyWith<_$ExtraDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
