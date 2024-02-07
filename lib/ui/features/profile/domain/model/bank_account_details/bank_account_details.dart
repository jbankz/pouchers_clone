import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_details.freezed.dart';
part 'bank_account_details.g.dart';

@freezed
class BankAccountDetails with _$BankAccountDetails {
  factory BankAccountDetails(
      {String? accountName,
      @JsonKey(name: 'counterPartyId') String? counterPartyId,
      @JsonKey(name: 'depositAccountId') String? depositAccountId,
      @JsonKey(name: 'bankCode') String? bankCode,
      @Default(0) num transactionFee}) = _BankAccountDetails;

  factory BankAccountDetails.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDetailsFromJson(json);
}
