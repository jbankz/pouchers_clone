// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMerchantsHash() => r'a676a7d76c54ba8445c129eb1e42b3bf02711dec';

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

/// See also [getMerchants].
@ProviderFor(getMerchants)
const getMerchantsProvider = GetMerchantsFamily();

/// See also [getMerchants].
class GetMerchantsFamily extends Family<AsyncValue<GetMerchant>> {
  /// See also [getMerchants].
  const GetMerchantsFamily();

  /// See also [getMerchants].
  GetMerchantsProvider call({
    CancelToken? cancelToken,
  }) {
    return GetMerchantsProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  GetMerchantsProvider getProviderOverride(
    covariant GetMerchantsProvider provider,
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
  String? get name => r'getMerchantsProvider';
}

/// See also [getMerchants].
class GetMerchantsProvider extends AutoDisposeFutureProvider<GetMerchant> {
  /// See also [getMerchants].
  GetMerchantsProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getMerchants(
            ref as GetMerchantsRef,
            cancelToken: cancelToken,
          ),
          from: getMerchantsProvider,
          name: r'getMerchantsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMerchantsHash,
          dependencies: GetMerchantsFamily._dependencies,
          allTransitiveDependencies:
              GetMerchantsFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  GetMerchantsProvider._internal(
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
    FutureOr<GetMerchant> Function(GetMerchantsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMerchantsProvider._internal(
        (ref) => create(ref as GetMerchantsRef),
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
  AutoDisposeFutureProviderElement<GetMerchant> createElement() {
    return _GetMerchantsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMerchantsProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMerchantsRef on AutoDisposeFutureProviderRef<GetMerchant> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetMerchantsProviderElement
    extends AutoDisposeFutureProviderElement<GetMerchant> with GetMerchantsRef {
  _GetMerchantsProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as GetMerchantsProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
