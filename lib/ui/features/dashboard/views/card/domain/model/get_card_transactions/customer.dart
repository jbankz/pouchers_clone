import 'package:freezed_annotation/freezed_annotation.dart';

import 'billing_address.dart';
import 'individual.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  factory Customer({
    @JsonKey(name: '_id') String? id,
    String? business,
    String? type,
    String? name,
    String? phoneNumber,
    String? emailAddress,
    String? status,
    Individual? individual,
    BillingAddress? billingAddress,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
