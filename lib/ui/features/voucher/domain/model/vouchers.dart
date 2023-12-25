import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:Pouchers/ui/features/voucher/domain/enum/voucher_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'vouchers.freezed.dart';
part 'vouchers.g.dart';

@freezed
class Vouchers with _$Vouchers {
  @HiveType(typeId: 15, adapterName: 'VouchersAdapter')
  factory Vouchers(
      {@HiveField(0) String? code,
      @HiveField(1) @Default(0) num amount,
      @HiveField(2) @JsonKey(name: 'buyer_id') String? buyerId,
      @HiveField(3) @JsonKey(name: 'giftee_id') String? gifteeId,
      @HiveField(4) @Default(VoucherStatus.inactive) VoucherStatus status,
      @HiveField(5) @Default(false) bool redeemed,
      @HiveField(6)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      DateTime? createdAt}) = _Vouchers;

  factory Vouchers.fromJson(Map<String, dynamic> json) =>
      _$VouchersFromJson(json);
}
