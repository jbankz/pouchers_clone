// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$envsHash() => r'2217421714de4dfc1d42c49267fff837e242dc6d';

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

/// See also [envs].
@ProviderFor(envs)
const envsProvider = EnvsFamily();

/// See also [envs].
class EnvsFamily extends Family<AsyncValue<List<Envs>>> {
  /// See also [envs].
  const EnvsFamily();

  /// See also [envs].
  EnvsProvider call({
    AdminDto? parameter,
    CancelToken? cancelToken,
  }) {
    return EnvsProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  EnvsProvider getProviderOverride(
    covariant EnvsProvider provider,
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
  String? get name => r'envsProvider';
}

/// See also [envs].
class EnvsProvider extends AutoDisposeFutureProvider<List<Envs>> {
  /// See also [envs].
  EnvsProvider({
    AdminDto? parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => envs(
            ref as EnvsRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: envsProvider,
          name: r'envsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$envsHash,
          dependencies: EnvsFamily._dependencies,
          allTransitiveDependencies: EnvsFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  EnvsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AdminDto? parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<Envs>> Function(EnvsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EnvsProvider._internal(
        (ref) => create(ref as EnvsRef),
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
  AutoDisposeFutureProviderElement<List<Envs>> createElement() {
    return _EnvsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EnvsProvider &&
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

mixin EnvsRef on AutoDisposeFutureProviderRef<List<Envs>> {
  /// The parameter `parameter` of this provider.
  AdminDto? get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _EnvsProviderElement extends AutoDisposeFutureProviderElement<List<Envs>>
    with EnvsRef {
  _EnvsProviderElement(super.provider);

  @override
  AdminDto? get parameter => (origin as EnvsProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as EnvsProvider).cancelToken;
}

String _$bannersHash() => r'd76a0fba1e583164c8fe550e6353f8a16b0a4729';

/// See also [banners].
@ProviderFor(banners)
const bannersProvider = BannersFamily();

/// See also [banners].
class BannersFamily extends Family<AsyncValue<List<Banner>>> {
  /// See also [banners].
  const BannersFamily();

  /// See also [banners].
  BannersProvider call({
    CancelToken? cancelToken,
  }) {
    return BannersProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  BannersProvider getProviderOverride(
    covariant BannersProvider provider,
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
  String? get name => r'bannersProvider';
}

/// See also [banners].
class BannersProvider extends AutoDisposeFutureProvider<List<Banner>> {
  /// See also [banners].
  BannersProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => banners(
            ref as BannersRef,
            cancelToken: cancelToken,
          ),
          from: bannersProvider,
          name: r'bannersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bannersHash,
          dependencies: BannersFamily._dependencies,
          allTransitiveDependencies: BannersFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  BannersProvider._internal(
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
    FutureOr<List<Banner>> Function(BannersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BannersProvider._internal(
        (ref) => create(ref as BannersRef),
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
  AutoDisposeFutureProviderElement<List<Banner>> createElement() {
    return _BannersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BannersProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BannersRef on AutoDisposeFutureProviderRef<List<Banner>> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _BannersProviderElement
    extends AutoDisposeFutureProviderElement<List<Banner>> with BannersRef {
  _BannersProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as BannersProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
