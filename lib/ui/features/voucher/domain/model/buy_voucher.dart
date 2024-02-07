import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_voucher.freezed.dart';
part 'buy_voucher.g.dart';

@freezed
class BuyVoucher with _$BuyVoucher {
  factory BuyVoucher(
      {@JsonKey(name: 'voucher_id') String? voucherid,
      @Default(0) num amount,
      @JsonKey(name: 'voucher_code') String? voucherCode}) = _BuyVoucher;

  factory BuyVoucher.fromJson(Map<String, dynamic> json) =>
      _$BuyVoucherFromJson(json);
}
