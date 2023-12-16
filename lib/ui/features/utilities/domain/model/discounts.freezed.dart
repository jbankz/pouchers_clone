// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discounts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Discounts _$DiscountsFromJson(Map<String, dynamic> json) {
  return _Discounts.fromJson(json);
}

/// @nodoc
mixin _$Discounts {
  @JsonKey(name: 'product_category')
  String? get productCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  String? get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String? get discountType => throw _privateConstructorUsedError;
  String? get threshold => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  @DateTimeSerializer()
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  @DateTimeSerializer()
  String? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountsCopyWith<Discounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountsCopyWith<$Res> {
  factory $DiscountsCopyWith(Discounts value, $Res Function(Discounts) then) =
      _$DiscountsCopyWithImpl<$Res, Discounts>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_category') String? productCategory,
      @JsonKey(name: 'discount_value') String? discountValue,
      @JsonKey(name: 'discount_type') String? discountType,
      String? threshold,
      String? frequency,
      String? status,
      @JsonKey(name: 'start_date') @DateTimeSerializer() String? startDate,
      @JsonKey(name: 'end_date') @DateTimeSerializer() String? endDate});
}

/// @nodoc
class _$DiscountsCopyWithImpl<$Res, $Val extends Discounts>
    implements $DiscountsCopyWith<$Res> {
  _$DiscountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCategory = freezed,
    Object? discountValue = freezed,
    Object? discountType = freezed,
    Object? threshold = freezed,
    Object? frequency = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      productCategory: freezed == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as String?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountsImplCopyWith<$Res>
    implements $DiscountsCopyWith<$Res> {
  factory _$$DiscountsImplCopyWith(
          _$DiscountsImpl value, $Res Function(_$DiscountsImpl) then) =
      __$$DiscountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_category') String? productCategory,
      @JsonKey(name: 'discount_value') String? discountValue,
      @JsonKey(name: 'discount_type') String? discountType,
      String? threshold,
      String? frequency,
      String? status,
      @JsonKey(name: 'start_date') @DateTimeSerializer() String? startDate,
      @JsonKey(name: 'end_date') @DateTimeSerializer() String? endDate});
}

/// @nodoc
class __$$DiscountsImplCopyWithImpl<$Res>
    extends _$DiscountsCopyWithImpl<$Res, _$DiscountsImpl>
    implements _$$DiscountsImplCopyWith<$Res> {
  __$$DiscountsImplCopyWithImpl(
      _$DiscountsImpl _value, $Res Function(_$DiscountsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCategory = freezed,
    Object? discountValue = freezed,
    Object? discountType = freezed,
    Object? threshold = freezed,
    Object? frequency = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$DiscountsImpl(
      productCategory: freezed == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as String?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountsImpl implements _Discounts {
  _$DiscountsImpl(
      {@JsonKey(name: 'product_category') this.productCategory,
      @JsonKey(name: 'discount_value') this.discountValue,
      @JsonKey(name: 'discount_type') this.discountType,
      this.threshold,
      this.frequency,
      this.status,
      @JsonKey(name: 'start_date') @DateTimeSerializer() this.startDate,
      @JsonKey(name: 'end_date') @DateTimeSerializer() this.endDate});

  factory _$DiscountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountsImplFromJson(json);

  @override
  @JsonKey(name: 'product_category')
  final String? productCategory;
  @override
  @JsonKey(name: 'discount_value')
  final String? discountValue;
  @override
  @JsonKey(name: 'discount_type')
  final String? discountType;
  @override
  final String? threshold;
  @override
  final String? frequency;
  @override
  final String? status;
  @override
  @JsonKey(name: 'start_date')
  @DateTimeSerializer()
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  @DateTimeSerializer()
  final String? endDate;

  @override
  String toString() {
    return 'Discounts(productCategory: $productCategory, discountValue: $discountValue, discountType: $discountType, threshold: $threshold, frequency: $frequency, status: $status, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountsImpl &&
            (identical(other.productCategory, productCategory) ||
                other.productCategory == productCategory) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productCategory, discountValue,
      discountType, threshold, frequency, status, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountsImplCopyWith<_$DiscountsImpl> get copyWith =>
      __$$DiscountsImplCopyWithImpl<_$DiscountsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountsImplToJson(
      this,
    );
  }
}

abstract class _Discounts implements Discounts {
  factory _Discounts(
      {@JsonKey(name: 'product_category') final String? productCategory,
      @JsonKey(name: 'discount_value') final String? discountValue,
      @JsonKey(name: 'discount_type') final String? discountType,
      final String? threshold,
      final String? frequency,
      final String? status,
      @JsonKey(name: 'start_date')
      @DateTimeSerializer()
      final String? startDate,
      @JsonKey(name: 'end_date')
      @DateTimeSerializer()
      final String? endDate}) = _$DiscountsImpl;

  factory _Discounts.fromJson(Map<String, dynamic> json) =
      _$DiscountsImpl.fromJson;

  @override
  @JsonKey(name: 'product_category')
  String? get productCategory;
  @override
  @JsonKey(name: 'discount_value')
  String? get discountValue;
  @override
  @JsonKey(name: 'discount_type')
  String? get discountType;
  @override
  String? get threshold;
  @override
  String? get frequency;
  @override
  String? get status;
  @override
  @JsonKey(name: 'start_date')
  @DateTimeSerializer()
  String? get startDate;
  @override
  @JsonKey(name: 'end_date')
  @DateTimeSerializer()
  String? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$DiscountsImplCopyWith<_$DiscountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
