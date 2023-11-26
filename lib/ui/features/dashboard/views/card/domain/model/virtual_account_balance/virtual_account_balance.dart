import 'package:freezed_annotation/freezed_annotation.dart';

part 'virtual_account_balance.freezed.dart';
part 'virtual_account_balance.g.dart';

@freezed
class VirtualAccountBalance with _$VirtualAccountBalance {
  factory VirtualAccountBalance({num? currentBalance, num? availableBalance}) =
      _VirtualAccountBalance;

  factory VirtualAccountBalance.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountBalanceFromJson(json);
}
