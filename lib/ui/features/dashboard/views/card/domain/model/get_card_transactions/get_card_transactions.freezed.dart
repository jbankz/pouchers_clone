// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_card_transactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetCardTransactions _$GetCardTransactionsFromJson(Map<String, dynamic> json) {
  return _GetCardTransactions.fromJson(json);
}

/// @nodoc
mixin _$GetCardTransactions {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  List<Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCardTransactionsCopyWith<GetCardTransactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCardTransactionsCopyWith<$Res> {
  factory $GetCardTransactionsCopyWith(
          GetCardTransactions value, $Res Function(GetCardTransactions) then) =
      _$GetCardTransactionsCopyWithImpl<$Res, GetCardTransactions>;
  @useResult
  $Res call({String? status, String? message, int? code, List<Datum>? data});
}

/// @nodoc
class _$GetCardTransactionsCopyWithImpl<$Res, $Val extends GetCardTransactions>
    implements $GetCardTransactionsCopyWith<$Res> {
  _$GetCardTransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCardTransactionsImplCopyWith<$Res>
    implements $GetCardTransactionsCopyWith<$Res> {
  factory _$$GetCardTransactionsImplCopyWith(_$GetCardTransactionsImpl value,
          $Res Function(_$GetCardTransactionsImpl) then) =
      __$$GetCardTransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, int? code, List<Datum>? data});
}

/// @nodoc
class __$$GetCardTransactionsImplCopyWithImpl<$Res>
    extends _$GetCardTransactionsCopyWithImpl<$Res, _$GetCardTransactionsImpl>
    implements _$$GetCardTransactionsImplCopyWith<$Res> {
  __$$GetCardTransactionsImplCopyWithImpl(_$GetCardTransactionsImpl _value,
      $Res Function(_$GetCardTransactionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetCardTransactionsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCardTransactionsImpl implements _GetCardTransactions {
  _$GetCardTransactionsImpl(
      {this.status, this.message, this.code, final List<Datum>? data})
      : _data = data;

  factory _$GetCardTransactionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCardTransactionsImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final int? code;
  final List<Datum>? _data;
  @override
  List<Datum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetCardTransactions(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardTransactionsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCardTransactionsImplCopyWith<_$GetCardTransactionsImpl> get copyWith =>
      __$$GetCardTransactionsImplCopyWithImpl<_$GetCardTransactionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCardTransactionsImplToJson(
      this,
    );
  }
}

abstract class _GetCardTransactions implements GetCardTransactions {
  factory _GetCardTransactions(
      {final String? status,
      final String? message,
      final int? code,
      final List<Datum>? data}) = _$GetCardTransactionsImpl;

  factory _GetCardTransactions.fromJson(Map<String, dynamic> json) =
      _$GetCardTransactionsImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  List<Datum>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetCardTransactionsImplCopyWith<_$GetCardTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
