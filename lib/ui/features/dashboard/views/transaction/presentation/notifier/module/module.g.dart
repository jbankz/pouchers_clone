// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTransactionsHistoryHash() =>
    r'dedb09a2e2bd229e7b61bbd39abef21bff78296e';

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

/// See also [getTransactionsHistory].
@ProviderFor(getTransactionsHistory)
const getTransactionsHistoryProvider = GetTransactionsHistoryFamily();

/// See also [getTransactionsHistory].
class GetTransactionsHistoryFamily
    extends Family<AsyncValue<List<TransactionHistory>>> {
  /// See also [getTransactionsHistory].
  const GetTransactionsHistoryFamily();

  /// See also [getTransactionsHistory].
  GetTransactionsHistoryProvider call({
    required TransactionDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetTransactionsHistoryProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetTransactionsHistoryProvider getProviderOverride(
    covariant GetTransactionsHistoryProvider provider,
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
  String? get name => r'getTransactionsHistoryProvider';
}

/// See also [getTransactionsHistory].
class GetTransactionsHistoryProvider
    extends AutoDisposeFutureProvider<List<TransactionHistory>> {
  /// See also [getTransactionsHistory].
  GetTransactionsHistoryProvider({
    required TransactionDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getTransactionsHistory(
            ref as GetTransactionsHistoryRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getTransactionsHistoryProvider,
          name: r'getTransactionsHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTransactionsHistoryHash,
          dependencies: GetTransactionsHistoryFamily._dependencies,
          allTransitiveDependencies:
              GetTransactionsHistoryFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetTransactionsHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final TransactionDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<TransactionHistory>> Function(
            GetTransactionsHistoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTransactionsHistoryProvider._internal(
        (ref) => create(ref as GetTransactionsHistoryRef),
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
  AutoDisposeFutureProviderElement<List<TransactionHistory>> createElement() {
    return _GetTransactionsHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTransactionsHistoryProvider &&
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

mixin GetTransactionsHistoryRef
    on AutoDisposeFutureProviderRef<List<TransactionHistory>> {
  /// The parameter `parameter` of this provider.
  TransactionDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetTransactionsHistoryProviderElement
    extends AutoDisposeFutureProviderElement<List<TransactionHistory>>
    with GetTransactionsHistoryRef {
  _GetTransactionsHistoryProviderElement(super.provider);

  @override
  TransactionDto get parameter =>
      (origin as GetTransactionsHistoryProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as GetTransactionsHistoryProvider).cancelToken;
}

String _$getTransactionsAnalyticHash() =>
    r'85b1dade3d6d0ddca2ccf6a96ec4399f3d05850f';

/// See also [getTransactionsAnalytic].
@ProviderFor(getTransactionsAnalytic)
const getTransactionsAnalyticProvider = GetTransactionsAnalyticFamily();

/// See also [getTransactionsAnalytic].
class GetTransactionsAnalyticFamily
    extends Family<AsyncValue<TransactionAnalytic>> {
  /// See also [getTransactionsAnalytic].
  const GetTransactionsAnalyticFamily();

  /// See also [getTransactionsAnalytic].
  GetTransactionsAnalyticProvider call(
    String month, {
    CancelToken? cancelToken,
  }) {
    return GetTransactionsAnalyticProvider(
      month,
      cancelToken: cancelToken,
    );
  }

  @override
  GetTransactionsAnalyticProvider getProviderOverride(
    covariant GetTransactionsAnalyticProvider provider,
  ) {
    return call(
      provider.month,
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
  String? get name => r'getTransactionsAnalyticProvider';
}

/// See also [getTransactionsAnalytic].
class GetTransactionsAnalyticProvider
    extends AutoDisposeFutureProvider<TransactionAnalytic> {
  /// See also [getTransactionsAnalytic].
  GetTransactionsAnalyticProvider(
    String month, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getTransactionsAnalytic(
            ref as GetTransactionsAnalyticRef,
            month,
            cancelToken: cancelToken,
          ),
          from: getTransactionsAnalyticProvider,
          name: r'getTransactionsAnalyticProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTransactionsAnalyticHash,
          dependencies: GetTransactionsAnalyticFamily._dependencies,
          allTransitiveDependencies:
              GetTransactionsAnalyticFamily._allTransitiveDependencies,
          month: month,
          cancelToken: cancelToken,
        );

  GetTransactionsAnalyticProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.cancelToken,
  }) : super.internal();

  final String month;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<TransactionAnalytic> Function(GetTransactionsAnalyticRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTransactionsAnalyticProvider._internal(
        (ref) => create(ref as GetTransactionsAnalyticRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TransactionAnalytic> createElement() {
    return _GetTransactionsAnalyticProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTransactionsAnalyticProvider &&
        other.month == month &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTransactionsAnalyticRef
    on AutoDisposeFutureProviderRef<TransactionAnalytic> {
  /// The parameter `month` of this provider.
  String get month;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetTransactionsAnalyticProviderElement
    extends AutoDisposeFutureProviderElement<TransactionAnalytic>
    with GetTransactionsAnalyticRef {
  _GetTransactionsAnalyticProviderElement(super.provider);

  @override
  String get month => (origin as GetTransactionsAnalyticProvider).month;
  @override
  CancelToken? get cancelToken =>
      (origin as GetTransactionsAnalyticProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
