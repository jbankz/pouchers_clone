// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      amount: json['amount'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['amount']),
      recipient: json['recipient'] as String?,
      category: $enumDecodeNullable(_$ServiceCategoryEnumMap, json['category']),
      scheduleId: json['schedule_id'] as String?,
      subCategory: json['sub_category'] as String?,
      frequency: json['frequency'] as String?,
      bankName: json['bank_name'] as String?,
      beneficiaryAccountName: json['beneficiary_account_name'] as String?,
      currentProvider: json['current_provider'] as String?,
      status: json['status'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'amount': const StringToNumSerializer().toJson(instance.amount),
      'recipient': instance.recipient,
      'category': _$ServiceCategoryEnumMap[instance.category],
      'schedule_id': instance.scheduleId,
      'sub_category': instance.subCategory,
      'frequency': instance.frequency,
      'bank_name': instance.bankName,
      'beneficiary_account_name': instance.beneficiaryAccountName,
      'current_provider': instance.currentProvider,
      'status': instance.status,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
    };

const _$ServiceCategoryEnumMap = {
  ServiceCategory.airtime: 'airtime-purchase',
  ServiceCategory.data: 'data-purchase',
  ServiceCategory.cable: 'cable-purchase',
  ServiceCategory.electricity: 'electricity-purchase',
  ServiceCategory.betting: 'betting-purchase',
  ServiceCategory.voucherPurchase: 'voucher-purchase',
  ServiceCategory.education: 'education-purchase',
  ServiceCategory.internet: 'internet-purchase',
  ServiceCategory.p2p: 'p2p-transfer',
  ServiceCategory.voucherRedeem: 'voucher-redeem',
  ServiceCategory.fundWallet: 'fund-wallet',
  ServiceCategory.createVirtualCard: 'create-virtual-card',
  ServiceCategory.fundVirtualCard: 'fund-virtual-card',
  ServiceCategory.localBankTransfer: 'local-bank-transfer',
  ServiceCategory.adminDebitWallet: 'admin-debit-wallet',
  ServiceCategory.adminCreditWallet: 'admin-credit-wallet',
  ServiceCategory.referralBonusPayment: 'referral-bonus-payment',
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
