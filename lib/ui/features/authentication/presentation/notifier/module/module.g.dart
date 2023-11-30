// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpUserHash() => r'076266f1ca1e5442e1bd8e41108ec4e07d37a506';

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

/// See also [signUpUser].
@ProviderFor(signUpUser)
const signUpUserProvider = SignUpUserFamily();

/// See also [signUpUser].
class SignUpUserFamily extends Family<AsyncValue<SignUpModel?>> {
  /// See also [signUpUser].
  const SignUpUserFamily();

  /// See also [signUpUser].
  SignUpUserProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return SignUpUserProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  SignUpUserProvider getProviderOverride(
    covariant SignUpUserProvider provider,
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
  String? get name => r'signUpUserProvider';
}

/// See also [signUpUser].
class SignUpUserProvider extends AutoDisposeFutureProvider<SignUpModel?> {
  /// See also [signUpUser].
  SignUpUserProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => signUpUser(
            ref as SignUpUserRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: signUpUserProvider,
          name: r'signUpUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpUserHash,
          dependencies: SignUpUserFamily._dependencies,
          allTransitiveDependencies:
              SignUpUserFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  SignUpUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<SignUpModel?> Function(SignUpUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignUpUserProvider._internal(
        (ref) => create(ref as SignUpUserRef),
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
  AutoDisposeFutureProviderElement<SignUpModel?> createElement() {
    return _SignUpUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpUserProvider &&
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

mixin SignUpUserRef on AutoDisposeFutureProviderRef<SignUpModel?> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _SignUpUserProviderElement
    extends AutoDisposeFutureProviderElement<SignUpModel?> with SignUpUserRef {
  _SignUpUserProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as SignUpUserProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as SignUpUserProvider).cancelToken;
}

String _$signInUserHash() => r'6d9c991507d279ca66d138d06c16bb8adc91ef06';

/// See also [signInUser].
@ProviderFor(signInUser)
const signInUserProvider = SignInUserFamily();

/// See also [signInUser].
class SignInUserFamily extends Family<AsyncValue<SignInModel?>> {
  /// See also [signInUser].
  const SignInUserFamily();

  /// See also [signInUser].
  SignInUserProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return SignInUserProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  SignInUserProvider getProviderOverride(
    covariant SignInUserProvider provider,
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
  String? get name => r'signInUserProvider';
}

/// See also [signInUser].
class SignInUserProvider extends AutoDisposeFutureProvider<SignInModel?> {
  /// See also [signInUser].
  SignInUserProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => signInUser(
            ref as SignInUserRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: signInUserProvider,
          name: r'signInUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInUserHash,
          dependencies: SignInUserFamily._dependencies,
          allTransitiveDependencies:
              SignInUserFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  SignInUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<SignInModel?> Function(SignInUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignInUserProvider._internal(
        (ref) => create(ref as SignInUserRef),
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
  AutoDisposeFutureProviderElement<SignInModel?> createElement() {
    return _SignInUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInUserProvider &&
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

mixin SignInUserRef on AutoDisposeFutureProviderRef<SignInModel?> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _SignInUserProviderElement
    extends AutoDisposeFutureProviderElement<SignInModel?> with SignInUserRef {
  _SignInUserProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as SignInUserProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as SignInUserProvider).cancelToken;
}

String _$requestOTPHash() => r'a6488da72c0dcea7f381bb931626c1d15a85f7ca';

/// See also [requestOTP].
@ProviderFor(requestOTP)
const requestOTPProvider = RequestOTPFamily();

/// See also [requestOTP].
class RequestOTPFamily extends Family<AsyncValue<RequestOtpModel?>> {
  /// See also [requestOTP].
  const RequestOTPFamily();

  /// See also [requestOTP].
  RequestOTPProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return RequestOTPProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  RequestOTPProvider getProviderOverride(
    covariant RequestOTPProvider provider,
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
  String? get name => r'requestOTPProvider';
}

/// See also [requestOTP].
class RequestOTPProvider extends AutoDisposeFutureProvider<RequestOtpModel?> {
  /// See also [requestOTP].
  RequestOTPProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => requestOTP(
            ref as RequestOTPRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: requestOTPProvider,
          name: r'requestOTPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requestOTPHash,
          dependencies: RequestOTPFamily._dependencies,
          allTransitiveDependencies:
              RequestOTPFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  RequestOTPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<RequestOtpModel?> Function(RequestOTPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestOTPProvider._internal(
        (ref) => create(ref as RequestOTPRef),
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
  AutoDisposeFutureProviderElement<RequestOtpModel?> createElement() {
    return _RequestOTPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestOTPProvider &&
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

mixin RequestOTPRef on AutoDisposeFutureProviderRef<RequestOtpModel?> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _RequestOTPProviderElement
    extends AutoDisposeFutureProviderElement<RequestOtpModel?>
    with RequestOTPRef {
  _RequestOTPProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as RequestOTPProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as RequestOTPProvider).cancelToken;
}

String _$verifyOTPHash() => r'1aed17e7001de9cc5e6d03d3e49fc6e68835fa11';

/// See also [verifyOTP].
@ProviderFor(verifyOTP)
const verifyOTPProvider = VerifyOTPFamily();

/// See also [verifyOTP].
class VerifyOTPFamily extends Family<AsyncValue<VerifyAccountModel?>> {
  /// See also [verifyOTP].
  const VerifyOTPFamily();

  /// See also [verifyOTP].
  VerifyOTPProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return VerifyOTPProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  VerifyOTPProvider getProviderOverride(
    covariant VerifyOTPProvider provider,
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
  String? get name => r'verifyOTPProvider';
}

/// See also [verifyOTP].
class VerifyOTPProvider extends AutoDisposeFutureProvider<VerifyAccountModel?> {
  /// See also [verifyOTP].
  VerifyOTPProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => verifyOTP(
            ref as VerifyOTPRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: verifyOTPProvider,
          name: r'verifyOTPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOTPHash,
          dependencies: VerifyOTPFamily._dependencies,
          allTransitiveDependencies: VerifyOTPFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  VerifyOTPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<VerifyAccountModel?> Function(VerifyOTPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOTPProvider._internal(
        (ref) => create(ref as VerifyOTPRef),
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
  AutoDisposeFutureProviderElement<VerifyAccountModel?> createElement() {
    return _VerifyOTPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOTPProvider &&
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

mixin VerifyOTPRef on AutoDisposeFutureProviderRef<VerifyAccountModel?> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _VerifyOTPProviderElement
    extends AutoDisposeFutureProviderElement<VerifyAccountModel?>
    with VerifyOTPRef {
  _VerifyOTPProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as VerifyOTPProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as VerifyOTPProvider).cancelToken;
}

String _$createTagHash() => r'4ad4b5c94087c439203bfd25f74a8966637ebb5c';

/// See also [createTag].
@ProviderFor(createTag)
const createTagProvider = CreateTagFamily();

/// See also [createTag].
class CreateTagFamily extends Family<AsyncValue<CreateTagModel?>> {
  /// See also [createTag].
  const CreateTagFamily();

  /// See also [createTag].
  CreateTagProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return CreateTagProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  CreateTagProvider getProviderOverride(
    covariant CreateTagProvider provider,
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
  String? get name => r'createTagProvider';
}

/// See also [createTag].
class CreateTagProvider extends AutoDisposeFutureProvider<CreateTagModel?> {
  /// See also [createTag].
  CreateTagProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => createTag(
            ref as CreateTagRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: createTagProvider,
          name: r'createTagProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTagHash,
          dependencies: CreateTagFamily._dependencies,
          allTransitiveDependencies: CreateTagFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  CreateTagProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<CreateTagModel?> Function(CreateTagRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateTagProvider._internal(
        (ref) => create(ref as CreateTagRef),
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
  AutoDisposeFutureProviderElement<CreateTagModel?> createElement() {
    return _CreateTagProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTagProvider &&
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

mixin CreateTagRef on AutoDisposeFutureProviderRef<CreateTagModel?> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _CreateTagProviderElement
    extends AutoDisposeFutureProviderElement<CreateTagModel?>
    with CreateTagRef {
  _CreateTagProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as CreateTagProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as CreateTagProvider).cancelToken;
}

String _$createTransactionPinHash() =>
    r'8f70657b23945b681176a7e4989a15403e04ea46';

/// See also [createTransactionPin].
@ProviderFor(createTransactionPin)
const createTransactionPinProvider = CreateTransactionPinFamily();

/// See also [createTransactionPin].
class CreateTransactionPinFamily extends Family<AsyncValue<CreatePinModel?>> {
  /// See also [createTransactionPin].
  const CreateTransactionPinFamily();

  /// See also [createTransactionPin].
  CreateTransactionPinProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return CreateTransactionPinProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  CreateTransactionPinProvider getProviderOverride(
    covariant CreateTransactionPinProvider provider,
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
  String? get name => r'createTransactionPinProvider';
}

/// See also [createTransactionPin].
class CreateTransactionPinProvider
    extends AutoDisposeFutureProvider<CreatePinModel?> {
  /// See also [createTransactionPin].
  CreateTransactionPinProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => createTransactionPin(
            ref as CreateTransactionPinRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: createTransactionPinProvider,
          name: r'createTransactionPinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTransactionPinHash,
          dependencies: CreateTransactionPinFamily._dependencies,
          allTransitiveDependencies:
              CreateTransactionPinFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  CreateTransactionPinProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<CreatePinModel?> Function(CreateTransactionPinRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateTransactionPinProvider._internal(
        (ref) => create(ref as CreateTransactionPinRef),
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
  AutoDisposeFutureProviderElement<CreatePinModel?> createElement() {
    return _CreateTransactionPinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTransactionPinProvider &&
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

mixin CreateTransactionPinRef on AutoDisposeFutureProviderRef<CreatePinModel?> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _CreateTransactionPinProviderElement
    extends AutoDisposeFutureProviderElement<CreatePinModel?>
    with CreateTransactionPinRef {
  _CreateTransactionPinProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as CreateTransactionPinProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as CreateTransactionPinProvider).cancelToken;
}

String _$forgotPasswordHash() => r'071eb82f199d8f1be661ebb334c3199107e98f20';

/// See also [forgotPassword].
@ProviderFor(forgotPassword)
const forgotPasswordProvider = ForgotPasswordFamily();

/// See also [forgotPassword].
class ForgotPasswordFamily extends Family<AsyncValue<bool>> {
  /// See also [forgotPassword].
  const ForgotPasswordFamily();

  /// See also [forgotPassword].
  ForgotPasswordProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return ForgotPasswordProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  ForgotPasswordProvider getProviderOverride(
    covariant ForgotPasswordProvider provider,
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
  String? get name => r'forgotPasswordProvider';
}

/// See also [forgotPassword].
class ForgotPasswordProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [forgotPassword].
  ForgotPasswordProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => forgotPassword(
            ref as ForgotPasswordRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: forgotPasswordProvider,
          name: r'forgotPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forgotPasswordHash,
          dependencies: ForgotPasswordFamily._dependencies,
          allTransitiveDependencies:
              ForgotPasswordFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  ForgotPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ForgotPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForgotPasswordProvider._internal(
        (ref) => create(ref as ForgotPasswordRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ForgotPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForgotPasswordProvider &&
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

mixin ForgotPasswordRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ForgotPasswordProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ForgotPasswordRef {
  _ForgotPasswordProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as ForgotPasswordProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as ForgotPasswordProvider).cancelToken;
}

String _$validateResetPasswordHash() =>
    r'f1280b762e8e7bb947e108e69f866005f9d333fe';

/// See also [validateResetPassword].
@ProviderFor(validateResetPassword)
const validateResetPasswordProvider = ValidateResetPasswordFamily();

/// See also [validateResetPassword].
class ValidateResetPasswordFamily
    extends Family<AsyncValue<ValidateResetPasswordModel>> {
  /// See also [validateResetPassword].
  const ValidateResetPasswordFamily();

  /// See also [validateResetPassword].
  ValidateResetPasswordProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return ValidateResetPasswordProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  ValidateResetPasswordProvider getProviderOverride(
    covariant ValidateResetPasswordProvider provider,
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
  String? get name => r'validateResetPasswordProvider';
}

/// See also [validateResetPassword].
class ValidateResetPasswordProvider
    extends AutoDisposeFutureProvider<ValidateResetPasswordModel> {
  /// See also [validateResetPassword].
  ValidateResetPasswordProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validateResetPassword(
            ref as ValidateResetPasswordRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: validateResetPasswordProvider,
          name: r'validateResetPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validateResetPasswordHash,
          dependencies: ValidateResetPasswordFamily._dependencies,
          allTransitiveDependencies:
              ValidateResetPasswordFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  ValidateResetPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<ValidateResetPasswordModel> Function(
            ValidateResetPasswordRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidateResetPasswordProvider._internal(
        (ref) => create(ref as ValidateResetPasswordRef),
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
  AutoDisposeFutureProviderElement<ValidateResetPasswordModel> createElement() {
    return _ValidateResetPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidateResetPasswordProvider &&
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

mixin ValidateResetPasswordRef
    on AutoDisposeFutureProviderRef<ValidateResetPasswordModel> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ValidateResetPasswordProviderElement
    extends AutoDisposeFutureProviderElement<ValidateResetPasswordModel>
    with ValidateResetPasswordRef {
  _ValidateResetPasswordProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as ValidateResetPasswordProvider).parameter;
  @override
  CancelToken? get cancelToken =>
      (origin as ValidateResetPasswordProvider).cancelToken;
}

String _$resetPasswordHash() => r'fe6688718496302a6246ea46e24f61a4f1ed5ded';

/// See also [resetPassword].
@ProviderFor(resetPassword)
const resetPasswordProvider = ResetPasswordFamily();

/// See also [resetPassword].
class ResetPasswordFamily extends Family<AsyncValue<ResetPasswordModel>> {
  /// See also [resetPassword].
  const ResetPasswordFamily();

  /// See also [resetPassword].
  ResetPasswordProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return ResetPasswordProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  ResetPasswordProvider getProviderOverride(
    covariant ResetPasswordProvider provider,
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
  String? get name => r'resetPasswordProvider';
}

/// See also [resetPassword].
class ResetPasswordProvider
    extends AutoDisposeFutureProvider<ResetPasswordModel> {
  /// See also [resetPassword].
  ResetPasswordProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => resetPassword(
            ref as ResetPasswordRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: resetPasswordProvider,
          name: r'resetPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resetPasswordHash,
          dependencies: ResetPasswordFamily._dependencies,
          allTransitiveDependencies:
              ResetPasswordFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  ResetPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<ResetPasswordModel> Function(ResetPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResetPasswordProvider._internal(
        (ref) => create(ref as ResetPasswordRef),
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
  AutoDisposeFutureProviderElement<ResetPasswordModel> createElement() {
    return _ResetPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordProvider &&
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

mixin ResetPasswordRef on AutoDisposeFutureProviderRef<ResetPasswordModel> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ResetPasswordProviderElement
    extends AutoDisposeFutureProviderElement<ResetPasswordModel>
    with ResetPasswordRef {
  _ResetPasswordProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as ResetPasswordProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as ResetPasswordProvider).cancelToken;
}

String _$changePinHash() => r'2ce9640dd3c3f59b2567b19bf07ba06fb47db75f';

/// See also [changePin].
@ProviderFor(changePin)
const changePinProvider = ChangePinFamily();

/// See also [changePin].
class ChangePinFamily extends Family<AsyncValue<bool>> {
  /// See also [changePin].
  const ChangePinFamily();

  /// See also [changePin].
  ChangePinProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return ChangePinProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  ChangePinProvider getProviderOverride(
    covariant ChangePinProvider provider,
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
  String? get name => r'changePinProvider';
}

/// See also [changePin].
class ChangePinProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [changePin].
  ChangePinProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => changePin(
            ref as ChangePinRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: changePinProvider,
          name: r'changePinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$changePinHash,
          dependencies: ChangePinFamily._dependencies,
          allTransitiveDependencies: ChangePinFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  ChangePinProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parameter,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto parameter;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ChangePinRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChangePinProvider._internal(
        (ref) => create(ref as ChangePinRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ChangePinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChangePinProvider &&
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

mixin ChangePinRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ChangePinProviderElement extends AutoDisposeFutureProviderElement<bool>
    with ChangePinRef {
  _ChangePinProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as ChangePinProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as ChangePinProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
