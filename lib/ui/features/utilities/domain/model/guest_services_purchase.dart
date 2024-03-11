import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_services_purchase.freezed.dart';
part 'guest_services_purchase.g.dart';

@freezed
class GuestServicesPurchase with _$GuestServicesPurchase {
  factory GuestServicesPurchase(
          {String? referenceNumber,
          @StringToNumSerializer() num? statusCode,
          String? statusMessage,
          num? requestAmount,
          num? totalPaymentAmount,
          @Default(Currency.ngn) Currency currency,
          @Default([]) List<PaymentMethod> paymentMethods}) =
      _GuestServicesPurchase;

  factory GuestServicesPurchase.fromJson(Map<String, dynamic> json) =>
      _$GuestServicesPurchaseFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  factory PaymentMethod({
    String? name,
    Properties? properties,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}

@freezed
class Properties with _$Properties {
  factory Properties({
    @JsonKey(name: 'WebPaymentLink') String? webPaymentLink,
    @JsonKey(name: 'USSDShortCode') String? uSSDShortCode,
    @JsonKey(name: 'PaymentReference') String? paymentReference,
  }) = _Properties;

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
}
