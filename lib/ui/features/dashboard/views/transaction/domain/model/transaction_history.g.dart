// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionHistoryAdapter extends TypeAdapter<TransactionHistory> {
  @override
  final int typeId = 17;

  @override
  TransactionHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionHistory(
      transactionId: fields[0] as String?,
      userId: fields[2] as String?,
      amount: fields[3] as num,
      transactionFee: fields[4] as num,
      currency: fields[5] as Currency,
      transactionType: fields[6] as TransactionType,
      transactionCategory: fields[8] as ServiceCategory?,
      transactionReference: fields[9] as String?,
      beneficiaryName: fields[10] as String?,
      extraDetails: fields[11] as ExtraDetails?,
      remarks: fields[12] as String?,
      status: fields[13] as String?,
      createdAt: fields[14] as DateTime?,
      updatedAt: fields[15] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionHistory obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.transactionId)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.transactionFee)
      ..writeByte(5)
      ..write(obj.currency)
      ..writeByte(6)
      ..write(obj.transactionType)
      ..writeByte(8)
      ..write(obj.transactionCategory)
      ..writeByte(9)
      ..write(obj.transactionReference)
      ..writeByte(10)
      ..write(obj.beneficiaryName)
      ..writeByte(11)
      ..write(obj.extraDetails)
      ..writeByte(12)
      ..write(obj.remarks)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExtraDetailsAdapter extends TypeAdapter<ExtraDetails> {
  @override
  final int typeId = 18;

  @override
  ExtraDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtraDetails(
      senderName: fields[0] as String?,
      senderTag: fields[1] as String?,
      receiverTag: fields[2] as String?,
      receiverPicture: fields[3] as String?,
      phoneNumber: fields[4] as String?,
      category: fields[5] as ServiceCategory?,
      subCategory: fields[6] as String?,
      amount: fields[7] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ExtraDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.senderName)
      ..writeByte(1)
      ..write(obj.senderTag)
      ..writeByte(2)
      ..write(obj.receiverTag)
      ..writeByte(3)
      ..write(obj.receiverPicture)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.subCategory)
      ..writeByte(7)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtraDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryImpl _$$TransactionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryImpl(
      transactionId: json['transaction_id'] as String?,
      userId: json['user_id'] as String?,
      amount: json['amount'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['amount']),
      transactionFee: json['transaction_fee'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['transaction_fee']),
      currency: $enumDecodeNullable(_$CurrencyEnumMap, json['currency']) ??
          Currency.NGN,
      transactionType: $enumDecodeNullable(
              _$TransactionTypeEnumMap, json['transaction_type']) ??
          TransactionType.debit,
      transactionCategory: $enumDecodeNullable(
          _$ServiceCategoryEnumMap, json['transaction_category']),
      transactionReference: json['transaction_reference'] as String?,
      beneficiaryName: json['beneficiary_name'] as String?,
      extraDetails: json['extra_details'] == null
          ? null
          : ExtraDetails.fromJson(
              json['extra_details'] as Map<String, dynamic>),
      remarks: json['remarks'] as String?,
      status: json['status'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeSerializer().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeSerializer().fromJson),
    );

Map<String, dynamic> _$$TransactionHistoryImplToJson(
        _$TransactionHistoryImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'user_id': instance.userId,
      'amount': const StringToNumSerializer().toJson(instance.amount),
      'transaction_fee':
          const StringToNumSerializer().toJson(instance.transactionFee),
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'transaction_type': _$TransactionTypeEnumMap[instance.transactionType]!,
      'transaction_category':
          _$ServiceCategoryEnumMap[instance.transactionCategory],
      'transaction_reference': instance.transactionReference,
      'beneficiary_name': instance.beneficiaryName,
      'extra_details': instance.extraDetails,
      'remarks': instance.remarks,
      'status': instance.status,
      'created_at': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeSerializer().toJson),
      'updated_at': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeSerializer().toJson),
    };

const _$CurrencyEnumMap = {
  Currency.NGN: 'NGN',
  Currency.USD: 'USD',
};

const _$TransactionTypeEnumMap = {
  TransactionType.debit: 'debit',
  TransactionType.credit: 'credit',
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
  ServiceCategory.moneyRequest: 'money-request',
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

_$ExtraDetailsImpl _$$ExtraDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ExtraDetailsImpl(
      senderName: json['sender_name'] as String?,
      senderTag: _$JsonConverterFromJson<String, String>(
          json['sender_tag'], const TagSerializer().fromJson),
      receiverTag: _$JsonConverterFromJson<String, String>(
          json['receiver_tag'], const TagSerializer().fromJson),
      receiverPicture: json['receiver_picture'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      category: $enumDecodeNullable(_$ServiceCategoryEnumMap, json['category']),
      subCategory: json['subCategory'] as String?,
      amount: json['amount'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['amount']),
    );

Map<String, dynamic> _$$ExtraDetailsImplToJson(_$ExtraDetailsImpl instance) =>
    <String, dynamic>{
      'sender_name': instance.senderName,
      'sender_tag': _$JsonConverterToJson<String, String>(
          instance.senderTag, const TagSerializer().toJson),
      'receiver_tag': _$JsonConverterToJson<String, String>(
          instance.receiverTag, const TagSerializer().toJson),
      'receiver_picture': instance.receiverPicture,
      'phoneNumber': instance.phoneNumber,
      'category': _$ServiceCategoryEnumMap[instance.category],
      'subCategory': instance.subCategory,
      'amount': const StringToNumSerializer().toJson(instance.amount),
    };
