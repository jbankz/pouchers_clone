// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchaseVoucherHash() => r'774b195c6dc6028bda72e74b0c1b23ceeb342e64';

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

/// See also [purchaseVoucher].
@ProviderFor(purchaseVoucher)
const purchaseVoucherProvider = PurchaseVoucherFamily();

/// See also [purchaseVoucher].
class PurchaseVoucherFamily extends Family<AsyncValue<BuyVoucher>> {
  /// See also [purchaseVoucher].
  const PurchaseVoucherFamily();

  /// See also [purchaseVoucher].
  PurchaseVoucherProvider call({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) {
    return PurchaseVoucherProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  PurchaseVoucherProvider getProviderOverride(
    covariant PurchaseVoucherProvider provider,
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
  String? get name => r'purchaseVoucherProvider';
}

/// See also [purchaseVoucher].
class PurchaseVoucherProvider extends AutoDisposeFutureProvider<BuyVoucher> {
  /// See also [purchaseVoucher].
  PurchaseVoucherProvider({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => purchaseVoucher(
            ref as PurchaseVoucherRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: purchaseVoucherProvider,
          name: r'purchaseVoucherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$purchaseVoucherHash,
          dependencies: PurchaseVoucherFamily._dependencies,
          allTransitiveDependencies:
              PurchaseVoucherFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  PurchaseVoucherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final VoucherDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<BuyVoucher> Function(PurchaseVoucherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PurchaseVoucherProvider._internal(
        (ref) => create(ref as PurchaseVoucherRef),
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
  AutoDisposeFutureProviderElement<BuyVoucher> createElement() {
    return _PurchaseVoucherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PurchaseVoucherProvider &&
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

mixin PurchaseVoucherRef on AutoDisposeFutureProviderRef<BuyVoucher> {
  /// The parameter `parameter` of this provider.
  VoucherDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _PurchaseVoucherProviderElement
    extends AutoDisposeFutureProviderElement<BuyVoucher>
    with PurchaseVoucherRef {
  _PurchaseVoucherProviderElement(super.provider);

  @override
  VoucherDto get parameter => (origin as PurchaseVoucherProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as PurchaseVoucherProvider).cancelToken;
}

String _$getVouchersHash() => r'b99c3e8df7908b06d59feb4d273f00b5f7404611';

/// See also [getVouchers].
@ProviderFor(getVouchers)
const getVouchersProvider = GetVouchersFamily();

/// See also [getVouchers].
class GetVouchersFamily extends Family<AsyncValue<List<Vouchers>>> {
  /// See also [getVouchers].
  const GetVouchersFamily();

  /// See also [getVouchers].
  GetVouchersProvider call({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetVouchersProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetVouchersProvider getProviderOverride(
    covariant GetVouchersProvider provider,
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
  String? get name => r'getVouchersProvider';
}

/// See also [getVouchers].
class GetVouchersProvider extends AutoDisposeFutureProvider<List<Vouchers>> {
  /// See also [getVouchers].
  GetVouchersProvider({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getVouchers(
            ref as GetVouchersRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getVouchersProvider,
          name: r'getVouchersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVouchersHash,
          dependencies: GetVouchersFamily._dependencies,
          allTransitiveDependencies:
              GetVouchersFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetVouchersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final VoucherDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<Vouchers>> Function(GetVouchersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVouchersProvider._internal(
        (ref) => create(ref as GetVouchersRef),
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
  AutoDisposeFutureProviderElement<List<Vouchers>> createElement() {
    return _GetVouchersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVouchersProvider &&
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

mixin GetVouchersRef on AutoDisposeFutureProviderRef<List<Vouchers>> {
  /// The parameter `parameter` of this provider.
  VoucherDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetVouchersProviderElement
    extends AutoDisposeFutureProviderElement<List<Vouchers>>
    with GetVouchersRef {
  _GetVouchersProviderElement(super.provider);

  @override
  VoucherDto get parameter => (origin as GetVouchersProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as GetVouchersProvider).cancelToken;
}

String _$redeemVoucherHash() => r'8a0d809ee9b56d0e08bd1687297de81b92f5867d';

/// See also [redeemVoucher].
@ProviderFor(redeemVoucher)
const redeemVoucherProvider = RedeemVoucherFamily();

/// See also [redeemVoucher].
class RedeemVoucherFamily extends Family<AsyncValue<Vouchers>> {
  /// See also [redeemVoucher].
  const RedeemVoucherFamily();

  /// See also [redeemVoucher].
  RedeemVoucherProvider call({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) {
    return RedeemVoucherProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  RedeemVoucherProvider getProviderOverride(
    covariant RedeemVoucherProvider provider,
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
  String? get name => r'redeemVoucherProvider';
}

/// See also [redeemVoucher].
class RedeemVoucherProvider extends AutoDisposeFutureProvider<Vouchers> {
  /// See also [redeemVoucher].
  RedeemVoucherProvider({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => redeemVoucher(
            ref as RedeemVoucherRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: redeemVoucherProvider,
          name: r'redeemVoucherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$redeemVoucherHash,
          dependencies: RedeemVoucherFamily._dependencies,
          allTransitiveDependencies:
              RedeemVoucherFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  RedeemVoucherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final VoucherDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Vouchers> Function(RedeemVoucherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RedeemVoucherProvider._internal(
        (ref) => create(ref as RedeemVoucherRef),
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
  AutoDisposeFutureProviderElement<Vouchers> createElement() {
    return _RedeemVoucherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RedeemVoucherProvider &&
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

mixin RedeemVoucherRef on AutoDisposeFutureProviderRef<Vouchers> {
  /// The parameter `parameter` of this provider.
  VoucherDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _RedeemVoucherProviderElement
    extends AutoDisposeFutureProviderElement<Vouchers> with RedeemVoucherRef {
  _RedeemVoucherProviderElement(super.provider);

  @override
  VoucherDto get parameter => (origin as RedeemVoucherProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as RedeemVoucherProvider).cancelToken;
}

String _$giftVoucherHash() => r'4c21fe5a2173c173a95afc452024266200655652';

/// See also [giftVoucher].
@ProviderFor(giftVoucher)
const giftVoucherProvider = GiftVoucherFamily();

/// See also [giftVoucher].
class GiftVoucherFamily extends Family<AsyncValue<Vouchers>> {
  /// See also [giftVoucher].
  const GiftVoucherFamily();

  /// See also [giftVoucher].
  GiftVoucherProvider call({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) {
    return GiftVoucherProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GiftVoucherProvider getProviderOverride(
    covariant GiftVoucherProvider provider,
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
  String? get name => r'giftVoucherProvider';
}

/// See also [giftVoucher].
class GiftVoucherProvider extends AutoDisposeFutureProvider<Vouchers> {
  /// See also [giftVoucher].
  GiftVoucherProvider({
    required VoucherDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => giftVoucher(
            ref as GiftVoucherRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: giftVoucherProvider,
          name: r'giftVoucherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$giftVoucherHash,
          dependencies: GiftVoucherFamily._dependencies,
          allTransitiveDependencies:
              GiftVoucherFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GiftVoucherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final VoucherDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Vouchers> Function(GiftVoucherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GiftVoucherProvider._internal(
        (ref) => create(ref as GiftVoucherRef),
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
  AutoDisposeFutureProviderElement<Vouchers> createElement() {
    return _GiftVoucherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GiftVoucherProvider &&
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

mixin GiftVoucherRef on AutoDisposeFutureProviderRef<Vouchers> {
  /// The parameter `parameter` of this provider.
  VoucherDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GiftVoucherProviderElement
    extends AutoDisposeFutureProviderElement<Vouchers> with GiftVoucherRef {
  _GiftVoucherProviderElement(super.provider);

  @override
  VoucherDto get parameter => (origin as GiftVoucherProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as GiftVoucherProvider).cancelToken;
}

String _$getVouchersTopDealsHash() =>
    r'b3642656b0fdcbac2df3d7ce3349299ff2e69572';

/// See also [getVouchersTopDeals].
@ProviderFor(getVouchersTopDeals)
final getVouchersTopDealsProvider = AutoDisposeProvider<List<num>>.internal(
  getVouchersTopDeals,
  name: r'getVouchersTopDealsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getVouchersTopDealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetVouchersTopDealsRef = AutoDisposeProviderRef<List<num>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
