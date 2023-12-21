// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_merchants.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetMerchant _$GetMerchantFromJson(Map<String, dynamic> json) {
  return _GetMerchant.fromJson(json);
}

/// @nodoc
mixin _$GetMerchant {
  @HiveField(0)
  num get responseCode => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get responseCategoryCode => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get referenceNumber => throw _privateConstructorUsedError;
  @HiveField(3)
  List<Merchant> get merchants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetMerchantCopyWith<GetMerchant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMerchantCopyWith<$Res> {
  factory $GetMerchantCopyWith(
          GetMerchant value, $Res Function(GetMerchant) then) =
      _$GetMerchantCopyWithImpl<$Res, GetMerchant>;
  @useResult
  $Res call(
      {@HiveField(0) num responseCode,
      @HiveField(1) String? responseCategoryCode,
      @HiveField(2) String? referenceNumber,
      @HiveField(3) List<Merchant> merchants});
}

/// @nodoc
class _$GetMerchantCopyWithImpl<$Res, $Val extends GetMerchant>
    implements $GetMerchantCopyWith<$Res> {
  _$GetMerchantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseCategoryCode = freezed,
    Object? referenceNumber = freezed,
    Object? merchants = null,
  }) {
    return _then(_value.copyWith(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as num,
      responseCategoryCode: freezed == responseCategoryCode
          ? _value.responseCategoryCode
          : responseCategoryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      merchants: null == merchants
          ? _value.merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<Merchant>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMerchantImplCopyWith<$Res>
    implements $GetMerchantCopyWith<$Res> {
  factory _$$GetMerchantImplCopyWith(
          _$GetMerchantImpl value, $Res Function(_$GetMerchantImpl) then) =
      __$$GetMerchantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) num responseCode,
      @HiveField(1) String? responseCategoryCode,
      @HiveField(2) String? referenceNumber,
      @HiveField(3) List<Merchant> merchants});
}

/// @nodoc
class __$$GetMerchantImplCopyWithImpl<$Res>
    extends _$GetMerchantCopyWithImpl<$Res, _$GetMerchantImpl>
    implements _$$GetMerchantImplCopyWith<$Res> {
  __$$GetMerchantImplCopyWithImpl(
      _$GetMerchantImpl _value, $Res Function(_$GetMerchantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseCategoryCode = freezed,
    Object? referenceNumber = freezed,
    Object? merchants = null,
  }) {
    return _then(_$GetMerchantImpl(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as num,
      responseCategoryCode: freezed == responseCategoryCode
          ? _value.responseCategoryCode
          : responseCategoryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      merchants: null == merchants
          ? _value._merchants
          : merchants // ignore: cast_nullable_to_non_nullable
              as List<Merchant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 10, adapterName: 'GetMerchantAdapter')
class _$GetMerchantImpl implements _GetMerchant {
  _$GetMerchantImpl(
      {@HiveField(0) this.responseCode = 0,
      @HiveField(1) this.responseCategoryCode,
      @HiveField(2) this.referenceNumber,
      @HiveField(3) final List<Merchant> merchants = const []})
      : _merchants = merchants;

  factory _$GetMerchantImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetMerchantImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final num responseCode;
  @override
  @HiveField(1)
  final String? responseCategoryCode;
  @override
  @HiveField(2)
  final String? referenceNumber;
  final List<Merchant> _merchants;
  @override
  @JsonKey()
  @HiveField(3)
  List<Merchant> get merchants {
    if (_merchants is EqualUnmodifiableListView) return _merchants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchants);
  }

  @override
  String toString() {
    return 'GetMerchant(responseCode: $responseCode, responseCategoryCode: $responseCategoryCode, referenceNumber: $referenceNumber, merchants: $merchants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMerchantImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.responseCategoryCode, responseCategoryCode) ||
                other.responseCategoryCode == responseCategoryCode) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            const DeepCollectionEquality()
                .equals(other._merchants, _merchants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseCode,
      responseCategoryCode,
      referenceNumber,
      const DeepCollectionEquality().hash(_merchants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMerchantImplCopyWith<_$GetMerchantImpl> get copyWith =>
      __$$GetMerchantImplCopyWithImpl<_$GetMerchantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetMerchantImplToJson(
      this,
    );
  }
}

abstract class _GetMerchant implements GetMerchant {
  factory _GetMerchant(
      {@HiveField(0) final num responseCode,
      @HiveField(1) final String? responseCategoryCode,
      @HiveField(2) final String? referenceNumber,
      @HiveField(3) final List<Merchant> merchants}) = _$GetMerchantImpl;

  factory _GetMerchant.fromJson(Map<String, dynamic> json) =
      _$GetMerchantImpl.fromJson;

  @override
  @HiveField(0)
  num get responseCode;
  @override
  @HiveField(1)
  String? get responseCategoryCode;
  @override
  @HiveField(2)
  String? get referenceNumber;
  @override
  @HiveField(3)
  List<Merchant> get merchants;
  @override
  @JsonKey(ignore: true)
  _$$GetMerchantImplCopyWith<_$GetMerchantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
