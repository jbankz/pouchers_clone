import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/serializer/string_to_num_serializer.dart';
import '../enum/discount_type.dart';
import 'mobile_data_services.dart';

part 'discounts.freezed.dart';
part 'discounts.g.dart';

@freezed
class DiscountsData with _$DiscountsData {
  factory DiscountsData(
          {Discounts? discount,
          @Default([]) List<MobileOperatorServices> filteredServices}) =
      _DiscountsData;

  factory DiscountsData.fromJson(Map<String, dynamic> json) =>
      _$DiscountsDataFromJson(json);
}

@freezed
class Discounts with _$Discounts {
  factory Discounts({
    @JsonKey(name: 'product_category') String? productCategory,
    @JsonKey(name: 'discount_value')
    @StringToNumSerializer()
    @Default(0)
    num discountValue,
    @JsonKey(name: 'discount_type') DiscountType? discountType,
    @StringToNumSerializer() @Default(0) num threshold,
    String? frequency,
    String? status,
    @JsonKey(name: 'start_date') @DateTimeSerializer() String? startDate,
    @JsonKey(name: 'end_date') @DateTimeSerializer() String? endDate,
  }) = _Discounts;

  factory Discounts.fromJson(Map<String, dynamic> json) =>
      _$DiscountsFromJson(json);
}

extension ExtOnDiscounts on Discounts {
  num payment(num? param) {
    final num amount = param ?? 0;

    if (amount < threshold) return amount;
    if (discountType == DiscountType.flat) return amount - discountValue;
    if (discountType == DiscountType.percentage) {
      return amount - (amount * (discountValue / 100));
    }
    return amount;
  }

  List<MobileOperatorServices> get topDeals => List.generate(
      6,
      (index) => MobileOperatorServices(
          servicePrice:
              threshold + index * (num.parse((threshold / 2).toString()))));
}
