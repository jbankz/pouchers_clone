// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'virtual_account_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VirtualAccountBalance _$VirtualAccountBalanceFromJson(
    Map<String, dynamic> json) {
  return _VirtualAccountBalance.fromJson(json);
}

/// @nodoc
mixin _$VirtualAccountBalance {
  num get currentBalance => throw _privateConstructorUsedError;
  num get availableBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VirtualAccountBalanceCopyWith<VirtualAccountBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualAccountBalanceCopyWith<$Res> {
  factory $VirtualAccountBalanceCopyWith(VirtualAccountBalance value,
          $Res Function(VirtualAccountBalance) then) =
      _$VirtualAccountBalanceCopyWithImpl<$Res, VirtualAccountBalance>;
  @useResult
  $Res call({num currentBalance, num availableBalance});
}

/// @nodoc
class _$VirtualAccountBalanceCopyWithImpl<$Res,
        $Val extends VirtualAccountBalance>
    implements $VirtualAccountBalanceCopyWith<$Res> {
  _$VirtualAccountBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? availableBalance = null,
  }) {
    return _then(_value.copyWith(
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as num,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VirtualAccountBalanceImplCopyWith<$Res>
    implements $VirtualAccountBalanceCopyWith<$Res> {
  factory _$$VirtualAccountBalanceImplCopyWith(
          _$VirtualAccountBalanceImpl value,
          $Res Function(_$VirtualAccountBalanceImpl) then) =
      __$$VirtualAccountBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num currentBalance, num availableBalance});
}

/// @nodoc
class __$$VirtualAccountBalanceImplCopyWithImpl<$Res>
    extends _$VirtualAccountBalanceCopyWithImpl<$Res,
        _$VirtualAccountBalanceImpl>
    implements _$$VirtualAccountBalanceImplCopyWith<$Res> {
  __$$VirtualAccountBalanceImplCopyWithImpl(_$VirtualAccountBalanceImpl _value,
      $Res Function(_$VirtualAccountBalanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? availableBalance = null,
  }) {
    return _then(_$VirtualAccountBalanceImpl(
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as num,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualAccountBalanceImpl implements _VirtualAccountBalance {
  _$VirtualAccountBalanceImpl(
      {this.currentBalance = 0, this.availableBalance = 0});

  factory _$VirtualAccountBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualAccountBalanceImplFromJson(json);

  @override
  @JsonKey()
  final num currentBalance;
  @override
  @JsonKey()
  final num availableBalance;

  @override
  String toString() {
    return 'VirtualAccountBalance(currentBalance: $currentBalance, availableBalance: $availableBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualAccountBalanceImpl &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentBalance, availableBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualAccountBalanceImplCopyWith<_$VirtualAccountBalanceImpl>
      get copyWith => __$$VirtualAccountBalanceImplCopyWithImpl<
          _$VirtualAccountBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualAccountBalanceImplToJson(
      this,
    );
  }
}

abstract class _VirtualAccountBalance implements VirtualAccountBalance {
  factory _VirtualAccountBalance(
      {final num currentBalance,
      final num availableBalance}) = _$VirtualAccountBalanceImpl;

  factory _VirtualAccountBalance.fromJson(Map<String, dynamic> json) =
      _$VirtualAccountBalanceImpl.fromJson;

  @override
  num get currentBalance;
  @override
  num get availableBalance;
  @override
  @JsonKey(ignore: true)
  _$$VirtualAccountBalanceImplCopyWith<_$VirtualAccountBalanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
