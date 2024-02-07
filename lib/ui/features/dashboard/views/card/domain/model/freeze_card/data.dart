import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'customer.dart';
import 'dummy_account.dart';
import 'spending_controls.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: '_id') String? id,
    String? business,
    Customer? customer,
    String? account,
    String? fundingSource,
    String? type,
    String? brand,
    String? currency,
    String? maskedPan,
    String? last4,
    String? expiryMonth,
    String? expiryYear,
    @Default(CardStatus.active) CardStatus? status,
    DummyAccount? dummyAccount,
    @JsonKey(name: 'is2FAEnrolled') bool? is2FaEnrolled,
    SpendingControls? spendingControls,
    DateTime? updatedAt,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
