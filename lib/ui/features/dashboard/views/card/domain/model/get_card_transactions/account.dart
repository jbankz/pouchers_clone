import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  factory Account({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? type,
    String? currency,
    String? accountName,
    String? bankCode,
    String? accountType,
    String? accountNumber,
    int? currentBalance,
    int? availableBalance,
    String? provider,
    String? providerReference,
    String? referenceCode,
    bool? isDefault,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
