// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationHash() => r'e3a9d45d1cbeed3811a4ed85aae76fb065f15382';

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
  NotificationProvider call(
    NotificationDto notificationDto, {
    CancelToken? cancelToken,
  }) {
    return NotificationProvider(
      notificationDto,
      cancelToken: cancelToken,
    );
  }

  @override
  NotificationProvider getProviderOverride(
    covariant NotificationProvider provider,
  ) {
    return call(
      provider.notificationDto,
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
  NotificationProvider(
    NotificationDto notificationDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => notification(
            ref as NotificationRef,
            notificationDto,
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
          notificationDto: notificationDto,
          cancelToken: cancelToken,
        );

  NotificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notificationDto,
    required this.cancelToken,
  }) : super.internal();

  final NotificationDto notificationDto;
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
        notificationDto: notificationDto,
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
    return other is NotificationProvider &&
        other.notificationDto == notificationDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notificationDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NotificationRef on AutoDisposeFutureProviderRef<NotificationDataModel> {
  /// The parameter `notificationDto` of this provider.
  NotificationDto get notificationDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _NotificationProviderElement
    extends AutoDisposeFutureProviderElement<NotificationDataModel>
    with NotificationRef {
  _NotificationProviderElement(super.provider);

  @override
  NotificationDto get notificationDto =>
      (origin as NotificationProvider).notificationDto;
  @override
  CancelToken? get cancelToken => (origin as NotificationProvider).cancelToken;
}

String _$readNotificationHash() => r'361972b1d7484a4b59e4bc2676638692db615580';

/// See also [readNotification].
@ProviderFor(readNotification)
const readNotificationProvider = ReadNotificationFamily();

/// See also [readNotification].
class ReadNotificationFamily extends Family<AsyncValue<bool>> {
  /// See also [readNotification].
  const ReadNotificationFamily();

  /// See also [readNotification].
  ReadNotificationProvider call(
    String notificationId, {
    CancelToken? cancelToken,
  }) {
    return ReadNotificationProvider(
      notificationId,
      cancelToken: cancelToken,
    );
  }

  @override
  ReadNotificationProvider getProviderOverride(
    covariant ReadNotificationProvider provider,
  ) {
    return call(
      provider.notificationId,
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
  String? get name => r'readNotificationProvider';
}

/// See also [readNotification].
class ReadNotificationProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [readNotification].
  ReadNotificationProvider(
    String notificationId, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => readNotification(
            ref as ReadNotificationRef,
            notificationId,
            cancelToken: cancelToken,
          ),
          from: readNotificationProvider,
          name: r'readNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readNotificationHash,
          dependencies: ReadNotificationFamily._dependencies,
          allTransitiveDependencies:
              ReadNotificationFamily._allTransitiveDependencies,
          notificationId: notificationId,
          cancelToken: cancelToken,
        );

  ReadNotificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notificationId,
    required this.cancelToken,
  }) : super.internal();

  final String notificationId;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ReadNotificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReadNotificationProvider._internal(
        (ref) => create(ref as ReadNotificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notificationId: notificationId,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ReadNotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReadNotificationProvider &&
        other.notificationId == notificationId &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notificationId.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReadNotificationRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `notificationId` of this provider.
  String get notificationId;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ReadNotificationProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ReadNotificationRef {
  _ReadNotificationProviderElement(super.provider);

  @override
  String get notificationId =>
      (origin as ReadNotificationProvider).notificationId;
  @override
  CancelToken? get cancelToken =>
      (origin as ReadNotificationProvider).cancelToken;
}

String _$unreadPaymentNotificationHash() =>
    r'ab3db2f7c820472ccca3819277afe240be872d36';

/// See also [unreadPaymentNotification].
@ProviderFor(unreadPaymentNotification)
const unreadPaymentNotificationProvider = UnreadPaymentNotificationFamily();

/// See also [unreadPaymentNotification].
class UnreadPaymentNotificationFamily
    extends Family<AsyncValue<UnreadPaymentRequest>> {
  /// See also [unreadPaymentNotification].
  const UnreadPaymentNotificationFamily();

  /// See also [unreadPaymentNotification].
  UnreadPaymentNotificationProvider call({
    CancelToken? cancelToken,
  }) {
    return UnreadPaymentNotificationProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  UnreadPaymentNotificationProvider getProviderOverride(
    covariant UnreadPaymentNotificationProvider provider,
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
  String? get name => r'unreadPaymentNotificationProvider';
}

/// See also [unreadPaymentNotification].
class UnreadPaymentNotificationProvider
    extends AutoDisposeFutureProvider<UnreadPaymentRequest> {
  /// See also [unreadPaymentNotification].
  UnreadPaymentNotificationProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => unreadPaymentNotification(
            ref as UnreadPaymentNotificationRef,
            cancelToken: cancelToken,
          ),
          from: unreadPaymentNotificationProvider,
          name: r'unreadPaymentNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$unreadPaymentNotificationHash,
          dependencies: UnreadPaymentNotificationFamily._dependencies,
          allTransitiveDependencies:
              UnreadPaymentNotificationFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  UnreadPaymentNotificationProvider._internal(
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
    FutureOr<UnreadPaymentRequest> Function(
            UnreadPaymentNotificationRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UnreadPaymentNotificationProvider._internal(
        (ref) => create(ref as UnreadPaymentNotificationRef),
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
  AutoDisposeFutureProviderElement<UnreadPaymentRequest> createElement() {
    return _UnreadPaymentNotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UnreadPaymentNotificationProvider &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UnreadPaymentNotificationRef
    on AutoDisposeFutureProviderRef<UnreadPaymentRequest> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _UnreadPaymentNotificationProviderElement
    extends AutoDisposeFutureProviderElement<UnreadPaymentRequest>
    with UnreadPaymentNotificationRef {
  _UnreadPaymentNotificationProviderElement(super.provider);

  @override
  CancelToken? get cancelToken =>
      (origin as UnreadPaymentNotificationProvider).cancelToken;
}

String _$readAllNotificationHash() =>
    r'e2871b1d85849824a222cbd6e4145adfa4a20145';

/// See also [readAllNotification].
@ProviderFor(readAllNotification)
const readAllNotificationProvider = ReadAllNotificationFamily();

/// See also [readAllNotification].
class ReadAllNotificationFamily extends Family<AsyncValue<bool>> {
  /// See also [readAllNotification].
  const ReadAllNotificationFamily();

  /// See also [readAllNotification].
  ReadAllNotificationProvider call({
    CancelToken? cancelToken,
  }) {
    return ReadAllNotificationProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  ReadAllNotificationProvider getProviderOverride(
    covariant ReadAllNotificationProvider provider,
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
  String? get name => r'readAllNotificationProvider';
}

/// See also [readAllNotification].
class ReadAllNotificationProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [readAllNotification].
  ReadAllNotificationProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => readAllNotification(
            ref as ReadAllNotificationRef,
            cancelToken: cancelToken,
          ),
          from: readAllNotificationProvider,
          name: r'readAllNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readAllNotificationHash,
          dependencies: ReadAllNotificationFamily._dependencies,
          allTransitiveDependencies:
              ReadAllNotificationFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  ReadAllNotificationProvider._internal(
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
    FutureOr<bool> Function(ReadAllNotificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReadAllNotificationProvider._internal(
        (ref) => create(ref as ReadAllNotificationRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ReadAllNotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReadAllNotificationProvider &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReadAllNotificationRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ReadAllNotificationProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ReadAllNotificationRef {
  _ReadAllNotificationProviderElement(super.provider);

  @override
  CancelToken? get cancelToken =>
      (origin as ReadAllNotificationProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
