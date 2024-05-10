import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  factory Account({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? type,
    Currency? currency,
    String? accountName,
    String? bankCode,
    String? accountType,
    String? accountNumber,
    @Default(0) num currentBalance,
    @Default(0) num availableBalance,
    String? provider,
    String? providerReference,
    String? referenceCode,
    @Default(false) bool isDefault,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
