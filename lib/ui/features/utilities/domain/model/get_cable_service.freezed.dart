// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_cable_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetCableService _$GetCableServiceFromJson(Map<String, dynamic> json) {
  return _GetCableService.fromJson(json);
}

/// @nodoc
mixin _$GetCableService {
  @HiveField(0)
  String? get referenceNumber => throw _privateConstructorUsedError;
  @HiveField(1)
  List<CableService> get services => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCableServiceCopyWith<GetCableService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCableServiceCopyWith<$Res> {
  factory $GetCableServiceCopyWith(
          GetCableService value, $Res Function(GetCableService) then) =
      _$GetCableServiceCopyWithImpl<$Res, GetCableService>;
  @useResult
  $Res call(
      {@HiveField(0) String? referenceNumber,
      @HiveField(1) List<CableService> services});
}

/// @nodoc
class _$GetCableServiceCopyWithImpl<$Res, $Val extends GetCableService>
    implements $GetCableServiceCopyWith<$Res> {
  _$GetCableServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceNumber = freezed,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<CableService>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCableServiceImplCopyWith<$Res>
    implements $GetCableServiceCopyWith<$Res> {
  factory _$$GetCableServiceImplCopyWith(_$GetCableServiceImpl value,
          $Res Function(_$GetCableServiceImpl) then) =
      __$$GetCableServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? referenceNumber,
      @HiveField(1) List<CableService> services});
}

/// @nodoc
class __$$GetCableServiceImplCopyWithImpl<$Res>
    extends _$GetCableServiceCopyWithImpl<$Res, _$GetCableServiceImpl>
    implements _$$GetCableServiceImplCopyWith<$Res> {
  __$$GetCableServiceImplCopyWithImpl(
      _$GetCableServiceImpl _value, $Res Function(_$GetCableServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceNumber = freezed,
    Object? services = null,
  }) {
    return _then(_$GetCableServiceImpl(
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<CableService>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 13, adapterName: 'GetCableServiceAdapter')
class _$GetCableServiceImpl implements _GetCableService {
  _$GetCableServiceImpl(
      {@HiveField(0) this.referenceNumber,
      @HiveField(1) final List<CableService> services = const []})
      : _services = services;

  factory _$GetCableServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCableServiceImplFromJson(json);

  @override
  @HiveField(0)
  final String? referenceNumber;
  final List<CableService> _services;
  @override
  @JsonKey()
  @HiveField(1)
  List<CableService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'GetCableService(referenceNumber: $referenceNumber, services: $services)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCableServiceImpl &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referenceNumber,
      const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCableServiceImplCopyWith<_$GetCableServiceImpl> get copyWith =>
      __$$GetCableServiceImplCopyWithImpl<_$GetCableServiceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCableServiceImplToJson(
      this,
    );
  }
}

abstract class _GetCableService implements GetCableService {
  factory _GetCableService(
      {@HiveField(0) final String? referenceNumber,
      @HiveField(1) final List<CableService> services}) = _$GetCableServiceImpl;

  factory _GetCableService.fromJson(Map<String, dynamic> json) =
      _$GetCableServiceImpl.fromJson;

  @override
  @HiveField(0)
  String? get referenceNumber;
  @override
  @HiveField(1)
  List<CableService> get services;
  @override
  @JsonKey(ignore: true)
  _$$GetCableServiceImplCopyWith<_$GetCableServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
