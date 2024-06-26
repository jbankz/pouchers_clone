import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'merchants.freezed.dart';
part 'merchants.g.dart';

@freezed
@HiveType(typeId: DbConstants.eleven)
class Merchant with _$Merchant {
  factory Merchant(
      {@HiveField(0) String? name,
      @HiveField(1) String? uuid,
      @HiveField(2) String? displayName,
      @HiveField(3) String? description}) = _Merchant;

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}
