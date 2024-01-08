// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_services_purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestServicesPurchase _$GuestServicesPurchaseFromJson(
    Map<String, dynamic> json) {
  return _GuestServicesPurchase.fromJson(json);
}

/// @nodoc
mixin _$GuestServicesPurchase {
  String? get referenceNumber => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num? get statusCode => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;
  num? get requestAmount => throw _privateConstructorUsedError;
  num? get totalPaymentAmount => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  List<PaymentMethod> get paymentMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestServicesPurchaseCopyWith<GuestServicesPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestServicesPurchaseCopyWith<$Res> {
  factory $GuestServicesPurchaseCopyWith(GuestServicesPurchase value,
          $Res Function(GuestServicesPurchase) then) =
      _$GuestServicesPurchaseCopyWithImpl<$Res, GuestServicesPurchase>;
  @useResult
  $Res call(
      {String? referenceNumber,
      @StringToNumSerializer() num? statusCode,
      String? statusMessage,
      num? requestAmount,
      num? totalPaymentAmount,
      Currency currency,
      List<PaymentMethod> paymentMethod});
}

/// @nodoc
class _$GuestServicesPurchaseCopyWithImpl<$Res,
        $Val extends GuestServicesPurchase>
    implements $GuestServicesPurchaseCopyWith<$Res> {
  _$GuestServicesPurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceNumber = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? requestAmount = freezed,
    Object? totalPaymentAmount = freezed,
    Object? currency = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as num?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAmount: freezed == requestAmount
          ? _value.requestAmount
          : requestAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPaymentAmount: freezed == totalPaymentAmount
          ? _value.totalPaymentAmount
          : totalPaymentAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestServicesPurchaseImplCopyWith<$Res>
    implements $GuestServicesPurchaseCopyWith<$Res> {
  factory _$$GuestServicesPurchaseImplCopyWith(
          _$GuestServicesPurchaseImpl value,
          $Res Function(_$GuestServicesPurchaseImpl) then) =
      __$$GuestServicesPurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? referenceNumber,
      @StringToNumSerializer() num? statusCode,
      String? statusMessage,
      num? requestAmount,
      num? totalPaymentAmount,
      Currency currency,
      List<PaymentMethod> paymentMethod});
}

/// @nodoc
class __$$GuestServicesPurchaseImplCopyWithImpl<$Res>
    extends _$GuestServicesPurchaseCopyWithImpl<$Res,
        _$GuestServicesPurchaseImpl>
    implements _$$GuestServicesPurchaseImplCopyWith<$Res> {
  __$$GuestServicesPurchaseImplCopyWithImpl(_$GuestServicesPurchaseImpl _value,
      $Res Function(_$GuestServicesPurchaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceNumber = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? requestAmount = freezed,
    Object? totalPaymentAmount = freezed,
    Object? currency = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$GuestServicesPurchaseImpl(
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as num?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAmount: freezed == requestAmount
          ? _value.requestAmount
          : requestAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPaymentAmount: freezed == totalPaymentAmount
          ? _value.totalPaymentAmount
          : totalPaymentAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      paymentMethod: null == paymentMethod
          ? _value._paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestServicesPurchaseImpl implements _GuestServicesPurchase {
  _$GuestServicesPurchaseImpl(
      {this.referenceNumber,
      @StringToNumSerializer() this.statusCode,
      this.statusMessage,
      this.requestAmount,
      this.totalPaymentAmount,
      this.currency = Currency.NGN,
      final List<PaymentMethod> paymentMethod = const []})
      : _paymentMethod = paymentMethod;

  factory _$GuestServicesPurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestServicesPurchaseImplFromJson(json);

  @override
  final String? referenceNumber;
  @override
  @StringToNumSerializer()
  final num? statusCode;
  @override
  final String? statusMessage;
  @override
  final num? requestAmount;
  @override
  final num? totalPaymentAmount;
  @override
  @JsonKey()
  final Currency currency;
  final List<PaymentMethod> _paymentMethod;
  @override
  @JsonKey()
  List<PaymentMethod> get paymentMethod {
    if (_paymentMethod is EqualUnmodifiableListView) return _paymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethod);
  }

  @override
  String toString() {
    return 'GuestServicesPurchase(referenceNumber: $referenceNumber, statusCode: $statusCode, statusMessage: $statusMessage, requestAmount: $requestAmount, totalPaymentAmount: $totalPaymentAmount, currency: $currency, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestServicesPurchaseImpl &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.requestAmount, requestAmount) ||
                other.requestAmount == requestAmount) &&
            (identical(other.totalPaymentAmount, totalPaymentAmount) ||
                other.totalPaymentAmount == totalPaymentAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethod, _paymentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referenceNumber,
      statusCode,
      statusMessage,
      requestAmount,
      totalPaymentAmount,
      currency,
      const DeepCollectionEquality().hash(_paymentMethod));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestServicesPurchaseImplCopyWith<_$GuestServicesPurchaseImpl>
      get copyWith => __$$GuestServicesPurchaseImplCopyWithImpl<
          _$GuestServicesPurchaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestServicesPurchaseImplToJson(
      this,
    );
  }
}

abstract class _GuestServicesPurchase implements GuestServicesPurchase {
  factory _GuestServicesPurchase(
      {final String? referenceNumber,
      @StringToNumSerializer() final num? statusCode,
      final String? statusMessage,
      final num? requestAmount,
      final num? totalPaymentAmount,
      final Currency currency,
      final List<PaymentMethod> paymentMethod}) = _$GuestServicesPurchaseImpl;

  factory _GuestServicesPurchase.fromJson(Map<String, dynamic> json) =
      _$GuestServicesPurchaseImpl.fromJson;

  @override
  String? get referenceNumber;
  @override
  @StringToNumSerializer()
  num? get statusCode;
  @override
  String? get statusMessage;
  @override
  num? get requestAmount;
  @override
  num? get totalPaymentAmount;
  @override
  Currency get currency;
  @override
  List<PaymentMethod> get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$GuestServicesPurchaseImplCopyWith<_$GuestServicesPurchaseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String? get name => throw _privateConstructorUsedError;
  Properties? get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call({String? name, Properties? properties});

  $PropertiesCopyWith<$Res>? get properties;
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? properties = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PropertiesCopyWith<$Res>? get properties {
    if (_value.properties == null) {
      return null;
    }

    return $PropertiesCopyWith<$Res>(_value.properties!, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, Properties? properties});

  @override
  $PropertiesCopyWith<$Res>? get properties;
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? properties = freezed,
  }) {
    return _then(_$PaymentMethodImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  _$PaymentMethodImpl({this.name, this.properties});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String? name;
  @override
  final Properties? properties;

  @override
  String toString() {
    return 'PaymentMethod(name: $name, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, properties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  factory _PaymentMethod({final String? name, final Properties? properties}) =
      _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String? get name;
  @override
  Properties? get properties;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Properties _$PropertiesFromJson(Map<String, dynamic> json) {
  return _Properties.fromJson(json);
}

/// @nodoc
mixin _$Properties {
  @JsonKey(name: 'WebPaymentLink')
  String? get webPaymentLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'USSDShortCode')
  String? get uSSDShortCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentReference')
  String? get paymentReference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertiesCopyWith<Properties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertiesCopyWith<$Res> {
  factory $PropertiesCopyWith(
          Properties value, $Res Function(Properties) then) =
      _$PropertiesCopyWithImpl<$Res, Properties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'WebPaymentLink') String? webPaymentLink,
      @JsonKey(name: 'USSDShortCode') String? uSSDShortCode,
      @JsonKey(name: 'PaymentReference') String? paymentReference});
}

/// @nodoc
class _$PropertiesCopyWithImpl<$Res, $Val extends Properties>
    implements $PropertiesCopyWith<$Res> {
  _$PropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? webPaymentLink = freezed,
    Object? uSSDShortCode = freezed,
    Object? paymentReference = freezed,
  }) {
    return _then(_value.copyWith(
      webPaymentLink: freezed == webPaymentLink
          ? _value.webPaymentLink
          : webPaymentLink // ignore: cast_nullable_to_non_nullable
              as String?,
      uSSDShortCode: freezed == uSSDShortCode
          ? _value.uSSDShortCode
          : uSSDShortCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertiesImplCopyWith<$Res>
    implements $PropertiesCopyWith<$Res> {
  factory _$$PropertiesImplCopyWith(
          _$PropertiesImpl value, $Res Function(_$PropertiesImpl) then) =
      __$$PropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'WebPaymentLink') String? webPaymentLink,
      @JsonKey(name: 'USSDShortCode') String? uSSDShortCode,
      @JsonKey(name: 'PaymentReference') String? paymentReference});
}

/// @nodoc
class __$$PropertiesImplCopyWithImpl<$Res>
    extends _$PropertiesCopyWithImpl<$Res, _$PropertiesImpl>
    implements _$$PropertiesImplCopyWith<$Res> {
  __$$PropertiesImplCopyWithImpl(
      _$PropertiesImpl _value, $Res Function(_$PropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? webPaymentLink = freezed,
    Object? uSSDShortCode = freezed,
    Object? paymentReference = freezed,
  }) {
    return _then(_$PropertiesImpl(
      webPaymentLink: freezed == webPaymentLink
          ? _value.webPaymentLink
          : webPaymentLink // ignore: cast_nullable_to_non_nullable
              as String?,
      uSSDShortCode: freezed == uSSDShortCode
          ? _value.uSSDShortCode
          : uSSDShortCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertiesImpl implements _Properties {
  _$PropertiesImpl(
      {@JsonKey(name: 'WebPaymentLink') this.webPaymentLink,
      @JsonKey(name: 'USSDShortCode') this.uSSDShortCode,
      @JsonKey(name: 'PaymentReference') this.paymentReference});

  factory _$PropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertiesImplFromJson(json);

  @override
  @JsonKey(name: 'WebPaymentLink')
  final String? webPaymentLink;
  @override
  @JsonKey(name: 'USSDShortCode')
  final String? uSSDShortCode;
  @override
  @JsonKey(name: 'PaymentReference')
  final String? paymentReference;

  @override
  String toString() {
    return 'Properties(webPaymentLink: $webPaymentLink, uSSDShortCode: $uSSDShortCode, paymentReference: $paymentReference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertiesImpl &&
            (identical(other.webPaymentLink, webPaymentLink) ||
                other.webPaymentLink == webPaymentLink) &&
            (identical(other.uSSDShortCode, uSSDShortCode) ||
                other.uSSDShortCode == uSSDShortCode) &&
            (identical(other.paymentReference, paymentReference) ||
                other.paymentReference == paymentReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, webPaymentLink, uSSDShortCode, paymentReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertiesImplCopyWith<_$PropertiesImpl> get copyWith =>
      __$$PropertiesImplCopyWithImpl<_$PropertiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertiesImplToJson(
      this,
    );
  }
}

abstract class _Properties implements Properties {
  factory _Properties(
          {@JsonKey(name: 'WebPaymentLink') final String? webPaymentLink,
          @JsonKey(name: 'USSDShortCode') final String? uSSDShortCode,
          @JsonKey(name: 'PaymentReference') final String? paymentReference}) =
      _$PropertiesImpl;

  factory _Properties.fromJson(Map<String, dynamic> json) =
      _$PropertiesImpl.fromJson;

  @override
  @JsonKey(name: 'WebPaymentLink')
  String? get webPaymentLink;
  @override
  @JsonKey(name: 'USSDShortCode')
  String? get uSSDShortCode;
  @override
  @JsonKey(name: 'PaymentReference')
  String? get paymentReference;
  @override
  @JsonKey(ignore: true)
  _$$PropertiesImplCopyWith<_$PropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
