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

DiscountsData _$DiscountsDataFromJson(Map<String, dynamic> json) {
  return _DiscountsData.fromJson(json);
}

/// @nodoc
mixin _$DiscountsData {
  Discounts? get discount => throw _privateConstructorUsedError;
  List<MobileOperatorServices> get filteredServices =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountsDataCopyWith<DiscountsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountsDataCopyWith<$Res> {
  factory $DiscountsDataCopyWith(
          DiscountsData value, $Res Function(DiscountsData) then) =
      _$DiscountsDataCopyWithImpl<$Res, DiscountsData>;
  @useResult
  $Res call(
      {Discounts? discount, List<MobileOperatorServices> filteredServices});

  $DiscountsCopyWith<$Res>? get discount;
}

/// @nodoc
class _$DiscountsDataCopyWithImpl<$Res, $Val extends DiscountsData>
    implements $DiscountsDataCopyWith<$Res> {
  _$DiscountsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = freezed,
    Object? filteredServices = null,
  }) {
    return _then(_value.copyWith(
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as Discounts?,
      filteredServices: null == filteredServices
          ? _value.filteredServices
          : filteredServices // ignore: cast_nullable_to_non_nullable
              as List<MobileOperatorServices>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountsCopyWith<$Res>? get discount {
    if (_value.discount == null) {
      return null;
    }

    return $DiscountsCopyWith<$Res>(_value.discount!, (value) {
      return _then(_value.copyWith(discount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscountsDataImplCopyWith<$Res>
    implements $DiscountsDataCopyWith<$Res> {
  factory _$$DiscountsDataImplCopyWith(
          _$DiscountsDataImpl value, $Res Function(_$DiscountsDataImpl) then) =
      __$$DiscountsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Discounts? discount, List<MobileOperatorServices> filteredServices});

  @override
  $DiscountsCopyWith<$Res>? get discount;
}

/// @nodoc
class __$$DiscountsDataImplCopyWithImpl<$Res>
    extends _$DiscountsDataCopyWithImpl<$Res, _$DiscountsDataImpl>
    implements _$$DiscountsDataImplCopyWith<$Res> {
  __$$DiscountsDataImplCopyWithImpl(
      _$DiscountsDataImpl _value, $Res Function(_$DiscountsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = freezed,
    Object? filteredServices = null,
  }) {
    return _then(_$DiscountsDataImpl(
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as Discounts?,
      filteredServices: null == filteredServices
          ? _value._filteredServices
          : filteredServices // ignore: cast_nullable_to_non_nullable
              as List<MobileOperatorServices>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountsDataImpl implements _DiscountsData {
  _$DiscountsDataImpl(
      {this.discount,
      final List<MobileOperatorServices> filteredServices = const []})
      : _filteredServices = filteredServices;

  factory _$DiscountsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountsDataImplFromJson(json);

  @override
  final Discounts? discount;
  final List<MobileOperatorServices> _filteredServices;
  @override
  @JsonKey()
  List<MobileOperatorServices> get filteredServices {
    if (_filteredServices is EqualUnmodifiableListView)
      return _filteredServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredServices);
  }

  @override
  String toString() {
    return 'DiscountsData(discount: $discount, filteredServices: $filteredServices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountsDataImpl &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality()
                .equals(other._filteredServices, _filteredServices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, discount,
      const DeepCollectionEquality().hash(_filteredServices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountsDataImplCopyWith<_$DiscountsDataImpl> get copyWith =>
      __$$DiscountsDataImplCopyWithImpl<_$DiscountsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountsDataImplToJson(
      this,
    );
  }
}

abstract class _DiscountsData implements DiscountsData {
  factory _DiscountsData(
          {final Discounts? discount,
          final List<MobileOperatorServices> filteredServices}) =
      _$DiscountsDataImpl;

  factory _DiscountsData.fromJson(Map<String, dynamic> json) =
      _$DiscountsDataImpl.fromJson;

  @override
  Discounts? get discount;
  @override
  List<MobileOperatorServices> get filteredServices;
  @override
  @JsonKey(ignore: true)
  _$$DiscountsDataImplCopyWith<_$DiscountsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Discounts _$DiscountsFromJson(Map<String, dynamic> json) {
  return _Discounts.fromJson(json);
}

/// @nodoc
mixin _$Discounts {
  @JsonKey(name: 'product_category')
  String? get productCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  @StringToNumSerializer()
  num get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num get threshold => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'discount_value')
      @StringToNumSerializer()
      num discountValue,
      @JsonKey(name: 'discount_type') DiscountType? discountType,
      @StringToNumSerializer() num threshold,
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
    Object? discountValue = null,
    Object? discountType = freezed,
    Object? threshold = null,
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
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as num,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as num,
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
      @JsonKey(name: 'discount_value')
      @StringToNumSerializer()
      num discountValue,
      @JsonKey(name: 'discount_type') DiscountType? discountType,
      @StringToNumSerializer() num threshold,
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
    Object? discountValue = null,
    Object? discountType = freezed,
    Object? threshold = null,
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
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as num,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as DiscountType?,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as num,
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
      @JsonKey(name: 'discount_value')
      @StringToNumSerializer()
      this.discountValue = 0,
      @JsonKey(name: 'discount_type') this.discountType,
      @StringToNumSerializer() this.threshold = 0,
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
  @StringToNumSerializer()
  final num discountValue;
  @override
  @JsonKey(name: 'discount_type')
  final DiscountType? discountType;
  @override
  @JsonKey()
  @StringToNumSerializer()
  final num threshold;
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
      @JsonKey(name: 'discount_value')
      @StringToNumSerializer()
      final num discountValue,
      @JsonKey(name: 'discount_type') final DiscountType? discountType,
      @StringToNumSerializer() final num threshold,
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
  @StringToNumSerializer()
  num get discountValue;
  @override
  @JsonKey(name: 'discount_type')
  DiscountType? get discountType;
  @override
  @StringToNumSerializer()
  num get threshold;
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
