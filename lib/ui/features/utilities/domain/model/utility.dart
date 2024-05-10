import 'package:pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utility.freezed.dart';
part 'utility.g.dart';

@freezed
class Utility with _$Utility {
  factory Utility(
      {@StringToNumSerializer() @Default(0) num responseCode,
      @Default(0) num? responseCategoryCode,
      String? message,
      String? referenceNumber,
      String? transactionId,
      String? currency,
      String? exchangeRate,
      @StringToNumSerializer() @Default(0) num fee,
      String? integrationStatus,
      AdditionalProperties? additionalProperties}) = _Utility;

  factory Utility.fromJson(Map<String, dynamic> json) =>
      _$UtilityFromJson(json);
}

@freezed
class AdditionalProperties with _$AdditionalProperties {
  factory AdditionalProperties({
    @Default(0) num debtBalance,
    @Default(0) num? unitsPayment,
    @Default(0) num paymentAmount,
    @Default(0) num arrearsBalance,
    @Default(0) num totalPayment,
    String? completedTimestamp,
    @Default(0) num tariffRate,
    String? receiptNumber,
    String? merchantCustomerAccountName,
    String? address,
    String? customerAccountNumber,
    String? customerName,
    String? paymentDate,
    String? customerPhoneNumber,
  }) = _AdditionalProperties;

  factory AdditionalProperties.fromJson(Map<String, dynamic> json) =>
      _$AdditionalPropertiesFromJson(json);
}
