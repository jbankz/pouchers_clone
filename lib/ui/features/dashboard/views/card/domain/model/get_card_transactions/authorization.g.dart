// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorizationImpl _$$AuthorizationImplFromJson(Map<String, dynamic> json) =>
    _$AuthorizationImpl(
      id: json['_id'] as String?,
      business: json['business'] as String?,
      customer: json['customer'] as String?,
      account: json['account'] as String?,
      card: json['card'] as String?,
      amount: json['amount'] as int?,
      fee: json['fee'] as int?,
      vat: json['vat'] as int?,
      approved: json['approved'] as bool?,
      currency: json['currency'] as String?,
      status: json['status'] as String?,
      authorizationMethod: json['authorizationMethod'] as String?,
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
      pendingRequest: json['pendingRequest'],
      requestHistory: (json['requestHistory'] as List<dynamic>?)
          ?.map((e) => RequestHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      verification: json['verification'] == null
          ? null
          : Verification.fromJson(json['verification'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$AuthorizationImplToJson(_$AuthorizationImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'customer': instance.customer,
      'account': instance.account,
      'card': instance.card,
      'amount': instance.amount,
      'fee': instance.fee,
      'vat': instance.vat,
      'approved': instance.approved,
      'currency': instance.currency,
      'status': instance.status,
      'authorizationMethod': instance.authorizationMethod,
      'balanceTransactions': instance.balanceTransactions,
      'merchantAmount': instance.merchantAmount,
      'merchantCurrency': instance.merchantCurrency,
      'merchant': instance.merchant,
      'terminal': instance.terminal,
      'transactionMetadata': instance.transactionMetadata,
      'pendingRequest': instance.pendingRequest,
      'requestHistory': instance.requestHistory,
      'verification': instance.verification,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'feeDetails': instance.feeDetails,
      '__v': instance.v,
    };
