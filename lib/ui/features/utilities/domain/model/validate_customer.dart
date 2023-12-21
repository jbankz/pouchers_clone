import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_customer.freezed.dart';
part 'validate_customer.g.dart';

@freezed
class ValidateCustomer with _$ValidateCustomer {
  factory ValidateCustomer({String? customerName}) = _ValidateCustomer;

  factory ValidateCustomer.fromJson(Map<String, dynamic> json) =>
      _$ValidateCustomerFromJson(json);
}
