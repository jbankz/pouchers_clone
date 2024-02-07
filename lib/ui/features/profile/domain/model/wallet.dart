import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
@HiveType(typeId: DbConstants.five)
class Wallet with _$Wallet {
  factory Wallet(
          {@JsonKey(name: 'wallet_id') @HiveField(0) String? walletId,
          @JsonKey(name: 'user_id') @HiveField(1) String? userId,
          @HiveField(2) String? credit,
          @HiveField(3) String? debit,
          @HiveField(4) String? balance,
          @JsonKey(name: 'wallet_type') @HiveField(5) String? walletType,
          @JsonKey(name: 'account_name') @HiveField(6) String? accountName,
          @JsonKey(name: 'account_number') @HiveField(7) String? accountNumber,
          @JsonKey(name: 'bank_provider') @HiveField(8) String? bankProvider}) =
      _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}
