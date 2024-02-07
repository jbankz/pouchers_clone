// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  String? get account => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  String? get nameEnquiryReference => throw _privateConstructorUsedError;
  String? get paymentReference => throw _privateConstructorUsedError;
  dynamic get mandateReference => throw _privateConstructorUsedError;
  bool? get isReversed => throw _privateConstructorUsedError;
  dynamic get reversalReference => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get providerChannel => throw _privateConstructorUsedError;
  String? get providerChannelCode => throw _privateConstructorUsedError;
  String? get destinationInstitutionCode => throw _privateConstructorUsedError;
  String? get creditAccountName => throw _privateConstructorUsedError;
  String? get creditAccountNumber => throw _privateConstructorUsedError;
  dynamic get creditBankVerificationNumber =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'creditKYCLevel')
  String? get creditKycLevel => throw _privateConstructorUsedError;
  String? get debitAccountName => throw _privateConstructorUsedError;
  String? get debitAccountNumber => throw _privateConstructorUsedError;
  dynamic get debitBankVerificationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'debitKYCLevel')
  String? get debitKycLevel => throw _privateConstructorUsedError;
  String? get transactionLocation => throw _privateConstructorUsedError;
  String? get narration => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  int? get fees => throw _privateConstructorUsedError;
  int? get vat => throw _privateConstructorUsedError;
  int? get stampDuty => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String? get approvedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? client,
      String? account,
      String? type,
      String? sessionId,
      String? nameEnquiryReference,
      String? paymentReference,
      dynamic mandateReference,
      bool? isReversed,
      dynamic reversalReference,
      String? provider,
      String? providerChannel,
      String? providerChannelCode,
      String? destinationInstitutionCode,
      String? creditAccountName,
      String? creditAccountNumber,
      dynamic creditBankVerificationNumber,
      @JsonKey(name: 'creditKYCLevel') String? creditKycLevel,
      String? debitAccountName,
      String? debitAccountNumber,
      dynamic debitBankVerificationNumber,
      @JsonKey(name: 'debitKYCLevel') String? debitKycLevel,
      String? transactionLocation,
      String? narration,
      int? amount,
      int? fees,
      int? vat,
      int? stampDuty,
      String? responseCode,
      String? responseMessage,
      String? status,
      bool? isDeleted,
      DateTime? createdAt,
      String? createdBy,
      DateTime? updatedAt,
      @JsonKey(name: '__v') int? v,
      DateTime? approvedAt,
      String? approvedBy});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? client = freezed,
    Object? account = freezed,
    Object? type = freezed,
    Object? sessionId = freezed,
    Object? nameEnquiryReference = freezed,
    Object? paymentReference = freezed,
    Object? mandateReference = freezed,
    Object? isReversed = freezed,
    Object? reversalReference = freezed,
    Object? provider = freezed,
    Object? providerChannel = freezed,
    Object? providerChannelCode = freezed,
    Object? destinationInstitutionCode = freezed,
    Object? creditAccountName = freezed,
    Object? creditAccountNumber = freezed,
    Object? creditBankVerificationNumber = freezed,
    Object? creditKycLevel = freezed,
    Object? debitAccountName = freezed,
    Object? debitAccountNumber = freezed,
    Object? debitBankVerificationNumber = freezed,
    Object? debitKycLevel = freezed,
    Object? transactionLocation = freezed,
    Object? narration = freezed,
    Object? amount = freezed,
    Object? fees = freezed,
    Object? vat = freezed,
    Object? stampDuty = freezed,
    Object? responseCode = freezed,
    Object? responseMessage = freezed,
    Object? status = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEnquiryReference: freezed == nameEnquiryReference
          ? _value.nameEnquiryReference
          : nameEnquiryReference // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      mandateReference: freezed == mandateReference
          ? _value.mandateReference
          : mandateReference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isReversed: freezed == isReversed
          ? _value.isReversed
          : isReversed // ignore: cast_nullable_to_non_nullable
              as bool?,
      reversalReference: freezed == reversalReference
          ? _value.reversalReference
          : reversalReference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerChannel: freezed == providerChannel
          ? _value.providerChannel
          : providerChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      providerChannelCode: freezed == providerChannelCode
          ? _value.providerChannelCode
          : providerChannelCode // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationInstitutionCode: freezed == destinationInstitutionCode
          ? _value.destinationInstitutionCode
          : destinationInstitutionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      creditAccountName: freezed == creditAccountName
          ? _value.creditAccountName
          : creditAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      creditAccountNumber: freezed == creditAccountNumber
          ? _value.creditAccountNumber
          : creditAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      creditBankVerificationNumber: freezed == creditBankVerificationNumber
          ? _value.creditBankVerificationNumber
          : creditBankVerificationNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      creditKycLevel: freezed == creditKycLevel
          ? _value.creditKycLevel
          : creditKycLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      debitAccountName: freezed == debitAccountName
          ? _value.debitAccountName
          : debitAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      debitAccountNumber: freezed == debitAccountNumber
          ? _value.debitAccountNumber
          : debitAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      debitBankVerificationNumber: freezed == debitBankVerificationNumber
          ? _value.debitBankVerificationNumber
          : debitBankVerificationNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      debitKycLevel: freezed == debitKycLevel
          ? _value.debitKycLevel
          : debitKycLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionLocation: freezed == transactionLocation
          ? _value.transactionLocation
          : transactionLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      narration: freezed == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as int?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int?,
      stampDuty: freezed == stampDuty
          ? _value.stampDuty
          : stampDuty // ignore: cast_nullable_to_non_nullable
              as int?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? client,
      String? account,
      String? type,
      String? sessionId,
      String? nameEnquiryReference,
      String? paymentReference,
      dynamic mandateReference,
      bool? isReversed,
      dynamic reversalReference,
      String? provider,
      String? providerChannel,
      String? providerChannelCode,
      String? destinationInstitutionCode,
      String? creditAccountName,
      String? creditAccountNumber,
      dynamic creditBankVerificationNumber,
      @JsonKey(name: 'creditKYCLevel') String? creditKycLevel,
      String? debitAccountName,
      String? debitAccountNumber,
      dynamic debitBankVerificationNumber,
      @JsonKey(name: 'debitKYCLevel') String? debitKycLevel,
      String? transactionLocation,
      String? narration,
      int? amount,
      int? fees,
      int? vat,
      int? stampDuty,
      String? responseCode,
      String? responseMessage,
      String? status,
      bool? isDeleted,
      DateTime? createdAt,
      String? createdBy,
      DateTime? updatedAt,
      @JsonKey(name: '__v') int? v,
      DateTime? approvedAt,
      String? approvedBy});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? client = freezed,
    Object? account = freezed,
    Object? type = freezed,
    Object? sessionId = freezed,
    Object? nameEnquiryReference = freezed,
    Object? paymentReference = freezed,
    Object? mandateReference = freezed,
    Object? isReversed = freezed,
    Object? reversalReference = freezed,
    Object? provider = freezed,
    Object? providerChannel = freezed,
    Object? providerChannelCode = freezed,
    Object? destinationInstitutionCode = freezed,
    Object? creditAccountName = freezed,
    Object? creditAccountNumber = freezed,
    Object? creditBankVerificationNumber = freezed,
    Object? creditKycLevel = freezed,
    Object? debitAccountName = freezed,
    Object? debitAccountNumber = freezed,
    Object? debitBankVerificationNumber = freezed,
    Object? debitKycLevel = freezed,
    Object? transactionLocation = freezed,
    Object? narration = freezed,
    Object? amount = freezed,
    Object? fees = freezed,
    Object? vat = freezed,
    Object? stampDuty = freezed,
    Object? responseCode = freezed,
    Object? responseMessage = freezed,
    Object? status = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
  }) {
    return _then(_$DataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEnquiryReference: freezed == nameEnquiryReference
          ? _value.nameEnquiryReference
          : nameEnquiryReference // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      mandateReference: freezed == mandateReference
          ? _value.mandateReference
          : mandateReference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isReversed: freezed == isReversed
          ? _value.isReversed
          : isReversed // ignore: cast_nullable_to_non_nullable
              as bool?,
      reversalReference: freezed == reversalReference
          ? _value.reversalReference
          : reversalReference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerChannel: freezed == providerChannel
          ? _value.providerChannel
          : providerChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      providerChannelCode: freezed == providerChannelCode
          ? _value.providerChannelCode
          : providerChannelCode // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationInstitutionCode: freezed == destinationInstitutionCode
          ? _value.destinationInstitutionCode
          : destinationInstitutionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      creditAccountName: freezed == creditAccountName
          ? _value.creditAccountName
          : creditAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      creditAccountNumber: freezed == creditAccountNumber
          ? _value.creditAccountNumber
          : creditAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      creditBankVerificationNumber: freezed == creditBankVerificationNumber
          ? _value.creditBankVerificationNumber
          : creditBankVerificationNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      creditKycLevel: freezed == creditKycLevel
          ? _value.creditKycLevel
          : creditKycLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      debitAccountName: freezed == debitAccountName
          ? _value.debitAccountName
          : debitAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      debitAccountNumber: freezed == debitAccountNumber
          ? _value.debitAccountNumber
          : debitAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      debitBankVerificationNumber: freezed == debitBankVerificationNumber
          ? _value.debitBankVerificationNumber
          : debitBankVerificationNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      debitKycLevel: freezed == debitKycLevel
          ? _value.debitKycLevel
          : debitKycLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionLocation: freezed == transactionLocation
          ? _value.transactionLocation
          : transactionLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      narration: freezed == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as int?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int?,
      stampDuty: freezed == stampDuty
          ? _value.stampDuty
          : stampDuty // ignore: cast_nullable_to_non_nullable
              as int?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  _$DataImpl(
      {@JsonKey(name: '_id') this.id,
      this.client,
      this.account,
      this.type,
      this.sessionId,
      this.nameEnquiryReference,
      this.paymentReference,
      this.mandateReference,
      this.isReversed,
      this.reversalReference,
      this.provider,
      this.providerChannel,
      this.providerChannelCode,
      this.destinationInstitutionCode,
      this.creditAccountName,
      this.creditAccountNumber,
      this.creditBankVerificationNumber,
      @JsonKey(name: 'creditKYCLevel') this.creditKycLevel,
      this.debitAccountName,
      this.debitAccountNumber,
      this.debitBankVerificationNumber,
      @JsonKey(name: 'debitKYCLevel') this.debitKycLevel,
      this.transactionLocation,
      this.narration,
      this.amount,
      this.fees,
      this.vat,
      this.stampDuty,
      this.responseCode,
      this.responseMessage,
      this.status,
      this.isDeleted,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      @JsonKey(name: '__v') this.v,
      this.approvedAt,
      this.approvedBy});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? client;
  @override
  final String? account;
  @override
  final String? type;
  @override
  final String? sessionId;
  @override
  final String? nameEnquiryReference;
  @override
  final String? paymentReference;
  @override
  final dynamic mandateReference;
  @override
  final bool? isReversed;
  @override
  final dynamic reversalReference;
  @override
  final String? provider;
  @override
  final String? providerChannel;
  @override
  final String? providerChannelCode;
  @override
  final String? destinationInstitutionCode;
  @override
  final String? creditAccountName;
  @override
  final String? creditAccountNumber;
  @override
  final dynamic creditBankVerificationNumber;
  @override
  @JsonKey(name: 'creditKYCLevel')
  final String? creditKycLevel;
  @override
  final String? debitAccountName;
  @override
  final String? debitAccountNumber;
  @override
  final dynamic debitBankVerificationNumber;
  @override
  @JsonKey(name: 'debitKYCLevel')
  final String? debitKycLevel;
  @override
  final String? transactionLocation;
  @override
  final String? narration;
  @override
  final int? amount;
  @override
  final int? fees;
  @override
  final int? vat;
  @override
  final int? stampDuty;
  @override
  final String? responseCode;
  @override
  final String? responseMessage;
  @override
  final String? status;
  @override
  final bool? isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final String? createdBy;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: '__v')
  final int? v;
  @override
  final DateTime? approvedAt;
  @override
  final String? approvedBy;

  @override
  String toString() {
    return 'Data(id: $id, client: $client, account: $account, type: $type, sessionId: $sessionId, nameEnquiryReference: $nameEnquiryReference, paymentReference: $paymentReference, mandateReference: $mandateReference, isReversed: $isReversed, reversalReference: $reversalReference, provider: $provider, providerChannel: $providerChannel, providerChannelCode: $providerChannelCode, destinationInstitutionCode: $destinationInstitutionCode, creditAccountName: $creditAccountName, creditAccountNumber: $creditAccountNumber, creditBankVerificationNumber: $creditBankVerificationNumber, creditKycLevel: $creditKycLevel, debitAccountName: $debitAccountName, debitAccountNumber: $debitAccountNumber, debitBankVerificationNumber: $debitBankVerificationNumber, debitKycLevel: $debitKycLevel, transactionLocation: $transactionLocation, narration: $narration, amount: $amount, fees: $fees, vat: $vat, stampDuty: $stampDuty, responseCode: $responseCode, responseMessage: $responseMessage, status: $status, isDeleted: $isDeleted, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, v: $v, approvedAt: $approvedAt, approvedBy: $approvedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.nameEnquiryReference, nameEnquiryReference) ||
                other.nameEnquiryReference == nameEnquiryReference) &&
            (identical(other.paymentReference, paymentReference) ||
                other.paymentReference == paymentReference) &&
            const DeepCollectionEquality()
                .equals(other.mandateReference, mandateReference) &&
            (identical(other.isReversed, isReversed) ||
                other.isReversed == isReversed) &&
            const DeepCollectionEquality()
                .equals(other.reversalReference, reversalReference) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerChannel, providerChannel) ||
                other.providerChannel == providerChannel) &&
            (identical(other.providerChannelCode, providerChannelCode) ||
                other.providerChannelCode == providerChannelCode) &&
            (identical(other.destinationInstitutionCode,
                    destinationInstitutionCode) ||
                other.destinationInstitutionCode ==
                    destinationInstitutionCode) &&
            (identical(other.creditAccountName, creditAccountName) ||
                other.creditAccountName == creditAccountName) &&
            (identical(other.creditAccountNumber, creditAccountNumber) ||
                other.creditAccountNumber == creditAccountNumber) &&
            const DeepCollectionEquality().equals(
                other.creditBankVerificationNumber,
                creditBankVerificationNumber) &&
            (identical(other.creditKycLevel, creditKycLevel) ||
                other.creditKycLevel == creditKycLevel) &&
            (identical(other.debitAccountName, debitAccountName) ||
                other.debitAccountName == debitAccountName) &&
            (identical(other.debitAccountNumber, debitAccountNumber) ||
                other.debitAccountNumber == debitAccountNumber) &&
            const DeepCollectionEquality().equals(
                other.debitBankVerificationNumber,
                debitBankVerificationNumber) &&
            (identical(other.debitKycLevel, debitKycLevel) ||
                other.debitKycLevel == debitKycLevel) &&
            (identical(other.transactionLocation, transactionLocation) ||
                other.transactionLocation == transactionLocation) &&
            (identical(other.narration, narration) ||
                other.narration == narration) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.stampDuty, stampDuty) ||
                other.stampDuty == stampDuty) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        client,
        account,
        type,
        sessionId,
        nameEnquiryReference,
        paymentReference,
        const DeepCollectionEquality().hash(mandateReference),
        isReversed,
        const DeepCollectionEquality().hash(reversalReference),
        provider,
        providerChannel,
        providerChannelCode,
        destinationInstitutionCode,
        creditAccountName,
        creditAccountNumber,
        const DeepCollectionEquality().hash(creditBankVerificationNumber),
        creditKycLevel,
        debitAccountName,
        debitAccountNumber,
        const DeepCollectionEquality().hash(debitBankVerificationNumber),
        debitKycLevel,
        transactionLocation,
        narration,
        amount,
        fees,
        vat,
        stampDuty,
        responseCode,
        responseMessage,
        status,
        isDeleted,
        createdAt,
        createdBy,
        updatedAt,
        v,
        approvedAt,
        approvedBy
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {@JsonKey(name: '_id') final String? id,
      final String? client,
      final String? account,
      final String? type,
      final String? sessionId,
      final String? nameEnquiryReference,
      final String? paymentReference,
      final dynamic mandateReference,
      final bool? isReversed,
      final dynamic reversalReference,
      final String? provider,
      final String? providerChannel,
      final String? providerChannelCode,
      final String? destinationInstitutionCode,
      final String? creditAccountName,
      final String? creditAccountNumber,
      final dynamic creditBankVerificationNumber,
      @JsonKey(name: 'creditKYCLevel') final String? creditKycLevel,
      final String? debitAccountName,
      final String? debitAccountNumber,
      final dynamic debitBankVerificationNumber,
      @JsonKey(name: 'debitKYCLevel') final String? debitKycLevel,
      final String? transactionLocation,
      final String? narration,
      final int? amount,
      final int? fees,
      final int? vat,
      final int? stampDuty,
      final String? responseCode,
      final String? responseMessage,
      final String? status,
      final bool? isDeleted,
      final DateTime? createdAt,
      final String? createdBy,
      final DateTime? updatedAt,
      @JsonKey(name: '__v') final int? v,
      final DateTime? approvedAt,
      final String? approvedBy}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get client;
  @override
  String? get account;
  @override
  String? get type;
  @override
  String? get sessionId;
  @override
  String? get nameEnquiryReference;
  @override
  String? get paymentReference;
  @override
  dynamic get mandateReference;
  @override
  bool? get isReversed;
  @override
  dynamic get reversalReference;
  @override
  String? get provider;
  @override
  String? get providerChannel;
  @override
  String? get providerChannelCode;
  @override
  String? get destinationInstitutionCode;
  @override
  String? get creditAccountName;
  @override
  String? get creditAccountNumber;
  @override
  dynamic get creditBankVerificationNumber;
  @override
  @JsonKey(name: 'creditKYCLevel')
  String? get creditKycLevel;
  @override
  String? get debitAccountName;
  @override
  String? get debitAccountNumber;
  @override
  dynamic get debitBankVerificationNumber;
  @override
  @JsonKey(name: 'debitKYCLevel')
  String? get debitKycLevel;
  @override
  String? get transactionLocation;
  @override
  String? get narration;
  @override
  int? get amount;
  @override
  int? get fees;
  @override
  int? get vat;
  @override
  int? get stampDuty;
  @override
  String? get responseCode;
  @override
  String? get responseMessage;
  @override
  String? get status;
  @override
  bool? get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  String? get createdBy;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: '__v')
  int? get v;
  @override
  DateTime? get approvedAt;
  @override
  String? get approvedBy;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
