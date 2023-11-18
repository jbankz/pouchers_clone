// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tierHash() => r'bcf3ca92f9e4223a5a9faad5daf1fef77ff2ca28';

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

/// See also [tier].
@ProviderFor(tier)
const tierProvider = TierFamily();

/// See also [tier].
class TierFamily extends Family<AsyncValue<Data?>> {
  /// See also [tier].
  const TierFamily();

  /// See also [tier].
  TierProvider call({
    CancelToken? cancelToken,
  }) {
    return TierProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  TierProvider getProviderOverride(
    covariant TierProvider provider,
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
  String? get name => r'tierProvider';
}

/// See also [tier].
class TierProvider extends AutoDisposeFutureProvider<Data?> {
  /// See also [tier].
  TierProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => tier(
            ref as TierRef,
            cancelToken: cancelToken,
          ),
          from: tierProvider,
          name: r'tierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$tierHash,
          dependencies: TierFamily._dependencies,
          allTransitiveDependencies: TierFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  TierProvider._internal(
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
    FutureOr<Data?> Function(TierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TierProvider._internal(
        (ref) => create(ref as TierRef),
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
  AutoDisposeFutureProviderElement<Data?> createElement() {
    return _TierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TierProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TierRef on AutoDisposeFutureProviderRef<Data?> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _TierProviderElement extends AutoDisposeFutureProviderElement<Data?>
    with TierRef {
  _TierProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as TierProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
