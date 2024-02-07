import 'package:freezed_annotation/freezed_annotation.dart';

import 'account.dart';
import 'customer.dart';
import 'funding_source.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: '_id') String? id,
    String? business,
    Customer? customer,
    Account? account,
    FundingSource? fundingSource,
    String? type,
    String? brand,
    String? currency,
    String? maskedPan,
    String? expiryMonth,
    String? expiryYear,
    String? status,
    @JsonKey(name: 'is2FAEnrolled') bool? is2FaEnrolled,
    @JsonKey(name: 'isDefaultPINChanged') bool? isDefaultPinChanged,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
