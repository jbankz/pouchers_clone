import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../app/serializer/date_time_serializer.dart';
import '../../enum/card_brand.dart';
import '../../enum/card_status.dart';
import '../../enum/currency.dart';

part 'virtual_card_details.freezed.dart';
part 'virtual_card_details.g.dart';

@freezed
class VirtualCardDetails with _$VirtualCardDetails {
  factory VirtualCardDetails({
    @JsonKey(name: '_id') String? id,
    String? type,
    CardBrand? brand,
    Currency? currency,
    String? maskedPan,
    String? expiryMonth,
    String? expiryYear,
    @Default(CardStatus.active) CardStatus? status,
    @Default(false) bool is2FAEnrolled,
    @Default(false) bool isDefaultPINChanged,
    @Default(false) bool disposable,
    String? refundAccount,
    @Default(false) bool isDeleted,
    @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
    Customer? customer,
    Account? account,
    FundingSource? fundingSource,
    String? cvv2,
  }) = _VirtualCardDetails;

  factory VirtualCardDetails.fromJson(Map<String, dynamic> json) =>
      _$VirtualCardDetailsFromJson(json);
}

@freezed
class Customer with _$Customer {
  factory Customer(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      String? name,
      String? phoneNumber,
      String? emailAddress,
      String? status,
      Individual? individual,
      BillingAddress? billingAddress,
      @Default(false) bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      DateTime? updatedAt}) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@freezed
class Individual with _$Individual {
  factory Individual({
    @JsonKey(name: '_id') String? id,
    String? firstName,
    String? lastName,
    String? dob,
    Identity? identity,
  }) = _Individual;

  factory Individual.fromJson(Map<String, dynamic> json) =>
      _$IndividualFromJson(json);
}

@freezed
class Identity with _$Identity {
  factory Identity(
      {@JsonKey(name: '_id') String? id,
      String? type,
      String? number}) = _Identity;

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);
}

@freezed
class BillingAddress with _$BillingAddress {
  factory BillingAddress(
      {@JsonKey(name: '_id') String? id,
      String? line1,
      String? city,
      String? state,
      String? country,
      String? postalCode}) = _BillingAddress;

  factory BillingAddress.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressFromJson(json);
}

@freezed
class Account with _$Account {
  factory Account(
      {@JsonKey(name: '_id') String? id,
      String? business,
      String? type,
      @Default(Currency.NGN) Currency currency,
      String? accountName,
      String? bankCode,
      String? accountType,
      String? accountNumber,
      @Default(0) num currentBalance,
      @Default(0) num availableBalance,
      String? provider,
      String? providerReference,
      String? referenceCode,
      @Default(false) bool reloadable,
      @Default(false) bool isDefault,
      @Default(false) bool isDeleted,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      @Default([]) List<dynamic> charges}) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@freezed
class FundingSource with _$FundingSource {
  factory FundingSource({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? type,
    String? status,
    dynamic jitGateway,
    @Default(false) bool isDefault,
    @Default(false) bool isDeleted,
    @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
  }) = _FundingSource;

  factory FundingSource.fromJson(Map<String, dynamic> json) =>
      _$FundingSourceFromJson(json);
}
