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
  bool get isPurchasing => throw _privateConstructorUsedError;
  bool get isGettingServices => throw _privateConstructorUsedError;
  bool get isScheduling => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  List<Billers> get billers => throw _privateConstructorUsedError;
  Discounts? get discounts => throw _privateConstructorUsedError;
  List<AirtimeTopDeals> get airtimeTopDeals =>
      throw _privateConstructorUsedError;
  List<MobileOperatorServices> get mobileOperatorServices =>
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
      bool isPurchasing,
      bool isGettingServices,
      bool isScheduling,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Billers> billers,
      Discounts? discounts,
      List<AirtimeTopDeals> airtimeTopDeals,
      List<MobileOperatorServices> mobileOperatorServices});

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
    Object? isPurchasing = null,
    Object? isGettingServices = null,
    Object? isScheduling = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? billers = null,
    Object? discounts = freezed,
    Object? airtimeTopDeals = null,
    Object? mobileOperatorServices = null,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isGettingServices: null == isGettingServices
          ? _value.isGettingServices
          : isGettingServices // ignore: cast_nullable_to_non_nullable
              as bool,
      isScheduling: null == isScheduling
          ? _value.isScheduling
          : isScheduling // ignore: cast_nullable_to_non_nullable
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
      mobileOperatorServices: null == mobileOperatorServices
          ? _value.mobileOperatorServices
          : mobileOperatorServices // ignore: cast_nullable_to_non_nullable
              as List<MobileOperatorServices>,
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
      bool isPurchasing,
      bool isGettingServices,
      bool isScheduling,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Billers> billers,
      Discounts? discounts,
      List<AirtimeTopDeals> airtimeTopDeals,
      List<MobileOperatorServices> mobileOperatorServices});

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
    Object? isPurchasing = null,
    Object? isGettingServices = null,
    Object? isScheduling = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? billers = null,
    Object? discounts = freezed,
    Object? airtimeTopDeals = null,
    Object? mobileOperatorServices = null,
  }) {
    return _then(_$BillersStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isGettingServices: null == isGettingServices
          ? _value.isGettingServices
          : isGettingServices // ignore: cast_nullable_to_non_nullable
              as bool,
      isScheduling: null == isScheduling
          ? _value.isScheduling
          : isScheduling // ignore: cast_nullable_to_non_nullable
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
      mobileOperatorServices: null == mobileOperatorServices
          ? _value._mobileOperatorServices
          : mobileOperatorServices // ignore: cast_nullable_to_non_nullable
              as List<MobileOperatorServices>,
    ));
  }
}

/// @nodoc

class _$BillersStateImpl<T> implements _BillersState<T> {
  const _$BillersStateImpl(
      {this.isBusy = false,
      this.isPurchasing = false,
      this.isGettingServices = false,
      this.isScheduling = false,
      this.errorMessage,
      this.stackTrace,
      final List<Billers> billers = const [],
      this.discounts,
      final List<AirtimeTopDeals> airtimeTopDeals = const [],
      final List<MobileOperatorServices> mobileOperatorServices = const []})
      : _billers = billers,
        _airtimeTopDeals = airtimeTopDeals,
        _mobileOperatorServices = mobileOperatorServices;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  @JsonKey()
  final bool isPurchasing;
  @override
  @JsonKey()
  final bool isGettingServices;
  @override
  @JsonKey()
  final bool isScheduling;
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

  final List<MobileOperatorServices> _mobileOperatorServices;
  @override
  @JsonKey()
  List<MobileOperatorServices> get mobileOperatorServices {
    if (_mobileOperatorServices is EqualUnmodifiableListView)
      return _mobileOperatorServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mobileOperatorServices);
  }

  @override
  String toString() {
    return 'BillersState<$T>(isBusy: $isBusy, isPurchasing: $isPurchasing, isGettingServices: $isGettingServices, isScheduling: $isScheduling, errorMessage: $errorMessage, stackTrace: $stackTrace, billers: $billers, discounts: $discounts, airtimeTopDeals: $airtimeTopDeals, mobileOperatorServices: $mobileOperatorServices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillersStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.isPurchasing, isPurchasing) ||
                other.isPurchasing == isPurchasing) &&
            (identical(other.isGettingServices, isGettingServices) ||
                other.isGettingServices == isGettingServices) &&
            (identical(other.isScheduling, isScheduling) ||
                other.isScheduling == isScheduling) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            const DeepCollectionEquality().equals(other._billers, _billers) &&
            (identical(other.discounts, discounts) ||
                other.discounts == discounts) &&
            const DeepCollectionEquality()
                .equals(other._airtimeTopDeals, _airtimeTopDeals) &&
            const DeepCollectionEquality().equals(
                other._mobileOperatorServices, _mobileOperatorServices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      isPurchasing,
      isGettingServices,
      isScheduling,
      errorMessage,
      stackTrace,
      const DeepCollectionEquality().hash(_billers),
      discounts,
      const DeepCollectionEquality().hash(_airtimeTopDeals),
      const DeepCollectionEquality().hash(_mobileOperatorServices));

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
          final bool isPurchasing,
          final bool isGettingServices,
          final bool isScheduling,
          final String? errorMessage,
          final StackTrace? stackTrace,
          final List<Billers> billers,
          final Discounts? discounts,
          final List<AirtimeTopDeals> airtimeTopDeals,
          final List<MobileOperatorServices> mobileOperatorServices}) =
      _$BillersStateImpl<T>;

  @override
  bool get isBusy;
  @override
  bool get isPurchasing;
  @override
  bool get isGettingServices;
  @override
  bool get isScheduling;
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
  List<MobileOperatorServices> get mobileOperatorServices;
  @override
  @JsonKey(ignore: true)
  _$$BillersStateImplCopyWith<T, _$BillersStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
