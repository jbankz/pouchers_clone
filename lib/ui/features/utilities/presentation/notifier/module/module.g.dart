// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$billersHash() => r'aa43e2e4f064e4b02e3f6900de03d1674efa4991';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [billers].
@ProviderFor(billers)
const billersProvider = BillersFamily();

/// See also [billers].
class BillersFamily extends Family<AsyncValue<List<Billers>>> {
  /// See also [billers].
  const BillersFamily();

  /// See also [billers].
  BillersProvider call({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) {
    return BillersProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  BillersProvider getProviderOverride(
    covariant BillersProvider provider,
  ) {
    return call(
      parameter: provider.parameter,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'billersProvider';
}

/// See also [billers].
class BillersProvider extends AutoDisposeFutureProvider<List<Billers>> {
  /// See also [billers].
  BillersProvider({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => billers(
            ref as BillersRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: billersProvider,
          name: r'billersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$billersHash,
          dependencies: BillersFamily._dependencies,
          allTransitiveDependencies: BillersFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  BillersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final BillersDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<Billers>> Function(BillersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BillersProvider._internal(
        (ref) => create(ref as BillersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parameter: parameter,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Billers>> createElement() {
    return _BillersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BillersProvider &&
        other.parameter == parameter &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BillersRef on AutoDisposeFutureProviderRef<List<Billers>> {
  /// The parameter `parameter` of this provider.
  BillersDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _BillersProviderElement
    extends AutoDisposeFutureProviderElement<List<Billers>> with BillersRef {
  _BillersProviderElement(super.provider);

  @override
  BillersDto get parameter => (origin as BillersProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as BillersProvider).cancelToken;
}

String _$billersDiscountsHash() => r'b4b254d66f6f8bd852e6852136c9df51b8d64008';

/// See also [billersDiscounts].
@ProviderFor(billersDiscounts)
const billersDiscountsProvider = BillersDiscountsFamily();

/// See also [billersDiscounts].
class BillersDiscountsFamily extends Family<AsyncValue<Discounts?>> {
  /// See also [billersDiscounts].
  const BillersDiscountsFamily();

  /// See also [billersDiscounts].
  BillersDiscountsProvider call({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) {
    return BillersDiscountsProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  BillersDiscountsProvider getProviderOverride(
    covariant BillersDiscountsProvider provider,
  ) {
    return call(
      parameter: provider.parameter,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'billersDiscountsProvider';
}

/// See also [billersDiscounts].
class BillersDiscountsProvider extends AutoDisposeFutureProvider<Discounts?> {
  /// See also [billersDiscounts].
  BillersDiscountsProvider({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => billersDiscounts(
            ref as BillersDiscountsRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: billersDiscountsProvider,
          name: r'billersDiscountsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$billersDiscountsHash,
          dependencies: BillersDiscountsFamily._dependencies,
          allTransitiveDependencies:
              BillersDiscountsFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  BillersDiscountsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final BillersDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Discounts?> Function(BillersDiscountsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BillersDiscountsProvider._internal(
        (ref) => create(ref as BillersDiscountsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parameter: parameter,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Discounts?> createElement() {
    return _BillersDiscountsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BillersDiscountsProvider &&
        other.parameter == parameter &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BillersDiscountsRef on AutoDisposeFutureProviderRef<Discounts?> {
  /// The parameter `parameter` of this provider.
  BillersDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _BillersDiscountsProviderElement
    extends AutoDisposeFutureProviderElement<Discounts?>
    with BillersDiscountsRef {
  _BillersDiscountsProviderElement(super.provider);

  @override
  BillersDto get parameter => (origin as BillersDiscountsProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as BillersDiscountsProvider).cancelToken;
}

String _$airtimeTopDealsHash() => r'29c2b880745a183ac5709a44d44802c9c103b034';

/// See also [airtimeTopDeals].
@ProviderFor(airtimeTopDeals)
final airtimeTopDealsProvider =
    AutoDisposeProvider<List<AirtimeTopDeals>>.internal(
  airtimeTopDeals,
  name: r'airtimeTopDealsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$airtimeTopDealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AirtimeTopDealsRef = AutoDisposeProviderRef<List<AirtimeTopDeals>>;
String _$utilityPurchaseHash() => r'ff7e41b2f4967d6690a134384204ca9c346a1cfa';

/// See also [utilityPurchase].
@ProviderFor(utilityPurchase)
const utilityPurchaseProvider = UtilityPurchaseFamily();

/// See also [utilityPurchase].
class UtilityPurchaseFamily extends Family<AsyncValue<Utility?>> {
  /// See also [utilityPurchase].
  const UtilityPurchaseFamily();

  /// See also [utilityPurchase].
  UtilityPurchaseProvider call({
    required MobileDto parameter,
    CancelToken? cancelToken,
  }) {
    return UtilityPurchaseProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  UtilityPurchaseProvider getProviderOverride(
    covariant UtilityPurchaseProvider provider,
  ) {
    return call(
      parameter: provider.parameter,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'utilityPurchaseProvider';
}

/// See also [utilityPurchase].
class UtilityPurchaseProvider extends AutoDisposeFutureProvider<Utility?> {
  /// See also [utilityPurchase].
  UtilityPurchaseProvider({
    required MobileDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => utilityPurchase(
            ref as UtilityPurchaseRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: utilityPurchaseProvider,
          name: r'utilityPurchaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$utilityPurchaseHash,
          dependencies: UtilityPurchaseFamily._dependencies,
          allTransitiveDependencies:
              UtilityPurchaseFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  UtilityPurchaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final MobileDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Utility?> Function(UtilityPurchaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UtilityPurchaseProvider._internal(
        (ref) => create(ref as UtilityPurchaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parameter: parameter,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Utility?> createElement() {
    return _UtilityPurchaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UtilityPurchaseProvider &&
        other.parameter == parameter &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UtilityPurchaseRef on AutoDisposeFutureProviderRef<Utility?> {
  /// The parameter `parameter` of this provider.
  MobileDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _UtilityPurchaseProviderElement
    extends AutoDisposeFutureProviderElement<Utility?> with UtilityPurchaseRef {
  _UtilityPurchaseProviderElement(super.provider);

  @override
  MobileDto get parameter => (origin as UtilityPurchaseProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as UtilityPurchaseProvider).cancelToken;
}

String _$mobileDataServicesHash() =>
    r'9299d6e5a66817da5cb9d26461026087006ad6d4';

/// See also [mobileDataServices].
@ProviderFor(mobileDataServices)
const mobileDataServicesProvider = MobileDataServicesFamily();

/// See also [mobileDataServices].
class MobileDataServicesFamily
    extends Family<AsyncValue<List<MobileOperatorServices>>> {
  /// See also [mobileDataServices].
  const MobileDataServicesFamily();

  /// See also [mobileDataServices].
  MobileDataServicesProvider call({
    required MobileDto parameter,
    CancelToken? cancelToken,
  }) {
    return MobileDataServicesProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  MobileDataServicesProvider getProviderOverride(
    covariant MobileDataServicesProvider provider,
  ) {
    return call(
      parameter: provider.parameter,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mobileDataServicesProvider';
}

/// See also [mobileDataServices].
class MobileDataServicesProvider
    extends AutoDisposeFutureProvider<List<MobileOperatorServices>> {
  /// See also [mobileDataServices].
  MobileDataServicesProvider({
    required MobileDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => mobileDataServices(
            ref as MobileDataServicesRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: mobileDataServicesProvider,
          name: r'mobileDataServicesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mobileDataServicesHash,
          dependencies: MobileDataServicesFamily._dependencies,
          allTransitiveDependencies:
              MobileDataServicesFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  MobileDataServicesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final MobileDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<MobileOperatorServices>> Function(
            MobileDataServicesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MobileDataServicesProvider._internal(
        (ref) => create(ref as MobileDataServicesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parameter: parameter,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MobileOperatorServices>>
      createElement() {
    return _MobileDataServicesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MobileDataServicesProvider &&
        other.parameter == parameter &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MobileDataServicesRef
    on AutoDisposeFutureProviderRef<List<MobileOperatorServices>> {
  /// The parameter `parameter` of this provider.
  MobileDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _MobileDataServicesProviderElement
    extends AutoDisposeFutureProviderElement<List<MobileOperatorServices>>
    with MobileDataServicesRef {
  _MobileDataServicesProviderElement(super.provider);

  @override
  MobileDto get parameter => (origin as MobileDataServicesProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as MobileDataServicesProvider).cancelToken;
}

String _$scheduleHash() => r'd41c609836d1c6d091bf7fc98e5bde9f4ac0ffd4';

/// See also [schedule].
@ProviderFor(schedule)
const scheduleProvider = ScheduleFamily();

/// See also [schedule].
class ScheduleFamily extends Family<AsyncValue<Schedule?>> {
  /// See also [schedule].
  const ScheduleFamily();

  /// See also [schedule].
  ScheduleProvider call({
    required MobileDto parameter,
    CancelToken? cancelToken,
  }) {
    return ScheduleProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  ScheduleProvider getProviderOverride(
    covariant ScheduleProvider provider,
  ) {
    return call(
      parameter: provider.parameter,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scheduleProvider';
}

/// See also [schedule].
class ScheduleProvider extends AutoDisposeFutureProvider<Schedule?> {
  /// See also [schedule].
  ScheduleProvider({
    required MobileDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => schedule(
            ref as ScheduleRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: scheduleProvider,
          name: r'scheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleHash,
          dependencies: ScheduleFamily._dependencies,
          allTransitiveDependencies: ScheduleFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  ScheduleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final MobileDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Schedule?> Function(ScheduleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleProvider._internal(
        (ref) => create(ref as ScheduleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parameter: parameter,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Schedule?> createElement() {
    return _ScheduleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleProvider &&
        other.parameter == parameter &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScheduleRef on AutoDisposeFutureProviderRef<Schedule?> {
  /// The parameter `parameter` of this provider.
  MobileDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ScheduleProviderElement
    extends AutoDisposeFutureProviderElement<Schedule?> with ScheduleRef {
  _ScheduleProviderElement(super.provider);

  @override
  MobileDto get parameter => (origin as ScheduleProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as ScheduleProvider).cancelToken;
}

String _$cableServicesHash() => r'15f512e485139107171b75f159c60b500f3c9d05';

/// See also [cableServices].
@ProviderFor(cableServices)
const cableServicesProvider = CableServicesFamily();

/// See also [cableServices].
class CableServicesFamily extends Family<AsyncValue<GetCableService>> {
  /// See also [cableServices].
  const CableServicesFamily();

  /// See also [cableServices].
  CableServicesProvider call({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) {
    return CableServicesProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  CableServicesProvider getProviderOverride(
    covariant CableServicesProvider provider,
  ) {
    return call(
      parameter: provider.parameter,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cableServicesProvider';
}

/// See also [cableServices].
class CableServicesProvider extends AutoDisposeFutureProvider<GetCableService> {
  /// See also [cableServices].
  CableServicesProvider({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => cableServices(
            ref as CableServicesRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: cableServicesProvider,
          name: r'cableServicesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cableServicesHash,
          dependencies: CableServicesFamily._dependencies,
          allTransitiveDependencies:
              CableServicesFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  CableServicesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final BillersDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<GetCableService> Function(CableServicesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CableServicesProvider._internal(
        (ref) => create(ref as CableServicesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parameter: parameter,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GetCableService> createElement() {
    return _CableServicesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CableServicesProvider &&
        other.parameter == parameter &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CableServicesRef on AutoDisposeFutureProviderRef<GetCableService> {
  /// The parameter `parameter` of this provider.
  BillersDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _CableServicesProviderElement
    extends AutoDisposeFutureProviderElement<GetCableService>
    with CableServicesRef {
  _CableServicesProviderElement(super.provider);

  @override
  BillersDto get parameter => (origin as CableServicesProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as CableServicesProvider).cancelToken;
}

String _$validateCustomerInfoHash() =>
    r'b48c76e96de92fe2ac48710634f32dde3992ac3e';

/// See also [validateCustomerInfo].
@ProviderFor(validateCustomerInfo)
const validateCustomerInfoProvider = ValidateCustomerInfoFamily();

/// See also [validateCustomerInfo].
class ValidateCustomerInfoFamily extends Family<AsyncValue<ValidateCustomer>> {
  /// See also [validateCustomerInfo].
  const ValidateCustomerInfoFamily();

  /// See also [validateCustomerInfo].
  ValidateCustomerInfoProvider call({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) {
    return ValidateCustomerInfoProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  ValidateCustomerInfoProvider getProviderOverride(
    covariant ValidateCustomerInfoProvider provider,
  ) {
    return call(
      parameter: provider.parameter,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'validateCustomerInfoProvider';
}

/// See also [validateCustomerInfo].
class ValidateCustomerInfoProvider
    extends AutoDisposeFutureProvider<ValidateCustomer> {
  /// See also [validateCustomerInfo].
  ValidateCustomerInfoProvider({
    required BillersDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validateCustomerInfo(
            ref as ValidateCustomerInfoRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: validateCustomerInfoProvider,
          name: r'validateCustomerInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validateCustomerInfoHash,
          dependencies: ValidateCustomerInfoFamily._dependencies,
          allTransitiveDependencies:
              ValidateCustomerInfoFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  ValidateCustomerInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final BillersDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<ValidateCustomer> Function(ValidateCustomerInfoRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidateCustomerInfoProvider._internal(
        (ref) => create(ref as ValidateCustomerInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parameter: parameter,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ValidateCustomer> createElement() {
    return _ValidateCustomerInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateCustomerInfoProvider &&
        other.parameter == parameter &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ValidateCustomerInfoRef
    on AutoDisposeFutureProviderRef<ValidateCustomer> {
  /// The parameter `parameter` of this provider.
  BillersDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ValidateCustomerInfoProviderElement
    extends AutoDisposeFutureProviderElement<ValidateCustomer>
    with ValidateCustomerInfoRef {
  _ValidateCustomerInfoProviderElement(super.provider);

  @override
  BillersDto get parameter =>
      (origin as ValidateCustomerInfoProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as ValidateCustomerInfoProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
