import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_services_purchase_status.freezed.dart';
part 'guest_services_purchase_status.g.dart';

@freezed
class GuestServicesPurchaseStatus with _$GuestServicesPurchaseStatus {
  factory GuestServicesPurchaseStatus(
      {String? referenceNumber,
      @StringToNumSerializer() num? statusCode,
      String? statusMessage,
      num? requestAmount,
      num? totalPaymentAmount,
      Currency? currency,
      String? expiryDateTimeUTC}) = _GuestServicesPurchaseStatus;

  factory GuestServicesPurchaseStatus.fromJson(Map<String, dynamic> json) =>
      _$GuestServicesPurchaseStatusFromJson(json);
}
