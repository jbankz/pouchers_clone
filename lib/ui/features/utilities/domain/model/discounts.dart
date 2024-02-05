import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/serializer/string_to_num_serializer.dart';
import '../enum/discount_type.dart';

part 'discounts.freezed.dart';
part 'discounts.g.dart';

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
  num payment(String param) {
    final num amount = num.tryParse(param) ?? 0;

    if (amount < threshold) return amount;
    if (discountType == DiscountType.flat) return amount - discountValue;
    if (discountType == DiscountType.percentage) {
      return amount - (amount * (discountValue / 100));
    }
    return 0;
  }

  List<num> get topDeals => List.generate(6,
      (index) => threshold + index * (num.parse((threshold / 2).toString())));
}
