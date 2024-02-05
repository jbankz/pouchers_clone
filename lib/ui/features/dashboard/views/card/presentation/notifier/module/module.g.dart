// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getVirtualCardDetailsHash() =>
    r'5f7ca74154aaf2a128160afe18d18b03aac94c58';

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

/// See also [getVirtualCardDetails].
@ProviderFor(getVirtualCardDetails)
const getVirtualCardDetailsProvider = GetVirtualCardDetailsFamily();

/// See also [getVirtualCardDetails].
class GetVirtualCardDetailsFamily
    extends Family<AsyncValue<VirtualCardDetails?>> {
  /// See also [getVirtualCardDetails].
  const GetVirtualCardDetailsFamily();

  /// See also [getVirtualCardDetails].
  GetVirtualCardDetailsProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetVirtualCardDetailsProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetVirtualCardDetailsProvider getProviderOverride(
    covariant GetVirtualCardDetailsProvider provider,
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
  String? get name => r'getVirtualCardDetailsProvider';
}

/// See also [getVirtualCardDetails].
class GetVirtualCardDetailsProvider
    extends AutoDisposeFutureProvider<VirtualCardDetails?> {
  /// See also [getVirtualCardDetails].
  GetVirtualCardDetailsProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getVirtualCardDetails(
            ref as GetVirtualCardDetailsRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getVirtualCardDetailsProvider,
          name: r'getVirtualCardDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVirtualCardDetailsHash,
          dependencies: GetVirtualCardDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetVirtualCardDetailsFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetVirtualCardDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<VirtualCardDetails?> Function(GetVirtualCardDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVirtualCardDetailsProvider._internal(
        (ref) => create(ref as GetVirtualCardDetailsRef),
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
  AutoDisposeFutureProviderElement<VirtualCardDetails?> createElement() {
    return _GetVirtualCardDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVirtualCardDetailsProvider &&
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

mixin GetVirtualCardDetailsRef
    on AutoDisposeFutureProviderRef<VirtualCardDetails?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetVirtualCardDetailsProviderElement
    extends AutoDisposeFutureProviderElement<VirtualCardDetails?>
    with GetVirtualCardDetailsRef {
  _GetVirtualCardDetailsProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as GetVirtualCardDetailsProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as GetVirtualCardDetailsProvider).cancelToken;
}

String _$createNairaVirtualCardHash() =>
    r'5807c968f8365ed18b80631ff039d43d21898b65';

/// See also [createNairaVirtualCard].
@ProviderFor(createNairaVirtualCard)
const createNairaVirtualCardProvider = CreateNairaVirtualCardFamily();

/// See also [createNairaVirtualCard].
class CreateNairaVirtualCardFamily
    extends Family<AsyncValue<CreatedVirtualCard?>> {
  /// See also [createNairaVirtualCard].
  const CreateNairaVirtualCardFamily();

  /// See also [createNairaVirtualCard].
  CreateNairaVirtualCardProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return CreateNairaVirtualCardProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  CreateNairaVirtualCardProvider getProviderOverride(
    covariant CreateNairaVirtualCardProvider provider,
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
  String? get name => r'createNairaVirtualCardProvider';
}

/// See also [createNairaVirtualCard].
class CreateNairaVirtualCardProvider
    extends AutoDisposeFutureProvider<CreatedVirtualCard?> {
  /// See also [createNairaVirtualCard].
  CreateNairaVirtualCardProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => createNairaVirtualCard(
            ref as CreateNairaVirtualCardRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: createNairaVirtualCardProvider,
          name: r'createNairaVirtualCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNairaVirtualCardHash,
          dependencies: CreateNairaVirtualCardFamily._dependencies,
          allTransitiveDependencies:
              CreateNairaVirtualCardFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  CreateNairaVirtualCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<CreatedVirtualCard?> Function(CreateNairaVirtualCardRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNairaVirtualCardProvider._internal(
        (ref) => create(ref as CreateNairaVirtualCardRef),
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
  AutoDisposeFutureProviderElement<CreatedVirtualCard?> createElement() {
    return _CreateNairaVirtualCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNairaVirtualCardProvider &&
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

mixin CreateNairaVirtualCardRef
    on AutoDisposeFutureProviderRef<CreatedVirtualCard?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _CreateNairaVirtualCardProviderElement
    extends AutoDisposeFutureProviderElement<CreatedVirtualCard?>
    with CreateNairaVirtualCardRef {
  _CreateNairaVirtualCardProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as CreateNairaVirtualCardProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as CreateNairaVirtualCardProvider).cancelToken;
}

String _$createDollarVirtualCardHash() =>
    r'a2fb7ac4828c75ec055dbcd4e493d5888501b6fa';

/// See also [createDollarVirtualCard].
@ProviderFor(createDollarVirtualCard)
const createDollarVirtualCardProvider = CreateDollarVirtualCardFamily();

/// See also [createDollarVirtualCard].
class CreateDollarVirtualCardFamily
    extends Family<AsyncValue<CreatedVirtualCard?>> {
  /// See also [createDollarVirtualCard].
  const CreateDollarVirtualCardFamily();

  /// See also [createDollarVirtualCard].
  CreateDollarVirtualCardProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return CreateDollarVirtualCardProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  CreateDollarVirtualCardProvider getProviderOverride(
    covariant CreateDollarVirtualCardProvider provider,
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
  String? get name => r'createDollarVirtualCardProvider';
}

/// See also [createDollarVirtualCard].
class CreateDollarVirtualCardProvider
    extends AutoDisposeFutureProvider<CreatedVirtualCard?> {
  /// See also [createDollarVirtualCard].
  CreateDollarVirtualCardProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => createDollarVirtualCard(
            ref as CreateDollarVirtualCardRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: createDollarVirtualCardProvider,
          name: r'createDollarVirtualCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createDollarVirtualCardHash,
          dependencies: CreateDollarVirtualCardFamily._dependencies,
          allTransitiveDependencies:
              CreateDollarVirtualCardFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  CreateDollarVirtualCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<CreatedVirtualCard?> Function(CreateDollarVirtualCardRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateDollarVirtualCardProvider._internal(
        (ref) => create(ref as CreateDollarVirtualCardRef),
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
  AutoDisposeFutureProviderElement<CreatedVirtualCard?> createElement() {
    return _CreateDollarVirtualCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateDollarVirtualCardProvider &&
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

mixin CreateDollarVirtualCardRef
    on AutoDisposeFutureProviderRef<CreatedVirtualCard?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _CreateDollarVirtualCardProviderElement
    extends AutoDisposeFutureProviderElement<CreatedVirtualCard?>
    with CreateDollarVirtualCardRef {
  _CreateDollarVirtualCardProviderElement(super.provider);

  @override
  CardDto get parameter =>
      (origin as CreateDollarVirtualCardProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as CreateDollarVirtualCardProvider).cancelToken;
}

String _$getAccountBalanceHash() => r'dbd38969844f18338ef6f8024fc9c36842620bf9';

/// See also [getAccountBalance].
@ProviderFor(getAccountBalance)
const getAccountBalanceProvider = GetAccountBalanceFamily();

/// See also [getAccountBalance].
class GetAccountBalanceFamily
    extends Family<AsyncValue<VirtualAccountBalance?>> {
  /// See also [getAccountBalance].
  const GetAccountBalanceFamily();

  /// See also [getAccountBalance].
  GetAccountBalanceProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetAccountBalanceProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetAccountBalanceProvider getProviderOverride(
    covariant GetAccountBalanceProvider provider,
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
  String? get name => r'getAccountBalanceProvider';
}

/// See also [getAccountBalance].
class GetAccountBalanceProvider
    extends AutoDisposeFutureProvider<VirtualAccountBalance?> {
  /// See also [getAccountBalance].
  GetAccountBalanceProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getAccountBalance(
            ref as GetAccountBalanceRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getAccountBalanceProvider,
          name: r'getAccountBalanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAccountBalanceHash,
          dependencies: GetAccountBalanceFamily._dependencies,
          allTransitiveDependencies:
              GetAccountBalanceFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetAccountBalanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<VirtualAccountBalance?> Function(GetAccountBalanceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAccountBalanceProvider._internal(
        (ref) => create(ref as GetAccountBalanceRef),
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
  AutoDisposeFutureProviderElement<VirtualAccountBalance?> createElement() {
    return _GetAccountBalanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAccountBalanceProvider &&
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

mixin GetAccountBalanceRef
    on AutoDisposeFutureProviderRef<VirtualAccountBalance?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetAccountBalanceProviderElement
    extends AutoDisposeFutureProviderElement<VirtualAccountBalance?>
    with GetAccountBalanceRef {
  _GetAccountBalanceProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as GetAccountBalanceProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as GetAccountBalanceProvider).cancelToken;
}

String _$getVirtualAccoutHash() => r'd7541c727bc55b4aeb1767b96cac732e736cac98';

/// See also [getVirtualAccout].
@ProviderFor(getVirtualAccout)
const getVirtualAccoutProvider = GetVirtualAccoutFamily();

/// See also [getVirtualAccout].
class GetVirtualAccoutFamily extends Family<AsyncValue<GetVirtualAccount?>> {
  /// See also [getVirtualAccout].
  const GetVirtualAccoutFamily();

  /// See also [getVirtualAccout].
  GetVirtualAccoutProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetVirtualAccoutProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetVirtualAccoutProvider getProviderOverride(
    covariant GetVirtualAccoutProvider provider,
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
  String? get name => r'getVirtualAccoutProvider';
}

/// See also [getVirtualAccout].
class GetVirtualAccoutProvider
    extends AutoDisposeFutureProvider<GetVirtualAccount?> {
  /// See also [getVirtualAccout].
  GetVirtualAccoutProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getVirtualAccout(
            ref as GetVirtualAccoutRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getVirtualAccoutProvider,
          name: r'getVirtualAccoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVirtualAccoutHash,
          dependencies: GetVirtualAccoutFamily._dependencies,
          allTransitiveDependencies:
              GetVirtualAccoutFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetVirtualAccoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<GetVirtualAccount?> Function(GetVirtualAccoutRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVirtualAccoutProvider._internal(
        (ref) => create(ref as GetVirtualAccoutRef),
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
  AutoDisposeFutureProviderElement<GetVirtualAccount?> createElement() {
    return _GetVirtualAccoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVirtualAccoutProvider &&
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

mixin GetVirtualAccoutRef on AutoDisposeFutureProviderRef<GetVirtualAccount?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetVirtualAccoutProviderElement
    extends AutoDisposeFutureProviderElement<GetVirtualAccount?>
    with GetVirtualAccoutRef {
  _GetVirtualAccoutProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as GetVirtualAccoutProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as GetVirtualAccoutProvider).cancelToken;
}

String _$fundVirtualCardHash() => r'eb5d60c1382109ae8124964a864cd83f7439db99';

/// See also [fundVirtualCard].
@ProviderFor(fundVirtualCard)
const fundVirtualCardProvider = FundVirtualCardFamily();

/// See also [fundVirtualCard].
class FundVirtualCardFamily extends Family<AsyncValue<FundVirtualAccount?>> {
  /// See also [fundVirtualCard].
  const FundVirtualCardFamily();

  /// See also [fundVirtualCard].
  FundVirtualCardProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return FundVirtualCardProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  FundVirtualCardProvider getProviderOverride(
    covariant FundVirtualCardProvider provider,
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
  String? get name => r'fundVirtualCardProvider';
}

/// See also [fundVirtualCard].
class FundVirtualCardProvider
    extends AutoDisposeFutureProvider<FundVirtualAccount?> {
  /// See also [fundVirtualCard].
  FundVirtualCardProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => fundVirtualCard(
            ref as FundVirtualCardRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: fundVirtualCardProvider,
          name: r'fundVirtualCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fundVirtualCardHash,
          dependencies: FundVirtualCardFamily._dependencies,
          allTransitiveDependencies:
              FundVirtualCardFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  FundVirtualCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<FundVirtualAccount?> Function(FundVirtualCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FundVirtualCardProvider._internal(
        (ref) => create(ref as FundVirtualCardRef),
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
  AutoDisposeFutureProviderElement<FundVirtualAccount?> createElement() {
    return _FundVirtualCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FundVirtualCardProvider &&
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

mixin FundVirtualCardRef on AutoDisposeFutureProviderRef<FundVirtualAccount?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _FundVirtualCardProviderElement
    extends AutoDisposeFutureProviderElement<FundVirtualAccount?>
    with FundVirtualCardRef {
  _FundVirtualCardProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as FundVirtualCardProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as FundVirtualCardProvider).cancelToken;
}

String _$freezeCardHash() => r'c6d6ada9ad3e779b53e0ff38ab2cf26590eb7926';

/// See also [freezeCard].
@ProviderFor(freezeCard)
const freezeCardProvider = FreezeCardFamily();

/// See also [freezeCard].
class FreezeCardFamily extends Family<AsyncValue<FreezeCard?>> {
  /// See also [freezeCard].
  const FreezeCardFamily();

  /// See also [freezeCard].
  FreezeCardProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return FreezeCardProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  FreezeCardProvider getProviderOverride(
    covariant FreezeCardProvider provider,
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
  String? get name => r'freezeCardProvider';
}

/// See also [freezeCard].
class FreezeCardProvider extends AutoDisposeFutureProvider<FreezeCard?> {
  /// See also [freezeCard].
  FreezeCardProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => freezeCard(
            ref as FreezeCardRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: freezeCardProvider,
          name: r'freezeCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$freezeCardHash,
          dependencies: FreezeCardFamily._dependencies,
          allTransitiveDependencies:
              FreezeCardFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  FreezeCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<FreezeCard?> Function(FreezeCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FreezeCardProvider._internal(
        (ref) => create(ref as FreezeCardRef),
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
  AutoDisposeFutureProviderElement<FreezeCard?> createElement() {
    return _FreezeCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FreezeCardProvider &&
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

mixin FreezeCardRef on AutoDisposeFutureProviderRef<FreezeCard?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _FreezeCardProviderElement
    extends AutoDisposeFutureProviderElement<FreezeCard?> with FreezeCardRef {
  _FreezeCardProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as FreezeCardProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as FreezeCardProvider).cancelToken;
}

String _$getCardTransactionsHash() =>
    r'fdd1c085947dd7df54b045186f60561834fa31e7';

/// See also [getCardTransactions].
@ProviderFor(getCardTransactions)
const getCardTransactionsProvider = GetCardTransactionsFamily();

/// See also [getCardTransactions].
class GetCardTransactionsFamily
    extends Family<AsyncValue<GetCardTransactions?>> {
  /// See also [getCardTransactions].
  const GetCardTransactionsFamily();

  /// See also [getCardTransactions].
  GetCardTransactionsProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetCardTransactionsProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetCardTransactionsProvider getProviderOverride(
    covariant GetCardTransactionsProvider provider,
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
  String? get name => r'getCardTransactionsProvider';
}

/// See also [getCardTransactions].
class GetCardTransactionsProvider
    extends AutoDisposeFutureProvider<GetCardTransactions?> {
  /// See also [getCardTransactions].
  GetCardTransactionsProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getCardTransactions(
            ref as GetCardTransactionsRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getCardTransactionsProvider,
          name: r'getCardTransactionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCardTransactionsHash,
          dependencies: GetCardTransactionsFamily._dependencies,
          allTransitiveDependencies:
              GetCardTransactionsFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetCardTransactionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<GetCardTransactions?> Function(GetCardTransactionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCardTransactionsProvider._internal(
        (ref) => create(ref as GetCardTransactionsRef),
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
  AutoDisposeFutureProviderElement<GetCardTransactions?> createElement() {
    return _GetCardTransactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCardTransactionsProvider &&
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

mixin GetCardTransactionsRef
    on AutoDisposeFutureProviderRef<GetCardTransactions?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetCardTransactionsProviderElement
    extends AutoDisposeFutureProviderElement<GetCardTransactions?>
    with GetCardTransactionsRef {
  _GetCardTransactionsProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as GetCardTransactionsProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as GetCardTransactionsProvider).cancelToken;
}

String _$getCardsHash() => r'3026f352bd98573babae58606b12474080090d57';

/// See also [getCards].
@ProviderFor(getCards)
const getCardsProvider = GetCardsFamily();

/// See also [getCards].
class GetCardsFamily extends Family<AsyncValue<List<Cards>?>> {
  /// See also [getCards].
  const GetCardsFamily();

  /// See also [getCards].
  GetCardsProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetCardsProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetCardsProvider getProviderOverride(
    covariant GetCardsProvider provider,
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
  String? get name => r'getCardsProvider';
}

/// See also [getCards].
class GetCardsProvider extends AutoDisposeFutureProvider<List<Cards>?> {
  /// See also [getCards].
  GetCardsProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getCards(
            ref as GetCardsRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getCardsProvider,
          name: r'getCardsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCardsHash,
          dependencies: GetCardsFamily._dependencies,
          allTransitiveDependencies: GetCardsFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetCardsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<Cards>?> Function(GetCardsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCardsProvider._internal(
        (ref) => create(ref as GetCardsRef),
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
  AutoDisposeFutureProviderElement<List<Cards>?> createElement() {
    return _GetCardsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCardsProvider &&
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

mixin GetCardsRef on AutoDisposeFutureProviderRef<List<Cards>?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetCardsProviderElement
    extends AutoDisposeFutureProviderElement<List<Cards>?> with GetCardsRef {
  _GetCardsProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as GetCardsProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as GetCardsProvider).cancelToken;
}

String _$getCardTokenHash() => r'e546dcde1447e66016dfb5cdbca491794bc05219';

/// See also [getCardToken].
@ProviderFor(getCardToken)
const getCardTokenProvider = GetCardTokenFamily();

/// See also [getCardToken].
class GetCardTokenFamily extends Family<AsyncValue<GetCardToken?>> {
  /// See also [getCardToken].
  const GetCardTokenFamily();

  /// See also [getCardToken].
  GetCardTokenProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetCardTokenProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetCardTokenProvider getProviderOverride(
    covariant GetCardTokenProvider provider,
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
  String? get name => r'getCardTokenProvider';
}

/// See also [getCardToken].
class GetCardTokenProvider extends AutoDisposeFutureProvider<GetCardToken?> {
  /// See also [getCardToken].
  GetCardTokenProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getCardToken(
            ref as GetCardTokenRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getCardTokenProvider,
          name: r'getCardTokenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCardTokenHash,
          dependencies: GetCardTokenFamily._dependencies,
          allTransitiveDependencies:
              GetCardTokenFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetCardTokenProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<GetCardToken?> Function(GetCardTokenRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCardTokenProvider._internal(
        (ref) => create(ref as GetCardTokenRef),
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
  AutoDisposeFutureProviderElement<GetCardToken?> createElement() {
    return _GetCardTokenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCardTokenProvider &&
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

mixin GetCardTokenRef on AutoDisposeFutureProviderRef<GetCardToken?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetCardTokenProviderElement
    extends AutoDisposeFutureProviderElement<GetCardToken?>
    with GetCardTokenRef {
  _GetCardTokenProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as GetCardTokenProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as GetCardTokenProvider).cancelToken;
}

String _$getExchangeRateHash() => r'b123128372d71818eb783ecafa32b23a0ba24ac5';

/// See also [getExchangeRate].
@ProviderFor(getExchangeRate)
const getExchangeRateProvider = GetExchangeRateFamily();

/// See also [getExchangeRate].
class GetExchangeRateFamily extends Family<AsyncValue<GetExchangeRate?>> {
  /// See also [getExchangeRate].
  const GetExchangeRateFamily();

  /// See also [getExchangeRate].
  GetExchangeRateProvider call({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) {
    return GetExchangeRateProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  GetExchangeRateProvider getProviderOverride(
    covariant GetExchangeRateProvider provider,
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
  String? get name => r'getExchangeRateProvider';
}

/// See also [getExchangeRate].
class GetExchangeRateProvider
    extends AutoDisposeFutureProvider<GetExchangeRate?> {
  /// See also [getExchangeRate].
  GetExchangeRateProvider({
    required CardDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getExchangeRate(
            ref as GetExchangeRateRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: getExchangeRateProvider,
          name: r'getExchangeRateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getExchangeRateHash,
          dependencies: GetExchangeRateFamily._dependencies,
          allTransitiveDependencies:
              GetExchangeRateFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  GetExchangeRateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final CardDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<GetExchangeRate?> Function(GetExchangeRateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetExchangeRateProvider._internal(
        (ref) => create(ref as GetExchangeRateRef),
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
  AutoDisposeFutureProviderElement<GetExchangeRate?> createElement() {
    return _GetExchangeRateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetExchangeRateProvider &&
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

mixin GetExchangeRateRef on AutoDisposeFutureProviderRef<GetExchangeRate?> {
  /// The parameter `parameter` of this provider.
  CardDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetExchangeRateProviderElement
    extends AutoDisposeFutureProviderElement<GetExchangeRate?>
    with GetExchangeRateRef {
  _GetExchangeRateProviderElement(super.provider);

  @override
  CardDto get parameter => (origin as GetExchangeRateProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as GetExchangeRateProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
