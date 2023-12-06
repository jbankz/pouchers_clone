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

String _$validIdsHash() => r'bbe1a199924a4f49644df6370f72faf210e90465';

/// See also [validIds].
@ProviderFor(validIds)
final validIdsProvider = AutoDisposeProvider<List<IdentificationType>>.internal(
  validIds,
  name: r'validIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$validIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ValidIdsRef = AutoDisposeProviderRef<List<IdentificationType>>;
String _$getUsersProfileHash() => r'e07bd039b6a6f3c331c9b2c4aa184a635ce1127f';

/// See also [getUsersProfile].
@ProviderFor(getUsersProfile)
const getUsersProfileProvider = GetUsersProfileFamily();

/// See also [getUsersProfile].
class GetUsersProfileFamily extends Family<AsyncValue<User?>> {
  /// See also [getUsersProfile].
  const GetUsersProfileFamily();

  /// See also [getUsersProfile].
  GetUsersProfileProvider call({
    CancelToken? cancelToken,
  }) {
    return GetUsersProfileProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  GetUsersProfileProvider getProviderOverride(
    covariant GetUsersProfileProvider provider,
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
  String? get name => r'getUsersProfileProvider';
}

/// See also [getUsersProfile].
class GetUsersProfileProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [getUsersProfile].
  GetUsersProfileProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => getUsersProfile(
            ref as GetUsersProfileRef,
            cancelToken: cancelToken,
          ),
          from: getUsersProfileProvider,
          name: r'getUsersProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUsersProfileHash,
          dependencies: GetUsersProfileFamily._dependencies,
          allTransitiveDependencies:
              GetUsersProfileFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  GetUsersProfileProvider._internal(
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
    FutureOr<User?> Function(GetUsersProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUsersProfileProvider._internal(
        (ref) => create(ref as GetUsersProfileRef),
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
  AutoDisposeFutureProviderElement<User?> createElement() {
    return _GetUsersProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUsersProfileProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUsersProfileRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GetUsersProfileProviderElement
    extends AutoDisposeFutureProviderElement<User?> with GetUsersProfileRef {
  _GetUsersProfileProviderElement(super.provider);

  @override
  CancelToken? get cancelToken =>
      (origin as GetUsersProfileProvider).cancelToken;
}

String _$updateProfileHash() => r'dc68dcf44d7dc199181cf780610b1c841c301d57';

/// See also [updateProfile].
@ProviderFor(updateProfile)
const updateProfileProvider = UpdateProfileFamily();

/// See also [updateProfile].
class UpdateProfileFamily extends Family<AsyncValue<User?>> {
  /// See also [updateProfile].
  const UpdateProfileFamily();

  /// See also [updateProfile].
  UpdateProfileProvider call({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) {
    return UpdateProfileProvider(
      userDto: userDto,
      cancelToken: cancelToken,
    );
  }

  @override
  UpdateProfileProvider getProviderOverride(
    covariant UpdateProfileProvider provider,
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
  String? get name => r'updateProfileProvider';
}

/// See also [updateProfile].
class UpdateProfileProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [updateProfile].
  UpdateProfileProvider({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => updateProfile(
            ref as UpdateProfileRef,
            userDto: userDto,
            cancelToken: cancelToken,
          ),
          from: updateProfileProvider,
          name: r'updateProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateProfileHash,
          dependencies: UpdateProfileFamily._dependencies,
          allTransitiveDependencies:
              UpdateProfileFamily._allTransitiveDependencies,
          userDto: userDto,
          cancelToken: cancelToken,
        );

  UpdateProfileProvider._internal(
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
    FutureOr<User?> Function(UpdateProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateProfileProvider._internal(
        (ref) => create(ref as UpdateProfileRef),
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
    return _UpdateProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileProvider &&
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

mixin UpdateProfileRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `userDto` of this provider.
  UserDto get userDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _UpdateProfileProviderElement
    extends AutoDisposeFutureProviderElement<User?> with UpdateProfileRef {
  _UpdateProfileProviderElement(super.provider);

  @override
  UserDto get userDto => (origin as UpdateProfileProvider).userDto;
  @override
  CancelToken? get cancelToken => (origin as UpdateProfileProvider).cancelToken;
}

String _$changePhoneNumberHash() => r'baad9d5e34f0d7206e24be598713dccf2e44d79b';

/// See also [changePhoneNumber].
@ProviderFor(changePhoneNumber)
const changePhoneNumberProvider = ChangePhoneNumberFamily();

/// See also [changePhoneNumber].
class ChangePhoneNumberFamily extends Family<AsyncValue<User?>> {
  /// See also [changePhoneNumber].
  const ChangePhoneNumberFamily();

  /// See also [changePhoneNumber].
  ChangePhoneNumberProvider call({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) {
    return ChangePhoneNumberProvider(
      userDto: userDto,
      cancelToken: cancelToken,
    );
  }

  @override
  ChangePhoneNumberProvider getProviderOverride(
    covariant ChangePhoneNumberProvider provider,
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
  String? get name => r'changePhoneNumberProvider';
}

/// See also [changePhoneNumber].
class ChangePhoneNumberProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [changePhoneNumber].
  ChangePhoneNumberProvider({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => changePhoneNumber(
            ref as ChangePhoneNumberRef,
            userDto: userDto,
            cancelToken: cancelToken,
          ),
          from: changePhoneNumberProvider,
          name: r'changePhoneNumberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$changePhoneNumberHash,
          dependencies: ChangePhoneNumberFamily._dependencies,
          allTransitiveDependencies:
              ChangePhoneNumberFamily._allTransitiveDependencies,
          userDto: userDto,
          cancelToken: cancelToken,
        );

  ChangePhoneNumberProvider._internal(
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
    FutureOr<User?> Function(ChangePhoneNumberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChangePhoneNumberProvider._internal(
        (ref) => create(ref as ChangePhoneNumberRef),
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
    return _ChangePhoneNumberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChangePhoneNumberProvider &&
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

mixin ChangePhoneNumberRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `userDto` of this provider.
  UserDto get userDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ChangePhoneNumberProviderElement
    extends AutoDisposeFutureProviderElement<User?> with ChangePhoneNumberRef {
  _ChangePhoneNumberProviderElement(super.provider);

  @override
  UserDto get userDto => (origin as ChangePhoneNumberProvider).userDto;
  @override
  CancelToken? get cancelToken =>
      (origin as ChangePhoneNumberProvider).cancelToken;
}

String _$requestPhoneNumberOtpHash() =>
    r'0deeb089af39f65b8ee8565ce335e491323781a7';

/// See also [requestPhoneNumberOtp].
@ProviderFor(requestPhoneNumberOtp)
const requestPhoneNumberOtpProvider = RequestPhoneNumberOtpFamily();

/// See also [requestPhoneNumberOtp].
class RequestPhoneNumberOtpFamily extends Family<AsyncValue<User?>> {
  /// See also [requestPhoneNumberOtp].
  const RequestPhoneNumberOtpFamily();

  /// See also [requestPhoneNumberOtp].
  RequestPhoneNumberOtpProvider call({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) {
    return RequestPhoneNumberOtpProvider(
      userDto: userDto,
      cancelToken: cancelToken,
    );
  }

  @override
  RequestPhoneNumberOtpProvider getProviderOverride(
    covariant RequestPhoneNumberOtpProvider provider,
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
  String? get name => r'requestPhoneNumberOtpProvider';
}

/// See also [requestPhoneNumberOtp].
class RequestPhoneNumberOtpProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [requestPhoneNumberOtp].
  RequestPhoneNumberOtpProvider({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => requestPhoneNumberOtp(
            ref as RequestPhoneNumberOtpRef,
            userDto: userDto,
            cancelToken: cancelToken,
          ),
          from: requestPhoneNumberOtpProvider,
          name: r'requestPhoneNumberOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requestPhoneNumberOtpHash,
          dependencies: RequestPhoneNumberOtpFamily._dependencies,
          allTransitiveDependencies:
              RequestPhoneNumberOtpFamily._allTransitiveDependencies,
          userDto: userDto,
          cancelToken: cancelToken,
        );

  RequestPhoneNumberOtpProvider._internal(
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
    FutureOr<User?> Function(RequestPhoneNumberOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestPhoneNumberOtpProvider._internal(
        (ref) => create(ref as RequestPhoneNumberOtpRef),
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
    return _RequestPhoneNumberOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestPhoneNumberOtpProvider &&
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

mixin RequestPhoneNumberOtpRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `userDto` of this provider.
  UserDto get userDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _RequestPhoneNumberOtpProviderElement
    extends AutoDisposeFutureProviderElement<User?>
    with RequestPhoneNumberOtpRef {
  _RequestPhoneNumberOtpProviderElement(super.provider);

  @override
  UserDto get userDto => (origin as RequestPhoneNumberOtpProvider).userDto;
  @override
  CancelToken? get cancelToken =>
      (origin as RequestPhoneNumberOtpProvider).cancelToken;
}

String _$validatePhoneNumberOtpHash() =>
    r'a8d71e9addc44baf5dfeaffb426c1bb677444148';

/// See also [validatePhoneNumberOtp].
@ProviderFor(validatePhoneNumberOtp)
const validatePhoneNumberOtpProvider = ValidatePhoneNumberOtpFamily();

/// See also [validatePhoneNumberOtp].
class ValidatePhoneNumberOtpFamily extends Family<AsyncValue<User?>> {
  /// See also [validatePhoneNumberOtp].
  const ValidatePhoneNumberOtpFamily();

  /// See also [validatePhoneNumberOtp].
  ValidatePhoneNumberOtpProvider call({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) {
    return ValidatePhoneNumberOtpProvider(
      userDto: userDto,
      cancelToken: cancelToken,
    );
  }

  @override
  ValidatePhoneNumberOtpProvider getProviderOverride(
    covariant ValidatePhoneNumberOtpProvider provider,
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
  String? get name => r'validatePhoneNumberOtpProvider';
}

/// See also [validatePhoneNumberOtp].
class ValidatePhoneNumberOtpProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [validatePhoneNumberOtp].
  ValidatePhoneNumberOtpProvider({
    required UserDto userDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validatePhoneNumberOtp(
            ref as ValidatePhoneNumberOtpRef,
            userDto: userDto,
            cancelToken: cancelToken,
          ),
          from: validatePhoneNumberOtpProvider,
          name: r'validatePhoneNumberOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validatePhoneNumberOtpHash,
          dependencies: ValidatePhoneNumberOtpFamily._dependencies,
          allTransitiveDependencies:
              ValidatePhoneNumberOtpFamily._allTransitiveDependencies,
          userDto: userDto,
          cancelToken: cancelToken,
        );

  ValidatePhoneNumberOtpProvider._internal(
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
    FutureOr<User?> Function(ValidatePhoneNumberOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidatePhoneNumberOtpProvider._internal(
        (ref) => create(ref as ValidatePhoneNumberOtpRef),
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
    return _ValidatePhoneNumberOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidatePhoneNumberOtpProvider &&
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

mixin ValidatePhoneNumberOtpRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `userDto` of this provider.
  UserDto get userDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ValidatePhoneNumberOtpProviderElement
    extends AutoDisposeFutureProviderElement<User?>
    with ValidatePhoneNumberOtpRef {
  _ValidatePhoneNumberOtpProviderElement(super.provider);

  @override
  UserDto get userDto => (origin as ValidatePhoneNumberOtpProvider).userDto;
  @override
  CancelToken? get cancelToken =>
      (origin as ValidatePhoneNumberOtpProvider).cancelToken;
}

String _$referralHash() => r'55932096ed0e9e8ff63928a4951f8c8e72528692';

/// See also [referral].
@ProviderFor(referral)
const referralProvider = ReferralFamily();

/// See also [referral].
class ReferralFamily extends Family<AsyncValue<Referral?>> {
  /// See also [referral].
  const ReferralFamily();

  /// See also [referral].
  ReferralProvider call({
    CancelToken? cancelToken,
  }) {
    return ReferralProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  ReferralProvider getProviderOverride(
    covariant ReferralProvider provider,
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
  String? get name => r'referralProvider';
}

/// See also [referral].
class ReferralProvider extends AutoDisposeFutureProvider<Referral?> {
  /// See also [referral].
  ReferralProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => referral(
            ref as ReferralRef,
            cancelToken: cancelToken,
          ),
          from: referralProvider,
          name: r'referralProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$referralHash,
          dependencies: ReferralFamily._dependencies,
          allTransitiveDependencies: ReferralFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  ReferralProvider._internal(
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
    FutureOr<Referral?> Function(ReferralRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReferralProvider._internal(
        (ref) => create(ref as ReferralRef),
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
  AutoDisposeFutureProviderElement<Referral?> createElement() {
    return _ReferralProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReferralProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReferralRef on AutoDisposeFutureProviderRef<Referral?> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ReferralProviderElement
    extends AutoDisposeFutureProviderElement<Referral?> with ReferralRef {
  _ReferralProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as ReferralProvider).cancelToken;
}

String _$deleteAccountHash() => r'fad8225824d5c9736e994f3f5189c1759b2804c3';

/// See also [deleteAccount].
@ProviderFor(deleteAccount)
const deleteAccountProvider = DeleteAccountFamily();

/// See also [deleteAccount].
class DeleteAccountFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteAccount].
  const DeleteAccountFamily();

  /// See also [deleteAccount].
  DeleteAccountProvider call({
    CancelToken? cancelToken,
  }) {
    return DeleteAccountProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  DeleteAccountProvider getProviderOverride(
    covariant DeleteAccountProvider provider,
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
  String? get name => r'deleteAccountProvider';
}

/// See also [deleteAccount].
class DeleteAccountProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteAccount].
  DeleteAccountProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => deleteAccount(
            ref as DeleteAccountRef,
            cancelToken: cancelToken,
          ),
          from: deleteAccountProvider,
          name: r'deleteAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteAccountHash,
          dependencies: DeleteAccountFamily._dependencies,
          allTransitiveDependencies:
              DeleteAccountFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  DeleteAccountProvider._internal(
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
    FutureOr<bool> Function(DeleteAccountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteAccountProvider._internal(
        (ref) => create(ref as DeleteAccountRef),
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
    return _DeleteAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteAccountProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteAccountRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _DeleteAccountProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteAccountRef {
  _DeleteAccountProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as DeleteAccountProvider).cancelToken;
}

String _$disableAccountHash() => r'50eaab5c7c28f8be99e0f647d0ac9fb81f490104';

/// See also [disableAccount].
@ProviderFor(disableAccount)
const disableAccountProvider = DisableAccountFamily();

/// See also [disableAccount].
class DisableAccountFamily extends Family<AsyncValue<bool>> {
  /// See also [disableAccount].
  const DisableAccountFamily();

  /// See also [disableAccount].
  DisableAccountProvider call(
    String reason, {
    CancelToken? cancelToken,
  }) {
    return DisableAccountProvider(
      reason,
      cancelToken: cancelToken,
    );
  }

  @override
  DisableAccountProvider getProviderOverride(
    covariant DisableAccountProvider provider,
  ) {
    return call(
      provider.reason,
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
  String? get name => r'disableAccountProvider';
}

/// See also [disableAccount].
class DisableAccountProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [disableAccount].
  DisableAccountProvider(
    String reason, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => disableAccount(
            ref as DisableAccountRef,
            reason,
            cancelToken: cancelToken,
          ),
          from: disableAccountProvider,
          name: r'disableAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$disableAccountHash,
          dependencies: DisableAccountFamily._dependencies,
          allTransitiveDependencies:
              DisableAccountFamily._allTransitiveDependencies,
          reason: reason,
          cancelToken: cancelToken,
        );

  DisableAccountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.reason,
    required this.cancelToken,
  }) : super.internal();

  final String reason;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DisableAccountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DisableAccountProvider._internal(
        (ref) => create(ref as DisableAccountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        reason: reason,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DisableAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DisableAccountProvider &&
        other.reason == reason &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reason.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DisableAccountRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `reason` of this provider.
  String get reason;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _DisableAccountProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DisableAccountRef {
  _DisableAccountProviderElement(super.provider);

  @override
  String get reason => (origin as DisableAccountProvider).reason;
  @override
  CancelToken? get cancelToken =>
      (origin as DisableAccountProvider).cancelToken;
}

String _$validateBankAccountHash() =>
    r'913b95e48d1da3aadf6868eabaea382d5d256a91';

/// See also [validateBankAccount].
@ProviderFor(validateBankAccount)
const validateBankAccountProvider = ValidateBankAccountFamily();

/// See also [validateBankAccount].
class ValidateBankAccountFamily extends Family<AsyncValue<BankAccountDetails>> {
  /// See also [validateBankAccount].
  const ValidateBankAccountFamily();

  /// See also [validateBankAccount].
  ValidateBankAccountProvider call(
    WalletDto walletDto, {
    CancelToken? cancelToken,
  }) {
    return ValidateBankAccountProvider(
      walletDto,
      cancelToken: cancelToken,
    );
  }

  @override
  ValidateBankAccountProvider getProviderOverride(
    covariant ValidateBankAccountProvider provider,
  ) {
    return call(
      provider.walletDto,
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
  String? get name => r'validateBankAccountProvider';
}

/// See also [validateBankAccount].
class ValidateBankAccountProvider
    extends AutoDisposeFutureProvider<BankAccountDetails> {
  /// See also [validateBankAccount].
  ValidateBankAccountProvider(
    WalletDto walletDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validateBankAccount(
            ref as ValidateBankAccountRef,
            walletDto,
            cancelToken: cancelToken,
          ),
          from: validateBankAccountProvider,
          name: r'validateBankAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validateBankAccountHash,
          dependencies: ValidateBankAccountFamily._dependencies,
          allTransitiveDependencies:
              ValidateBankAccountFamily._allTransitiveDependencies,
          walletDto: walletDto,
          cancelToken: cancelToken,
        );

  ValidateBankAccountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.walletDto,
    required this.cancelToken,
  }) : super.internal();

  final WalletDto walletDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<BankAccountDetails> Function(ValidateBankAccountRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidateBankAccountProvider._internal(
        (ref) => create(ref as ValidateBankAccountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        walletDto: walletDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BankAccountDetails> createElement() {
    return _ValidateBankAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateBankAccountProvider &&
        other.walletDto == walletDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, walletDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ValidateBankAccountRef
    on AutoDisposeFutureProviderRef<BankAccountDetails> {
  /// The parameter `walletDto` of this provider.
  WalletDto get walletDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ValidateBankAccountProviderElement
    extends AutoDisposeFutureProviderElement<BankAccountDetails>
    with ValidateBankAccountRef {
  _ValidateBankAccountProviderElement(super.provider);

  @override
  WalletDto get walletDto => (origin as ValidateBankAccountProvider).walletDto;
  @override
  CancelToken? get cancelToken =>
      (origin as ValidateBankAccountProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
