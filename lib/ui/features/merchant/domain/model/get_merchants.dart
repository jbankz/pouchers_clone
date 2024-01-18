import 'package:Pouchers/ui/features/merchant/domain/model/merchants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'get_merchants.freezed.dart';
part 'get_merchants.g.dart';

@freezed
@HiveType(typeId: DbConstants.ten)
class GetMerchant with _$GetMerchant {
  factory GetMerchant(
      {@Default(0) @HiveField(0) num responseCode,
      @HiveField(1) String? responseCategoryCode,
      @HiveField(2) String? referenceNumber,
      @Default([]) @HiveField(3) List<Merchant> merchants}) = _GetMerchant;

  factory GetMerchant.fromJson(Map<String, dynamic> json) =>
      _$GetMerchantFromJson(json);
}
