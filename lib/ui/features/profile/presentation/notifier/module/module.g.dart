// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletBalanceHash() => r'82fd927d1605d237791cdea0a95b523bfd2b45b9';

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

/// See also [walletBalance].
@ProviderFor(walletBalance)
const walletBalanceProvider = WalletBalanceFamily();

/// See also [walletBalance].
class WalletBalanceFamily extends Family<AsyncValue<Wallet?>> {
  /// See also [walletBalance].
  const WalletBalanceFamily();

  /// See also [walletBalance].
  WalletBalanceProvider call({
    CancelToken? cancelToken,
  }) {
    return WalletBalanceProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  WalletBalanceProvider getProviderOverride(
    covariant WalletBalanceProvider provider,
  ) {
    return call(
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
  String? get name => r'walletBalanceProvider';
}

/// See also [walletBalance].
class WalletBalanceProvider extends AutoDisposeFutureProvider<Wallet?> {
  /// See also [walletBalance].
  WalletBalanceProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => walletBalance(
            ref as WalletBalanceRef,
            cancelToken: cancelToken,
          ),
          from: walletBalanceProvider,
          name: r'walletBalanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$walletBalanceHash,
          dependencies: WalletBalanceFamily._dependencies,
          allTransitiveDependencies:
              WalletBalanceFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  WalletBalanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cancelToken,
  }) : super.internal();

  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Wallet?> Function(WalletBalanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WalletBalanceProvider._internal(
        (ref) => create(ref as WalletBalanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Wallet?> createElement() {
    return _WalletBalanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletBalanceProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WalletBalanceRef on AutoDisposeFutureProviderRef<Wallet?> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _WalletBalanceProviderElement
    extends AutoDisposeFutureProviderElement<Wallet?> with WalletBalanceRef {
  _WalletBalanceProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as WalletBalanceProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
