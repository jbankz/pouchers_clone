// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationHash() => r'fa0b8d2c0badabb67d1529b5a13ed0d1beca9158';

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

/// See also [notification].
@ProviderFor(notification)
const notificationProvider = NotificationFamily();

/// See also [notification].
class NotificationFamily extends Family<AsyncValue<NotificationDataModel>> {
  /// See also [notification].
  const NotificationFamily();

  /// See also [notification].
  NotificationProvider call({
    CancelToken? cancelToken,
  }) {
    return NotificationProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  NotificationProvider getProviderOverride(
    covariant NotificationProvider provider,
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
  String? get name => r'notificationProvider';
}

/// See also [notification].
class NotificationProvider
    extends AutoDisposeFutureProvider<NotificationDataModel> {
  /// See also [notification].
  NotificationProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => notification(
            ref as NotificationRef,
            cancelToken: cancelToken,
          ),
          from: notificationProvider,
          name: r'notificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificationHash,
          dependencies: NotificationFamily._dependencies,
          allTransitiveDependencies:
              NotificationFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  NotificationProvider._internal(
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
    FutureOr<NotificationDataModel> Function(NotificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NotificationProvider._internal(
        (ref) => create(ref as NotificationRef),
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
  AutoDisposeFutureProviderElement<NotificationDataModel> createElement() {
    return _NotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NotificationRef on AutoDisposeFutureProviderRef<NotificationDataModel> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _NotificationProviderElement
    extends AutoDisposeFutureProviderElement<NotificationDataModel>
    with NotificationRef {
  _NotificationProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as NotificationProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
