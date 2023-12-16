import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discounts.freezed.dart';
part 'discounts.g.dart';

@freezed
class Discounts with _$Discounts {
  factory Discounts(
          {@JsonKey(name: 'product_category') String? productCategory,
          @JsonKey(name: 'discount_value') String? discountValue,
          @JsonKey(name: 'discount_type') String? discountType,
          String? threshold,
          String? frequency,
          String? status,
          @JsonKey(name: 'start_date') @DateTimeSerializer() String? startDate,
          @JsonKey(name: 'end_date') @DateTimeSerializer() String? endDate}) =
      _Discounts;

  factory Discounts.fromJson(Map<String, dynamic> json) =>
      _$DiscountsFromJson(json);
}
