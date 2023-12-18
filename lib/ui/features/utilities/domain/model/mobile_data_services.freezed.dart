// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_data_services.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MobileOperatorServices _$MobileOperatorServicesFromJson(
    Map<String, dynamic> json) {
  return _MobileOperatorServices.fromJson(json);
}

/// @nodoc
mixin _$MobileOperatorServices {
  num get mobileOperatorId => throw _privateConstructorUsedError;
  num get servicePrice => throw _privateConstructorUsedError;
  String? get validityPeriod => throw _privateConstructorUsedError;
  String? get dataValue => throw _privateConstructorUsedError;
  String? get serviceName => throw _privateConstructorUsedError;
  num get serviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MobileOperatorServicesCopyWith<MobileOperatorServices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileOperatorServicesCopyWith<$Res> {
  factory $MobileOperatorServicesCopyWith(MobileOperatorServices value,
          $Res Function(MobileOperatorServices) then) =
      _$MobileOperatorServicesCopyWithImpl<$Res, MobileOperatorServices>;
  @useResult
  $Res call(
      {num mobileOperatorId,
      num servicePrice,
      String? validityPeriod,
      String? dataValue,
      String? serviceName,
      num serviceId});
}

/// @nodoc
class _$MobileOperatorServicesCopyWithImpl<$Res,
        $Val extends MobileOperatorServices>
    implements $MobileOperatorServicesCopyWith<$Res> {
  _$MobileOperatorServicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileOperatorId = null,
    Object? servicePrice = null,
    Object? validityPeriod = freezed,
    Object? dataValue = freezed,
    Object? serviceName = freezed,
    Object? serviceId = null,
  }) {
    return _then(_value.copyWith(
      mobileOperatorId: null == mobileOperatorId
          ? _value.mobileOperatorId
          : mobileOperatorId // ignore: cast_nullable_to_non_nullable
              as num,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as num,
      validityPeriod: freezed == validityPeriod
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      dataValue: freezed == dataValue
          ? _value.dataValue
          : dataValue // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: freezed == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobileOperatorServicesImplCopyWith<$Res>
    implements $MobileOperatorServicesCopyWith<$Res> {
  factory _$$MobileOperatorServicesImplCopyWith(
          _$MobileOperatorServicesImpl value,
          $Res Function(_$MobileOperatorServicesImpl) then) =
      __$$MobileOperatorServicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num mobileOperatorId,
      num servicePrice,
      String? validityPeriod,
      String? dataValue,
      String? serviceName,
      num serviceId});
}

/// @nodoc
class __$$MobileOperatorServicesImplCopyWithImpl<$Res>
    extends _$MobileOperatorServicesCopyWithImpl<$Res,
        _$MobileOperatorServicesImpl>
    implements _$$MobileOperatorServicesImplCopyWith<$Res> {
  __$$MobileOperatorServicesImplCopyWithImpl(
      _$MobileOperatorServicesImpl _value,
      $Res Function(_$MobileOperatorServicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileOperatorId = null,
    Object? servicePrice = null,
    Object? validityPeriod = freezed,
    Object? dataValue = freezed,
    Object? serviceName = freezed,
    Object? serviceId = null,
  }) {
    return _then(_$MobileOperatorServicesImpl(
      mobileOperatorId: null == mobileOperatorId
          ? _value.mobileOperatorId
          : mobileOperatorId // ignore: cast_nullable_to_non_nullable
              as num,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as num,
      validityPeriod: freezed == validityPeriod
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      dataValue: freezed == dataValue
          ? _value.dataValue
          : dataValue // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: freezed == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobileOperatorServicesImpl implements _MobileOperatorServices {
  _$MobileOperatorServicesImpl(
      {this.mobileOperatorId = 0,
      this.servicePrice = 0,
      this.validityPeriod,
      this.dataValue,
      this.serviceName,
      this.serviceId = 0});

  factory _$MobileOperatorServicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobileOperatorServicesImplFromJson(json);

  @override
  @JsonKey()
  final num mobileOperatorId;
  @override
  @JsonKey()
  final num servicePrice;
  @override
  final String? validityPeriod;
  @override
  final String? dataValue;
  @override
  final String? serviceName;
  @override
  @JsonKey()
  final num serviceId;

  @override
  String toString() {
    return 'MobileOperatorServices(mobileOperatorId: $mobileOperatorId, servicePrice: $servicePrice, validityPeriod: $validityPeriod, dataValue: $dataValue, serviceName: $serviceName, serviceId: $serviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileOperatorServicesImpl &&
            (identical(other.mobileOperatorId, mobileOperatorId) ||
                other.mobileOperatorId == mobileOperatorId) &&
            (identical(other.servicePrice, servicePrice) ||
                other.servicePrice == servicePrice) &&
            (identical(other.validityPeriod, validityPeriod) ||
                other.validityPeriod == validityPeriod) &&
            (identical(other.dataValue, dataValue) ||
                other.dataValue == dataValue) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mobileOperatorId, servicePrice,
      validityPeriod, dataValue, serviceName, serviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MobileOperatorServicesImplCopyWith<_$MobileOperatorServicesImpl>
      get copyWith => __$$MobileOperatorServicesImplCopyWithImpl<
          _$MobileOperatorServicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobileOperatorServicesImplToJson(
      this,
    );
  }
}

abstract class _MobileOperatorServices implements MobileOperatorServices {
  factory _MobileOperatorServices(
      {final num mobileOperatorId,
      final num servicePrice,
      final String? validityPeriod,
      final String? dataValue,
      final String? serviceName,
      final num serviceId}) = _$MobileOperatorServicesImpl;

  factory _MobileOperatorServices.fromJson(Map<String, dynamic> json) =
      _$MobileOperatorServicesImpl.fromJson;

  @override
  num get mobileOperatorId;
  @override
  num get servicePrice;
  @override
  String? get validityPeriod;
  @override
  String? get dataValue;
  @override
  String? get serviceName;
  @override
  num get serviceId;
  @override
  @JsonKey(ignore: true)
  _$$MobileOperatorServicesImplCopyWith<_$MobileOperatorServicesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
