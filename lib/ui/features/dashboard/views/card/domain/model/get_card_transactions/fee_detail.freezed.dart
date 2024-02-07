// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeeDetail _$FeeDetailFromJson(Map<String, dynamic> json) {
  return _FeeDetail.fromJson(json);
}

/// @nodoc
mixin _$FeeDetail {
  String? get contract => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeDetailCopyWith<FeeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeDetailCopyWith<$Res> {
  factory $FeeDetailCopyWith(FeeDetail value, $Res Function(FeeDetail) then) =
      _$FeeDetailCopyWithImpl<$Res, FeeDetail>;
  @useResult
  $Res call(
      {String? contract,
      String? currency,
      int? amount,
      String? description,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$FeeDetailCopyWithImpl<$Res, $Val extends FeeDetail>
    implements $FeeDetailCopyWith<$Res> {
  _$FeeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = freezed,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeeDetailImplCopyWith<$Res>
    implements $FeeDetailCopyWith<$Res> {
  factory _$$FeeDetailImplCopyWith(
          _$FeeDetailImpl value, $Res Function(_$FeeDetailImpl) then) =
      __$$FeeDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? contract,
      String? currency,
      int? amount,
      String? description,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$FeeDetailImplCopyWithImpl<$Res>
    extends _$FeeDetailCopyWithImpl<$Res, _$FeeDetailImpl>
    implements _$$FeeDetailImplCopyWith<$Res> {
  __$$FeeDetailImplCopyWithImpl(
      _$FeeDetailImpl _value, $Res Function(_$FeeDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = freezed,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? id = freezed,
  }) {
    return _then(_$FeeDetailImpl(
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeeDetailImpl implements _FeeDetail {
  _$FeeDetailImpl(
      {this.contract,
      this.currency,
      this.amount,
      this.description,
      @JsonKey(name: '_id') this.id});

  factory _$FeeDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeDetailImplFromJson(json);

  @override
  final String? contract;
  @override
  final String? currency;
  @override
  final int? amount;
  @override
  final String? description;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'FeeDetail(contract: $contract, currency: $currency, amount: $amount, description: $description, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeDetailImpl &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contract, currency, amount, description, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeDetailImplCopyWith<_$FeeDetailImpl> get copyWith =>
      __$$FeeDetailImplCopyWithImpl<_$FeeDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeDetailImplToJson(
      this,
    );
  }
}

abstract class _FeeDetail implements FeeDetail {
  factory _FeeDetail(
      {final String? contract,
      final String? currency,
      final int? amount,
      final String? description,
      @JsonKey(name: '_id') final String? id}) = _$FeeDetailImpl;

  factory _FeeDetail.fromJson(Map<String, dynamic> json) =
      _$FeeDetailImpl.fromJson;

  @override
  String? get contract;
  @override
  String? get currency;
  @override
  int? get amount;
  @override
  String? get description;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$FeeDetailImplCopyWith<_$FeeDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
