// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      authorization: json['authorization'] == null
          ? null
          : Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>),
      amount: json['amount'] as int?,
      fee: json['fee'] as int?,
      vat: json['vat'] as int?,
      currency: json['currency'] as String?,
      type: json['type'] as String?,
      balanceTransactions: json['balanceTransactions'] as List<dynamic>?,
      merchantAmount: json['merchantAmount'] as int?,
      merchantCurrency: json['merchantCurrency'] as String?,
      merchant: json['merchant'] == null
          ? null
          : Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
      terminal: json['terminal'] == null
          ? null
          : Terminal.fromJson(json['terminal'] as Map<String, dynamic>),
      transactionMetadata: json['transactionMetadata'] == null
          ? null
          : TransactionMetadata.fromJson(
              json['transactionMetadata'] as Map<String, dynamic>),
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      feeDetails: (json['feeDetails'] as List<dynamic>?)
          ?.map((e) => FeeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'customer': instance.customer,
      'account': instance.account,
      'card': instance.card,
      'authorization': instance.authorization,
      'amount': instance.amount,
      'fee': instance.fee,
      'vat': instance.vat,
      'currency': instance.currency,
      'type': instance.type,
      'balanceTransactions': instance.balanceTransactions,
      'merchantAmount': instance.merchantAmount,
      'merchantCurrency': instance.merchantCurrency,
      'merchant': instance.merchant,
      'terminal': instance.terminal,
      'transactionMetadata': instance.transactionMetadata,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'feeDetails': instance.feeDetails,
      '__v': instance.v,
    };
