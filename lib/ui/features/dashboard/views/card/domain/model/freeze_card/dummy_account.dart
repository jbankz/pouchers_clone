import 'package:freezed_annotation/freezed_annotation.dart';

part 'dummy_account.freezed.dart';
part 'dummy_account.g.dart';

@freezed
class DummyAccount with _$DummyAccount {
  factory DummyAccount({
    String? currency,
    String? bankCode,
    String? accountType,
    String? accountNumber,
    @JsonKey(name: '_id') String? id,
  }) = _DummyAccount;

  factory DummyAccount.fromJson(Map<String, dynamic> json) =>
      _$DummyAccountFromJson(json);
}
