// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BillersState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  bool get purchasing => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  List<Billers> get billers => throw _privateConstructorUsedError;
  Discounts? get discounts => throw _privateConstructorUsedError;
  List<AirtimeTopDeals> get airtimeTopDeals =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillersStateCopyWith<T, BillersState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillersStateCopyWith<T, $Res> {
  factory $BillersStateCopyWith(
          BillersState<T> value, $Res Function(BillersState<T>) then) =
      _$BillersStateCopyWithImpl<T, $Res, BillersState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      bool purchasing,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Billers> billers,
      Discounts? discounts,
      List<AirtimeTopDeals> airtimeTopDeals});

  $DiscountsCopyWith<$Res>? get discounts;
}

/// @nodoc
class _$BillersStateCopyWithImpl<T, $Res, $Val extends BillersState<T>>
    implements $BillersStateCopyWith<T, $Res> {
  _$BillersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? purchasing = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? billers = null,
    Object? discounts = freezed,
    Object? airtimeTopDeals = null,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasing: null == purchasing
          ? _value.purchasing
          : purchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      billers: null == billers
          ? _value.billers
          : billers // ignore: cast_nullable_to_non_nullable
              as List<Billers>,
      discounts: freezed == discounts
          ? _value.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as Discounts?,
      airtimeTopDeals: null == airtimeTopDeals
          ? _value.airtimeTopDeals
          : airtimeTopDeals // ignore: cast_nullable_to_non_nullable
              as List<AirtimeTopDeals>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountsCopyWith<$Res>? get discounts {
    if (_value.discounts == null) {
      return null;
    }

    return $DiscountsCopyWith<$Res>(_value.discounts!, (value) {
      return _then(_value.copyWith(discounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillersStateImplCopyWith<T, $Res>
    implements $BillersStateCopyWith<T, $Res> {
  factory _$$BillersStateImplCopyWith(_$BillersStateImpl<T> value,
          $Res Function(_$BillersStateImpl<T>) then) =
      __$$BillersStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      bool purchasing,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Billers> billers,
      Discounts? discounts,
      List<AirtimeTopDeals> airtimeTopDeals});

  @override
  $DiscountsCopyWith<$Res>? get discounts;
}

/// @nodoc
class __$$BillersStateImplCopyWithImpl<T, $Res>
    extends _$BillersStateCopyWithImpl<T, $Res, _$BillersStateImpl<T>>
    implements _$$BillersStateImplCopyWith<T, $Res> {
  __$$BillersStateImplCopyWithImpl(
      _$BillersStateImpl<T> _value, $Res Function(_$BillersStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? purchasing = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? billers = null,
    Object? discounts = freezed,
    Object? airtimeTopDeals = null,
  }) {
    return _then(_$BillersStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasing: null == purchasing
          ? _value.purchasing
          : purchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      billers: null == billers
          ? _value._billers
          : billers // ignore: cast_nullable_to_non_nullable
              as List<Billers>,
      discounts: freezed == discounts
          ? _value.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as Discounts?,
      airtimeTopDeals: null == airtimeTopDeals
          ? _value._airtimeTopDeals
          : airtimeTopDeals // ignore: cast_nullable_to_non_nullable
              as List<AirtimeTopDeals>,
    ));
  }
}

/// @nodoc

class _$BillersStateImpl<T> implements _BillersState<T> {
  const _$BillersStateImpl(
      {this.isBusy = false,
      this.purchasing = false,
      this.errorMessage,
      this.stackTrace,
      final List<Billers> billers = const [],
      this.discounts,
      final List<AirtimeTopDeals> airtimeTopDeals = const []})
      : _billers = billers,
        _airtimeTopDeals = airtimeTopDeals;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  @JsonKey()
  final bool purchasing;
  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;
  final List<Billers> _billers;
  @override
  @JsonKey()
  List<Billers> get billers {
    if (_billers is EqualUnmodifiableListView) return _billers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billers);
  }

  @override
  final Discounts? discounts;
  final List<AirtimeTopDeals> _airtimeTopDeals;
  @override
  @JsonKey()
  List<AirtimeTopDeals> get airtimeTopDeals {
    if (_airtimeTopDeals is EqualUnmodifiableListView) return _airtimeTopDeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_airtimeTopDeals);
  }

  @override
  String toString() {
    return 'BillersState<$T>(isBusy: $isBusy, purchasing: $purchasing, errorMessage: $errorMessage, stackTrace: $stackTrace, billers: $billers, discounts: $discounts, airtimeTopDeals: $airtimeTopDeals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillersStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.purchasing, purchasing) ||
                other.purchasing == purchasing) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            const DeepCollectionEquality().equals(other._billers, _billers) &&
            (identical(other.discounts, discounts) ||
                other.discounts == discounts) &&
            const DeepCollectionEquality()
                .equals(other._airtimeTopDeals, _airtimeTopDeals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      purchasing,
      errorMessage,
      stackTrace,
      const DeepCollectionEquality().hash(_billers),
      discounts,
      const DeepCollectionEquality().hash(_airtimeTopDeals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillersStateImplCopyWith<T, _$BillersStateImpl<T>> get copyWith =>
      __$$BillersStateImplCopyWithImpl<T, _$BillersStateImpl<T>>(
          this, _$identity);
}

abstract class _BillersState<T> implements BillersState<T> {
  const factory _BillersState(
      {final bool isBusy,
      final bool purchasing,
      final String? errorMessage,
      final StackTrace? stackTrace,
      final List<Billers> billers,
      final Discounts? discounts,
      final List<AirtimeTopDeals> airtimeTopDeals}) = _$BillersStateImpl<T>;

  @override
  bool get isBusy;
  @override
  bool get purchasing;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  List<Billers> get billers;
  @override
  Discounts? get discounts;
  @override
  List<AirtimeTopDeals> get airtimeTopDeals;
  @override
  @JsonKey(ignore: true)
  _$$BillersStateImplCopyWith<T, _$BillersStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
