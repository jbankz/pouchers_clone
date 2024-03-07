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
  bool get isGuest => throw _privateConstructorUsedError;
  bool get isBusy => throw _privateConstructorUsedError;
  bool get isPurchasing => throw _privateConstructorUsedError;
  bool get isGettingServices => throw _privateConstructorUsedError;
  bool get isScheduling => throw _privateConstructorUsedError;
  bool get isValidatingCustomerInfo => throw _privateConstructorUsedError;
  bool get isGettingDiscount => throw _privateConstructorUsedError;
  bool get isGettingUssd => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  List<Billers> get billers => throw _privateConstructorUsedError;
  DiscountsData? get discounts => throw _privateConstructorUsedError;
  List<AirtimeTopDeals> get airtimeTopDeals =>
      throw _privateConstructorUsedError;
  List<MobileOperatorServices> get mobileOperatorServices =>
      throw _privateConstructorUsedError;
  ValidateCustomer? get validateCustomerInfo =>
      throw _privateConstructorUsedError;
  GetCableService? get cableService => throw _privateConstructorUsedError;
  MobileDto? get mobileDto => throw _privateConstructorUsedError;
  GuestServicesPurchase? get guestServicesPurchase =>
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
      {bool isGuest,
      bool isBusy,
      bool isPurchasing,
      bool isGettingServices,
      bool isScheduling,
      bool isValidatingCustomerInfo,
      bool isGettingDiscount,
      bool isGettingUssd,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Billers> billers,
      DiscountsData? discounts,
      List<AirtimeTopDeals> airtimeTopDeals,
      List<MobileOperatorServices> mobileOperatorServices,
      ValidateCustomer? validateCustomerInfo,
      GetCableService? cableService,
      MobileDto? mobileDto,
      GuestServicesPurchase? guestServicesPurchase});

  $DiscountsDataCopyWith<$Res>? get discounts;
  $ValidateCustomerCopyWith<$Res>? get validateCustomerInfo;
  $GetCableServiceCopyWith<$Res>? get cableService;
  $GuestServicesPurchaseCopyWith<$Res>? get guestServicesPurchase;
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
    Object? isGuest = null,
    Object? isBusy = null,
    Object? isPurchasing = null,
    Object? isGettingServices = null,
    Object? isScheduling = null,
    Object? isValidatingCustomerInfo = null,
    Object? isGettingDiscount = null,
    Object? isGettingUssd = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? billers = null,
    Object? discounts = freezed,
    Object? airtimeTopDeals = null,
    Object? mobileOperatorServices = null,
    Object? validateCustomerInfo = freezed,
    Object? cableService = freezed,
    Object? mobileDto = freezed,
    Object? guestServicesPurchase = freezed,
  }) {
    return _then(_value.copyWith(
      isGuest: null == isGuest
          ? _value.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as bool,
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
      isValidatingCustomerInfo: null == isValidatingCustomerInfo
          ? _value.isValidatingCustomerInfo
          : isValidatingCustomerInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      isGettingDiscount: null == isGettingDiscount
          ? _value.isGettingDiscount
          : isGettingDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      isGettingUssd: null == isGettingUssd
          ? _value.isGettingUssd
          : isGettingUssd // ignore: cast_nullable_to_non_nullable
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
              as DiscountsData?,
      airtimeTopDeals: null == airtimeTopDeals
          ? _value.airtimeTopDeals
          : airtimeTopDeals // ignore: cast_nullable_to_non_nullable
              as List<AirtimeTopDeals>,
      mobileOperatorServices: null == mobileOperatorServices
          ? _value.mobileOperatorServices
          : mobileOperatorServices // ignore: cast_nullable_to_non_nullable
              as List<MobileOperatorServices>,
      validateCustomerInfo: freezed == validateCustomerInfo
          ? _value.validateCustomerInfo
          : validateCustomerInfo // ignore: cast_nullable_to_non_nullable
              as ValidateCustomer?,
      cableService: freezed == cableService
          ? _value.cableService
          : cableService // ignore: cast_nullable_to_non_nullable
              as GetCableService?,
      mobileDto: freezed == mobileDto
          ? _value.mobileDto
          : mobileDto // ignore: cast_nullable_to_non_nullable
              as MobileDto?,
      guestServicesPurchase: freezed == guestServicesPurchase
          ? _value.guestServicesPurchase
          : guestServicesPurchase // ignore: cast_nullable_to_non_nullable
              as GuestServicesPurchase?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountsDataCopyWith<$Res>? get discounts {
    if (_value.discounts == null) {
      return null;
    }

    return $DiscountsDataCopyWith<$Res>(_value.discounts!, (value) {
      return _then(_value.copyWith(discounts: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidateCustomerCopyWith<$Res>? get validateCustomerInfo {
    if (_value.validateCustomerInfo == null) {
      return null;
    }

    return $ValidateCustomerCopyWith<$Res>(_value.validateCustomerInfo!,
        (value) {
      return _then(_value.copyWith(validateCustomerInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GetCableServiceCopyWith<$Res>? get cableService {
    if (_value.cableService == null) {
      return null;
    }

    return $GetCableServiceCopyWith<$Res>(_value.cableService!, (value) {
      return _then(_value.copyWith(cableService: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GuestServicesPurchaseCopyWith<$Res>? get guestServicesPurchase {
    if (_value.guestServicesPurchase == null) {
      return null;
    }

    return $GuestServicesPurchaseCopyWith<$Res>(_value.guestServicesPurchase!,
        (value) {
      return _then(_value.copyWith(guestServicesPurchase: value) as $Val);
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
      {bool isGuest,
      bool isBusy,
      bool isPurchasing,
      bool isGettingServices,
      bool isScheduling,
      bool isValidatingCustomerInfo,
      bool isGettingDiscount,
      bool isGettingUssd,
      String? errorMessage,
      StackTrace? stackTrace,
      List<Billers> billers,
      DiscountsData? discounts,
      List<AirtimeTopDeals> airtimeTopDeals,
      List<MobileOperatorServices> mobileOperatorServices,
      ValidateCustomer? validateCustomerInfo,
      GetCableService? cableService,
      MobileDto? mobileDto,
      GuestServicesPurchase? guestServicesPurchase});

  @override
  $DiscountsDataCopyWith<$Res>? get discounts;
  @override
  $ValidateCustomerCopyWith<$Res>? get validateCustomerInfo;
  @override
  $GetCableServiceCopyWith<$Res>? get cableService;
  @override
  $GuestServicesPurchaseCopyWith<$Res>? get guestServicesPurchase;
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
    Object? isGuest = null,
    Object? isBusy = null,
    Object? isPurchasing = null,
    Object? isGettingServices = null,
    Object? isScheduling = null,
    Object? isValidatingCustomerInfo = null,
    Object? isGettingDiscount = null,
    Object? isGettingUssd = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? billers = null,
    Object? discounts = freezed,
    Object? airtimeTopDeals = null,
    Object? mobileOperatorServices = null,
    Object? validateCustomerInfo = freezed,
    Object? cableService = freezed,
    Object? mobileDto = freezed,
    Object? guestServicesPurchase = freezed,
  }) {
    return _then(_$BillersStateImpl<T>(
      isGuest: null == isGuest
          ? _value.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as bool,
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
      isValidatingCustomerInfo: null == isValidatingCustomerInfo
          ? _value.isValidatingCustomerInfo
          : isValidatingCustomerInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      isGettingDiscount: null == isGettingDiscount
          ? _value.isGettingDiscount
          : isGettingDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      isGettingUssd: null == isGettingUssd
          ? _value.isGettingUssd
          : isGettingUssd // ignore: cast_nullable_to_non_nullable
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
              as DiscountsData?,
      airtimeTopDeals: null == airtimeTopDeals
          ? _value._airtimeTopDeals
          : airtimeTopDeals // ignore: cast_nullable_to_non_nullable
              as List<AirtimeTopDeals>,
      mobileOperatorServices: null == mobileOperatorServices
          ? _value._mobileOperatorServices
          : mobileOperatorServices // ignore: cast_nullable_to_non_nullable
              as List<MobileOperatorServices>,
      validateCustomerInfo: freezed == validateCustomerInfo
          ? _value.validateCustomerInfo
          : validateCustomerInfo // ignore: cast_nullable_to_non_nullable
              as ValidateCustomer?,
      cableService: freezed == cableService
          ? _value.cableService
          : cableService // ignore: cast_nullable_to_non_nullable
              as GetCableService?,
      mobileDto: freezed == mobileDto
          ? _value.mobileDto
          : mobileDto // ignore: cast_nullable_to_non_nullable
              as MobileDto?,
      guestServicesPurchase: freezed == guestServicesPurchase
          ? _value.guestServicesPurchase
          : guestServicesPurchase // ignore: cast_nullable_to_non_nullable
              as GuestServicesPurchase?,
    ));
  }
}

/// @nodoc

class _$BillersStateImpl<T> implements _BillersState<T> {
  const _$BillersStateImpl(
      {this.isGuest = false,
      this.isBusy = false,
      this.isPurchasing = false,
      this.isGettingServices = false,
      this.isScheduling = false,
      this.isValidatingCustomerInfo = false,
      this.isGettingDiscount = false,
      this.isGettingUssd = false,
      this.errorMessage,
      this.stackTrace,
      final List<Billers> billers = const [],
      this.discounts,
      final List<AirtimeTopDeals> airtimeTopDeals = const [],
      final List<MobileOperatorServices> mobileOperatorServices = const [],
      this.validateCustomerInfo,
      this.cableService,
      this.mobileDto,
      this.guestServicesPurchase})
      : _billers = billers,
        _airtimeTopDeals = airtimeTopDeals,
        _mobileOperatorServices = mobileOperatorServices;

  @override
  @JsonKey()
  final bool isGuest;
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
  @JsonKey()
  final bool isValidatingCustomerInfo;
  @override
  @JsonKey()
  final bool isGettingDiscount;
  @override
  @JsonKey()
  final bool isGettingUssd;
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
  final DiscountsData? discounts;
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
  final ValidateCustomer? validateCustomerInfo;
  @override
  final GetCableService? cableService;
  @override
  final MobileDto? mobileDto;
  @override
  final GuestServicesPurchase? guestServicesPurchase;

  @override
  String toString() {
    return 'BillersState<$T>(isGuest: $isGuest, isBusy: $isBusy, isPurchasing: $isPurchasing, isGettingServices: $isGettingServices, isScheduling: $isScheduling, isValidatingCustomerInfo: $isValidatingCustomerInfo, isGettingDiscount: $isGettingDiscount, isGettingUssd: $isGettingUssd, errorMessage: $errorMessage, stackTrace: $stackTrace, billers: $billers, discounts: $discounts, airtimeTopDeals: $airtimeTopDeals, mobileOperatorServices: $mobileOperatorServices, validateCustomerInfo: $validateCustomerInfo, cableService: $cableService, mobileDto: $mobileDto, guestServicesPurchase: $guestServicesPurchase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillersStateImpl<T> &&
            (identical(other.isGuest, isGuest) || other.isGuest == isGuest) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.isPurchasing, isPurchasing) ||
                other.isPurchasing == isPurchasing) &&
            (identical(other.isGettingServices, isGettingServices) ||
                other.isGettingServices == isGettingServices) &&
            (identical(other.isScheduling, isScheduling) ||
                other.isScheduling == isScheduling) &&
            (identical(
                    other.isValidatingCustomerInfo, isValidatingCustomerInfo) ||
                other.isValidatingCustomerInfo == isValidatingCustomerInfo) &&
            (identical(other.isGettingDiscount, isGettingDiscount) ||
                other.isGettingDiscount == isGettingDiscount) &&
            (identical(other.isGettingUssd, isGettingUssd) ||
                other.isGettingUssd == isGettingUssd) &&
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
                other._mobileOperatorServices, _mobileOperatorServices) &&
            (identical(other.validateCustomerInfo, validateCustomerInfo) ||
                other.validateCustomerInfo == validateCustomerInfo) &&
            (identical(other.cableService, cableService) ||
                other.cableService == cableService) &&
            (identical(other.mobileDto, mobileDto) ||
                other.mobileDto == mobileDto) &&
            (identical(other.guestServicesPurchase, guestServicesPurchase) ||
                other.guestServicesPurchase == guestServicesPurchase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isGuest,
      isBusy,
      isPurchasing,
      isGettingServices,
      isScheduling,
      isValidatingCustomerInfo,
      isGettingDiscount,
      isGettingUssd,
      errorMessage,
      stackTrace,
      const DeepCollectionEquality().hash(_billers),
      discounts,
      const DeepCollectionEquality().hash(_airtimeTopDeals),
      const DeepCollectionEquality().hash(_mobileOperatorServices),
      validateCustomerInfo,
      cableService,
      mobileDto,
      guestServicesPurchase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillersStateImplCopyWith<T, _$BillersStateImpl<T>> get copyWith =>
      __$$BillersStateImplCopyWithImpl<T, _$BillersStateImpl<T>>(
          this, _$identity);
}

abstract class _BillersState<T> implements BillersState<T> {
  const factory _BillersState(
          {final bool isGuest,
          final bool isBusy,
          final bool isPurchasing,
          final bool isGettingServices,
          final bool isScheduling,
          final bool isValidatingCustomerInfo,
          final bool isGettingDiscount,
          final bool isGettingUssd,
          final String? errorMessage,
          final StackTrace? stackTrace,
          final List<Billers> billers,
          final DiscountsData? discounts,
          final List<AirtimeTopDeals> airtimeTopDeals,
          final List<MobileOperatorServices> mobileOperatorServices,
          final ValidateCustomer? validateCustomerInfo,
          final GetCableService? cableService,
          final MobileDto? mobileDto,
          final GuestServicesPurchase? guestServicesPurchase}) =
      _$BillersStateImpl<T>;

  @override
  bool get isGuest;
  @override
  bool get isBusy;
  @override
  bool get isPurchasing;
  @override
  bool get isGettingServices;
  @override
  bool get isScheduling;
  @override
  bool get isValidatingCustomerInfo;
  @override
  bool get isGettingDiscount;
  @override
  bool get isGettingUssd;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  List<Billers> get billers;
  @override
  DiscountsData? get discounts;
  @override
  List<AirtimeTopDeals> get airtimeTopDeals;
  @override
  List<MobileOperatorServices> get mobileOperatorServices;
  @override
  ValidateCustomer? get validateCustomerInfo;
  @override
  GetCableService? get cableService;
  @override
  MobileDto? get mobileDto;
  @override
  GuestServicesPurchase? get guestServicesPurchase;
  @override
  @JsonKey(ignore: true)
  _$$BillersStateImplCopyWith<T, _$BillersStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
