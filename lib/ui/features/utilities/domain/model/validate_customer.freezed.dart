// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateCustomer _$ValidateCustomerFromJson(Map<String, dynamic> json) {
  return _ValidateCustomer.fromJson(json);
}

/// @nodoc
mixin _$ValidateCustomer {
  String? get customerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateCustomerCopyWith<ValidateCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateCustomerCopyWith<$Res> {
  factory $ValidateCustomerCopyWith(
          ValidateCustomer value, $Res Function(ValidateCustomer) then) =
      _$ValidateCustomerCopyWithImpl<$Res, ValidateCustomer>;
  @useResult
  $Res call({String? customerName});
}

/// @nodoc
class _$ValidateCustomerCopyWithImpl<$Res, $Val extends ValidateCustomer>
    implements $ValidateCustomerCopyWith<$Res> {
  _$ValidateCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = freezed,
  }) {
    return _then(_value.copyWith(
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidateCustomerImplCopyWith<$Res>
    implements $ValidateCustomerCopyWith<$Res> {
  factory _$$ValidateCustomerImplCopyWith(_$ValidateCustomerImpl value,
          $Res Function(_$ValidateCustomerImpl) then) =
      __$$ValidateCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? customerName});
}

/// @nodoc
class __$$ValidateCustomerImplCopyWithImpl<$Res>
    extends _$ValidateCustomerCopyWithImpl<$Res, _$ValidateCustomerImpl>
    implements _$$ValidateCustomerImplCopyWith<$Res> {
  __$$ValidateCustomerImplCopyWithImpl(_$ValidateCustomerImpl _value,
      $Res Function(_$ValidateCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = freezed,
  }) {
    return _then(_$ValidateCustomerImpl(
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateCustomerImpl implements _ValidateCustomer {
  _$ValidateCustomerImpl({this.customerName});

  factory _$ValidateCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidateCustomerImplFromJson(json);

  @override
  final String? customerName;

  @override
  String toString() {
    return 'ValidateCustomer(customerName: $customerName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateCustomerImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateCustomerImplCopyWith<_$ValidateCustomerImpl> get copyWith =>
      __$$ValidateCustomerImplCopyWithImpl<_$ValidateCustomerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateCustomerImplToJson(
      this,
    );
  }
}

abstract class _ValidateCustomer implements ValidateCustomer {
  factory _ValidateCustomer({final String? customerName}) =
      _$ValidateCustomerImpl;

  factory _ValidateCustomer.fromJson(Map<String, dynamic> json) =
      _$ValidateCustomerImpl.fromJson;

  @override
  String? get customerName;
  @override
  @JsonKey(ignore: true)
  _$$ValidateCustomerImplCopyWith<_$ValidateCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
