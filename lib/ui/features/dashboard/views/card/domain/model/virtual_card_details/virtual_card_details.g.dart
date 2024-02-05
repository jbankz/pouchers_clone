// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_card_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VirtualCardDetailsImpl _$$VirtualCardDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualCardDetailsImpl(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      brand: $enumDecodeNullable(_$CardBrandEnumMap, json['brand']),
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
      maskedPan: json['maskedPan'] as String?,
      expiryMonth: json['expiryMonth'] as String?,
      expiryYear: json['expiryYear'] as String?,
      status: $enumDecodeNullable(_$CardStatusEnumMap, json['status']) ??
          CardStatus.active,
      is2FAEnrolled: json['is2FAEnrolled'] as bool? ?? false,
      isDefaultPINChanged: json['isDefaultPINChanged'] as bool? ?? false,
      disposable: json['disposable'] as bool? ?? false,
      refundAccount: json['refundAccount'] as String?,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      fundingSource: json['fundingSource'] == null
          ? null
          : FundingSource.fromJson(
              json['fundingSource'] as Map<String, dynamic>),
      cvv2: json['cvv2'] as String?,
    );

Map<String, dynamic> _$$VirtualCardDetailsImplToJson(
        _$VirtualCardDetailsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'brand': _$CardBrandEnumMap[instance.brand],
      'currency': _$CurrencyEnumMap[instance.currency],
      'maskedPan': instance.maskedPan,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'status': _$CardStatusEnumMap[instance.status],
      'is2FAEnrolled': instance.is2FAEnrolled,
      'isDefaultPINChanged': instance.isDefaultPINChanged,
      'disposable': instance.disposable,
      'refundAccount': instance.refundAccount,
      'isDeleted': instance.isDeleted,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
      'customer': instance.customer,
      'account': instance.account,
      'fundingSource': instance.fundingSource,
      'cvv2': instance.cvv2,
    };

const _$CardBrandEnumMap = {
  CardBrand.verve: 'Verve',
  CardBrand.visa: 'Visa',
  CardBrand.masterCard: 'MasterCard',
};

const _$CurrencyEnumMap = {
  Currency.NGN: 'NGN',
  Currency.USD: 'USD',
};

const _$CardStatusEnumMap = {
  CardStatus.active: 'active',
  CardStatus.inactive: 'inactive',
  CardStatus.success: 'success',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emailAddress: json['emailAddress'] as String?,
      status: json['status'] as String?,
      individual: json['individual'] == null
          ? null
          : Individual.fromJson(json['individual'] as Map<String, dynamic>),
      billingAddress: json['billingAddress'] == null
          ? null
          : BillingAddress.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'type': instance.type,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'status': instance.status,
      'individual': instance.individual,
      'billingAddress': instance.billingAddress,
      'isDeleted': instance.isDeleted,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
    };

_$IndividualImpl _$$IndividualImplFromJson(Map<String, dynamic> json) =>
    _$IndividualImpl(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      identity: json['identity'] == null
          ? null
          : Identity.fromJson(json['identity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IndividualImplToJson(_$IndividualImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'identity': instance.identity,
    };

_$IdentityImpl _$$IdentityImplFromJson(Map<String, dynamic> json) =>
    _$IdentityImpl(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      number: json['number'] as String?,
    );

Map<String, dynamic> _$$IdentityImplToJson(_$IdentityImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'number': instance.number,
    };

_$BillingAddressImpl _$$BillingAddressImplFromJson(Map<String, dynamic> json) =>
    _$BillingAddressImpl(
      id: json['_id'] as String?,
      line1: json['line1'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$$BillingAddressImplToJson(
        _$BillingAddressImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'line1': instance.line1,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      type: json['type'] as String?,
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']) ??
          Currency.NGN,
      accountName: json['accountName'] as String?,
      bankCode: json['bankCode'] as String?,
      accountType: json['accountType'] as String?,
      accountNumber: json['accountNumber'] as String?,
      currentBalance: json['currentBalance'] as num? ?? 0,
      availableBalance: json['availableBalance'] as num? ?? 0,
      provider: json['provider'] as String?,
      providerReference: json['providerReference'] as String?,
      referenceCode: json['referenceCode'] as String?,
      reloadable: json['reloadable'] as bool? ?? false,
      isDefault: json['isDefault'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
      charges: json['charges'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'type': instance.type,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'accountName': instance.accountName,
      'bankCode': instance.bankCode,
      'accountType': instance.accountType,
      'accountNumber': instance.accountNumber,
      'currentBalance': instance.currentBalance,
      'availableBalance': instance.availableBalance,
      'provider': instance.provider,
      'providerReference': instance.providerReference,
      'referenceCode': instance.referenceCode,
      'reloadable': instance.reloadable,
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
      'charges': instance.charges,
    };

_$FundingSourceImpl _$$FundingSourceImplFromJson(Map<String, dynamic> json) =>
    _$FundingSourceImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      jitGateway: json['jitGateway'],
      isDefault: json['isDefault'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
    );

Map<String, dynamic> _$$FundingSourceImplToJson(_$FundingSourceImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'type': instance.type,
      'status': instance.status,
      'jitGateway': instance.jitGateway,
      'isDefault': instance.isDefault,
      'isDeleted': instance.isDeleted,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
    };
