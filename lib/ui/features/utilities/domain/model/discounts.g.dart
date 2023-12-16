// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountsImpl _$$DiscountsImplFromJson(Map<String, dynamic> json) =>
    _$DiscountsImpl(
      productCategory: json['product_category'] as String?,
      discountValue: json['discount_value'] as String?,
      discountType: json['discount_type'] as String?,
      threshold: json['threshold'] as String?,
      frequency: json['frequency'] as String?,
      status: json['status'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
    );

Map<String, dynamic> _$$DiscountsImplToJson(_$DiscountsImpl instance) =>
    <String, dynamic>{
      'product_category': instance.productCategory,
      'discount_value': instance.discountValue,
      'discount_type': instance.discountType,
      'threshold': instance.threshold,
      'frequency': instance.frequency,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
