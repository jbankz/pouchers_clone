import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'fund_virtual_account.freezed.dart';
part 'fund_virtual_account.g.dart';

@freezed
class FundVirtualAccount with _$FundVirtualAccount {
  factory FundVirtualAccount({
    String? status,
    String? message,
    int? code,
    Data? data,
  }) = _FundVirtualAccount;

  factory FundVirtualAccount.fromJson(Map<String, dynamic> json) =>
      _$FundVirtualAccountFromJson(json);
}
