import 'package:freezed_annotation/freezed_annotation.dart';

part 'utility.freezed.dart';
part 'utility.g.dart';

@freezed
class Utility with _$Utility {
  factory Utility(
      {@Default(0) num? responseCode,
      @Default(0) num? responseCategoryCode,
      String? message,
      String? referenceNumber,
      String? transactionId,
      String? currency,
      String? exchangeRate,
      String? fee}) = _Utility;

  factory Utility.fromJson(Map<String, dynamic> json) =>
      _$UtilityFromJson(json);
}
