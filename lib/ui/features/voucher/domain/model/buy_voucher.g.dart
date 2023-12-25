// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuyVoucherImpl _$$BuyVoucherImplFromJson(Map<String, dynamic> json) =>
    _$BuyVoucherImpl(
      voucherid: json['voucher_id'] as String?,
      amount: json['amount'] as num? ?? 0,
      voucherCode: json['voucher_code'] as String?,
    );

Map<String, dynamic> _$$BuyVoucherImplToJson(_$BuyVoucherImpl instance) =>
    <String, dynamic>{
      'voucher_id': instance.voucherid,
      'amount': instance.amount,
      'voucher_code': instance.voucherCode,
    };
