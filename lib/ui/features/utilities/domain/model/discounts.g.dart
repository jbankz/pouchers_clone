// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountsDataImpl _$$DiscountsDataImplFromJson(Map<String, dynamic> json) =>
    _$DiscountsDataImpl(
      discount: json['discount'] == null
          ? null
          : Discounts.fromJson(json['discount'] as Map<String, dynamic>),
      filteredServices: (json['filteredServices'] as List<dynamic>?)
              ?.map((e) =>
                  MobileOperatorServices.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DiscountsDataImplToJson(_$DiscountsDataImpl instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'filteredServices': instance.filteredServices,
    };

_$DiscountsImpl _$$DiscountsImplFromJson(Map<String, dynamic> json) =>
    _$DiscountsImpl(
      productCategory: json['product_category'] as String?,
      discountValue: json['discount_value'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['discount_value']),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discount_type']),
      threshold: json['threshold'] == null
          ? 0
          : const StringToNumSerializer().fromJson(json['threshold']),
      frequency: json['frequency'] as String?,
      status: json['status'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
    );

Map<String, dynamic> _$$DiscountsImplToJson(_$DiscountsImpl instance) =>
    <String, dynamic>{
      'product_category': instance.productCategory,
      'discount_value':
          const StringToNumSerializer().toJson(instance.discountValue),
      'discount_type': _$DiscountTypeEnumMap[instance.discountType],
      'threshold': const StringToNumSerializer().toJson(instance.threshold),
      'frequency': instance.frequency,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.flat: 'flat',
  DiscountType.percentage: 'percentage',
};
