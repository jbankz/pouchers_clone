// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountDetailsImpl _$$BankAccountDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountDetailsImpl(
      accountName: json['accountName'] as String?,
      counterPartyId: json['counterPartyId'] as String?,
      depositAccountId: json['depositAccountId'] as String?,
      bankCode: json['bankCode'] as String?,
      transactionFee: json['transactionFee'] as num? ?? 0,
    );

Map<String, dynamic> _$$BankAccountDetailsImplToJson(
        _$BankAccountDetailsImpl instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'counterPartyId': instance.counterPartyId,
      'depositAccountId': instance.depositAccountId,
      'bankCode': instance.bankCode,
      'transactionFee': instance.transactionFee,
    };
