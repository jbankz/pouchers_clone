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

String _$validateBVNHash() => r'64c54551547d69fa9c93030e8459df5455951b64';

/// See also [validateBVN].
@ProviderFor(validateBVN)
const validateBVNProvider = ValidateBVNFamily();

/// See also [validateBVN].
class ValidateBVNFamily extends Family<AsyncValue<User?>> {
  /// See also [validateBVN].
  const ValidateBVNFamily();

  /// See also [validateBVN].
  ValidateBVNProvider call({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) {
    return ValidateBVNProvider(
      userDto: userDto,
      cancelToken: cancelToken,
    );
  }

  @override
  ValidateBVNProvider getProviderOverride(
    covariant ValidateBVNProvider provider,
  ) {
    return call(
      userDto: provider.userDto,
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
  String? get name => r'validateBVNProvider';
}

/// See also [validateBVN].
class ValidateBVNProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [validateBVN].
  ValidateBVNProvider({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validateBVN(
            ref as ValidateBVNRef,
            userDto: userDto,
            cancelToken: cancelToken,
          ),
          from: validateBVNProvider,
          name: r'validateBVNProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validateBVNHash,
          dependencies: ValidateBVNFamily._dependencies,
          allTransitiveDependencies:
              ValidateBVNFamily._allTransitiveDependencies,
          userDto: userDto,
          cancelToken: cancelToken,
        );

  ValidateBVNProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userDto,
    required this.cancelToken,
  }) : super.internal();

  final UserDto userDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<User?> Function(ValidateBVNRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidateBVNProvider._internal(
        (ref) => create(ref as ValidateBVNRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userDto: userDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User?> createElement() {
    return _ValidateBVNProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateBVNProvider &&
        other.userDto == userDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ValidateBVNRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `userDto` of this provider.
  UserDto get userDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ValidateBVNProviderElement
    extends AutoDisposeFutureProviderElement<User?> with ValidateBVNRef {
  _ValidateBVNProviderElement(super.provider);

  @override
  UserDto get userDto => (origin as ValidateBVNProvider).userDto;
  @override
  CancelToken? get cancelToken => (origin as ValidateBVNProvider).cancelToken;
}

String _$validateIDHash() => r'99adbd185c10531b2a583002396cb71e1dfc7bb2';

/// See also [validateID].
@ProviderFor(validateID)
const validateIDProvider = ValidateIDFamily();

/// See also [validateID].
class ValidateIDFamily extends Family<AsyncValue<User?>> {
  /// See also [validateID].
  const ValidateIDFamily();

  /// See also [validateID].
  ValidateIDProvider call({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) {
    return ValidateIDProvider(
      userDto: userDto,
      cancelToken: cancelToken,
    );
  }

  @override
  ValidateIDProvider getProviderOverride(
    covariant ValidateIDProvider provider,
  ) {
    return call(
      userDto: provider.userDto,
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
  String? get name => r'validateIDProvider';
}

/// See also [validateID].
class ValidateIDProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [validateID].
  ValidateIDProvider({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validateID(
            ref as ValidateIDRef,
            userDto: userDto,
            cancelToken: cancelToken,
          ),
          from: validateIDProvider,
          name: r'validateIDProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validateIDHash,
          dependencies: ValidateIDFamily._dependencies,
          allTransitiveDependencies:
              ValidateIDFamily._allTransitiveDependencies,
          userDto: userDto,
          cancelToken: cancelToken,
        );

  ValidateIDProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userDto,
    required this.cancelToken,
  }) : super.internal();

  final UserDto userDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<User?> Function(ValidateIDRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidateIDProvider._internal(
        (ref) => create(ref as ValidateIDRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userDto: userDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User?> createElement() {
    return _ValidateIDProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateIDProvider &&
        other.userDto == userDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ValidateIDRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `userDto` of this provider.
  UserDto get userDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ValidateIDProviderElement extends AutoDisposeFutureProviderElement<User?>
    with ValidateIDRef {
  _ValidateIDProviderElement(super.provider);

  @override
  UserDto get userDto => (origin as ValidateIDProvider).userDto;
  @override
  CancelToken? get cancelToken => (origin as ValidateIDProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
