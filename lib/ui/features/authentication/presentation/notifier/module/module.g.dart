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

String _$validatePinHash() => r'aedf78956802db950ddfc3e784db64c1c38afc34';

/// See also [validatePin].
@ProviderFor(validatePin)
const validatePinProvider = ValidatePinFamily();

/// See also [validatePin].
class ValidatePinFamily extends Family<AsyncValue<bool>> {
  /// See also [validatePin].
  const ValidatePinFamily();

  /// See also [validatePin].
  ValidatePinProvider call({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) {
    return ValidatePinProvider(
      parameter: parameter,
      cancelToken: cancelToken,
    );
  }

  @override
  ValidatePinProvider getProviderOverride(
    covariant ValidatePinProvider provider,
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
  String? get name => r'validatePinProvider';
}

/// See also [validatePin].
class ValidatePinProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [validatePin].
  ValidatePinProvider({
    required AuthDto parameter,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validatePin(
            ref as ValidatePinRef,
            parameter: parameter,
            cancelToken: cancelToken,
          ),
          from: validatePinProvider,
          name: r'validatePinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validatePinHash,
          dependencies: ValidatePinFamily._dependencies,
          allTransitiveDependencies:
              ValidatePinFamily._allTransitiveDependencies,
          parameter: parameter,
          cancelToken: cancelToken,
        );

  ValidatePinProvider._internal(
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
    FutureOr<bool> Function(ValidatePinRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidatePinProvider._internal(
        (ref) => create(ref as ValidatePinRef),
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
    return _ValidatePinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidatePinProvider &&
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

mixin ValidatePinRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `parameter` of this provider.
  AuthDto get parameter;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ValidatePinProviderElement extends AutoDisposeFutureProviderElement<bool>
    with ValidatePinRef {
  _ValidatePinProviderElement(super.provider);

  @override
  AuthDto get parameter => (origin as ValidatePinProvider).parameter;
  @override
  CancelToken? get cancelToken => (origin as ValidatePinProvider).cancelToken;
}

String _$securityQuestionsHash() => r'0d113723417838d73773456ff588720d432add2b';

/// See also [securityQuestions].
@ProviderFor(securityQuestions)
const securityQuestionsProvider = SecurityQuestionsFamily();

/// See also [securityQuestions].
class SecurityQuestionsFamily
    extends Family<AsyncValue<List<SecurityQuestions>>> {
  /// See also [securityQuestions].
  const SecurityQuestionsFamily();

  /// See also [securityQuestions].
  SecurityQuestionsProvider call({
    CancelToken? cancelToken,
  }) {
    return SecurityQuestionsProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  SecurityQuestionsProvider getProviderOverride(
    covariant SecurityQuestionsProvider provider,
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
  String? get name => r'securityQuestionsProvider';
}

/// See also [securityQuestions].
class SecurityQuestionsProvider
    extends AutoDisposeFutureProvider<List<SecurityQuestions>> {
  /// See also [securityQuestions].
  SecurityQuestionsProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => securityQuestions(
            ref as SecurityQuestionsRef,
            cancelToken: cancelToken,
          ),
          from: securityQuestionsProvider,
          name: r'securityQuestionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$securityQuestionsHash,
          dependencies: SecurityQuestionsFamily._dependencies,
          allTransitiveDependencies:
              SecurityQuestionsFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  SecurityQuestionsProvider._internal(
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
    FutureOr<List<SecurityQuestions>> Function(SecurityQuestionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SecurityQuestionsProvider._internal(
        (ref) => create(ref as SecurityQuestionsRef),
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
  AutoDisposeFutureProviderElement<List<SecurityQuestions>> createElement() {
    return _SecurityQuestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SecurityQuestionsProvider &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SecurityQuestionsRef
    on AutoDisposeFutureProviderRef<List<SecurityQuestions>> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _SecurityQuestionsProviderElement
    extends AutoDisposeFutureProviderElement<List<SecurityQuestions>>
    with SecurityQuestionsRef {
  _SecurityQuestionsProviderElement(super.provider);

  @override
  CancelToken? get cancelToken =>
      (origin as SecurityQuestionsProvider).cancelToken;
}

String _$answerQuestionHash() => r'f5e30a77fcc6133c71b7663ea53ad50129938140';

/// See also [answerQuestion].
@ProviderFor(answerQuestion)
const answerQuestionProvider = AnswerQuestionFamily();

/// See also [answerQuestion].
class AnswerQuestionFamily extends Family<AsyncValue<List<SetQuestions>>> {
  /// See also [answerQuestion].
  const AnswerQuestionFamily();

  /// See also [answerQuestion].
  AnswerQuestionProvider call(
    TwoFaDto twoFaDto, {
    CancelToken? cancelToken,
  }) {
    return AnswerQuestionProvider(
      twoFaDto,
      cancelToken: cancelToken,
    );
  }

  @override
  AnswerQuestionProvider getProviderOverride(
    covariant AnswerQuestionProvider provider,
  ) {
    return call(
      provider.twoFaDto,
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
  String? get name => r'answerQuestionProvider';
}

/// See also [answerQuestion].
class AnswerQuestionProvider
    extends AutoDisposeFutureProvider<List<SetQuestions>> {
  /// See also [answerQuestion].
  AnswerQuestionProvider(
    TwoFaDto twoFaDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => answerQuestion(
            ref as AnswerQuestionRef,
            twoFaDto,
            cancelToken: cancelToken,
          ),
          from: answerQuestionProvider,
          name: r'answerQuestionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$answerQuestionHash,
          dependencies: AnswerQuestionFamily._dependencies,
          allTransitiveDependencies:
              AnswerQuestionFamily._allTransitiveDependencies,
          twoFaDto: twoFaDto,
          cancelToken: cancelToken,
        );

  AnswerQuestionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.twoFaDto,
    required this.cancelToken,
  }) : super.internal();

  final TwoFaDto twoFaDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<SetQuestions>> Function(AnswerQuestionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnswerQuestionProvider._internal(
        (ref) => create(ref as AnswerQuestionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        twoFaDto: twoFaDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SetQuestions>> createElement() {
    return _AnswerQuestionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnswerQuestionProvider &&
        other.twoFaDto == twoFaDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, twoFaDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnswerQuestionRef on AutoDisposeFutureProviderRef<List<SetQuestions>> {
  /// The parameter `twoFaDto` of this provider.
  TwoFaDto get twoFaDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _AnswerQuestionProviderElement
    extends AutoDisposeFutureProviderElement<List<SetQuestions>>
    with AnswerQuestionRef {
  _AnswerQuestionProviderElement(super.provider);

  @override
  TwoFaDto get twoFaDto => (origin as AnswerQuestionProvider).twoFaDto;
  @override
  CancelToken? get cancelToken =>
      (origin as AnswerQuestionProvider).cancelToken;
}

String _$generateTwoFaTokenHash() =>
    r'c3804c7b7ed9e171818b1bf01ff3f2cc90700eac';

/// See also [generateTwoFaToken].
@ProviderFor(generateTwoFaToken)
const generateTwoFaTokenProvider = GenerateTwoFaTokenFamily();

/// See also [generateTwoFaToken].
class GenerateTwoFaTokenFamily extends Family<AsyncValue<Generate2faToken>> {
  /// See also [generateTwoFaToken].
  const GenerateTwoFaTokenFamily();

  /// See also [generateTwoFaToken].
  GenerateTwoFaTokenProvider call({
    CancelToken? cancelToken,
  }) {
    return GenerateTwoFaTokenProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  GenerateTwoFaTokenProvider getProviderOverride(
    covariant GenerateTwoFaTokenProvider provider,
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
  String? get name => r'generateTwoFaTokenProvider';
}

/// See also [generateTwoFaToken].
class GenerateTwoFaTokenProvider
    extends AutoDisposeFutureProvider<Generate2faToken> {
  /// See also [generateTwoFaToken].
  GenerateTwoFaTokenProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => generateTwoFaToken(
            ref as GenerateTwoFaTokenRef,
            cancelToken: cancelToken,
          ),
          from: generateTwoFaTokenProvider,
          name: r'generateTwoFaTokenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$generateTwoFaTokenHash,
          dependencies: GenerateTwoFaTokenFamily._dependencies,
          allTransitiveDependencies:
              GenerateTwoFaTokenFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  GenerateTwoFaTokenProvider._internal(
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
    FutureOr<Generate2faToken> Function(GenerateTwoFaTokenRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateTwoFaTokenProvider._internal(
        (ref) => create(ref as GenerateTwoFaTokenRef),
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
  AutoDisposeFutureProviderElement<Generate2faToken> createElement() {
    return _GenerateTwoFaTokenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateTwoFaTokenProvider &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GenerateTwoFaTokenRef on AutoDisposeFutureProviderRef<Generate2faToken> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _GenerateTwoFaTokenProviderElement
    extends AutoDisposeFutureProviderElement<Generate2faToken>
    with GenerateTwoFaTokenRef {
  _GenerateTwoFaTokenProviderElement(super.provider);

  @override
  CancelToken? get cancelToken =>
      (origin as GenerateTwoFaTokenProvider).cancelToken;
}

String _$validate2faCodeHash() => r'063a9b224142288c6a7886f4022aaa153a701fad';

/// See also [validate2faCode].
@ProviderFor(validate2faCode)
const validate2faCodeProvider = Validate2faCodeFamily();

/// See also [validate2faCode].
class Validate2faCodeFamily extends Family<AsyncValue<bool>> {
  /// See also [validate2faCode].
  const Validate2faCodeFamily();

  /// See also [validate2faCode].
  Validate2faCodeProvider call(
    TwoFaDto twoFaDto, {
    CancelToken? cancelToken,
  }) {
    return Validate2faCodeProvider(
      twoFaDto,
      cancelToken: cancelToken,
    );
  }

  @override
  Validate2faCodeProvider getProviderOverride(
    covariant Validate2faCodeProvider provider,
  ) {
    return call(
      provider.twoFaDto,
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
  String? get name => r'validate2faCodeProvider';
}

/// See also [validate2faCode].
class Validate2faCodeProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [validate2faCode].
  Validate2faCodeProvider(
    TwoFaDto twoFaDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validate2faCode(
            ref as Validate2faCodeRef,
            twoFaDto,
            cancelToken: cancelToken,
          ),
          from: validate2faCodeProvider,
          name: r'validate2faCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validate2faCodeHash,
          dependencies: Validate2faCodeFamily._dependencies,
          allTransitiveDependencies:
              Validate2faCodeFamily._allTransitiveDependencies,
          twoFaDto: twoFaDto,
          cancelToken: cancelToken,
        );

  Validate2faCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.twoFaDto,
    required this.cancelToken,
  }) : super.internal();

  final TwoFaDto twoFaDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(Validate2faCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: Validate2faCodeProvider._internal(
        (ref) => create(ref as Validate2faCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        twoFaDto: twoFaDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _Validate2faCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is Validate2faCodeProvider &&
        other.twoFaDto == twoFaDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, twoFaDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin Validate2faCodeRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `twoFaDto` of this provider.
  TwoFaDto get twoFaDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _Validate2faCodeProviderElement
    extends AutoDisposeFutureProviderElement<bool> with Validate2faCodeRef {
  _Validate2faCodeProviderElement(super.provider);

  @override
  TwoFaDto get twoFaDto => (origin as Validate2faCodeProvider).twoFaDto;
  @override
  CancelToken? get cancelToken =>
      (origin as Validate2faCodeProvider).cancelToken;
}

String _$validate2faAnswerHash() => r'5b054e3734bd52cac8bc56a31677b2e775226467';

/// See also [validate2faAnswer].
@ProviderFor(validate2faAnswer)
const validate2faAnswerProvider = Validate2faAnswerFamily();

/// See also [validate2faAnswer].
class Validate2faAnswerFamily extends Family<AsyncValue<bool>> {
  /// See also [validate2faAnswer].
  const Validate2faAnswerFamily();

  /// See also [validate2faAnswer].
  Validate2faAnswerProvider call(
    TwoFaDto twoFaDto, {
    CancelToken? cancelToken,
  }) {
    return Validate2faAnswerProvider(
      twoFaDto,
      cancelToken: cancelToken,
    );
  }

  @override
  Validate2faAnswerProvider getProviderOverride(
    covariant Validate2faAnswerProvider provider,
  ) {
    return call(
      provider.twoFaDto,
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
  String? get name => r'validate2faAnswerProvider';
}

/// See also [validate2faAnswer].
class Validate2faAnswerProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [validate2faAnswer].
  Validate2faAnswerProvider(
    TwoFaDto twoFaDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => validate2faAnswer(
            ref as Validate2faAnswerRef,
            twoFaDto,
            cancelToken: cancelToken,
          ),
          from: validate2faAnswerProvider,
          name: r'validate2faAnswerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validate2faAnswerHash,
          dependencies: Validate2faAnswerFamily._dependencies,
          allTransitiveDependencies:
              Validate2faAnswerFamily._allTransitiveDependencies,
          twoFaDto: twoFaDto,
          cancelToken: cancelToken,
        );

  Validate2faAnswerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.twoFaDto,
    required this.cancelToken,
  }) : super.internal();

  final TwoFaDto twoFaDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(Validate2faAnswerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: Validate2faAnswerProvider._internal(
        (ref) => create(ref as Validate2faAnswerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        twoFaDto: twoFaDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _Validate2faAnswerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is Validate2faAnswerProvider &&
        other.twoFaDto == twoFaDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, twoFaDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin Validate2faAnswerRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `twoFaDto` of this provider.
  TwoFaDto get twoFaDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _Validate2faAnswerProviderElement
    extends AutoDisposeFutureProviderElement<bool> with Validate2faAnswerRef {
  _Validate2faAnswerProviderElement(super.provider);

  @override
  TwoFaDto get twoFaDto => (origin as Validate2faAnswerProvider).twoFaDto;
  @override
  CancelToken? get cancelToken =>
      (origin as Validate2faAnswerProvider).cancelToken;
}

String _$selectedQuestionsHash() => r'6f7b14572965a4f60f617778cf577400a8628a56';

/// See also [selectedQuestions].
@ProviderFor(selectedQuestions)
const selectedQuestionsProvider = SelectedQuestionsFamily();

/// See also [selectedQuestions].
class SelectedQuestionsFamily
    extends Family<AsyncValue<List<SelectedQuestions>>> {
  /// See also [selectedQuestions].
  const SelectedQuestionsFamily();

  /// See also [selectedQuestions].
  SelectedQuestionsProvider call({
    CancelToken? cancelToken,
  }) {
    return SelectedQuestionsProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  SelectedQuestionsProvider getProviderOverride(
    covariant SelectedQuestionsProvider provider,
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
  String? get name => r'selectedQuestionsProvider';
}

/// See also [selectedQuestions].
class SelectedQuestionsProvider
    extends AutoDisposeFutureProvider<List<SelectedQuestions>> {
  /// See also [selectedQuestions].
  SelectedQuestionsProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => selectedQuestions(
            ref as SelectedQuestionsRef,
            cancelToken: cancelToken,
          ),
          from: selectedQuestionsProvider,
          name: r'selectedQuestionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedQuestionsHash,
          dependencies: SelectedQuestionsFamily._dependencies,
          allTransitiveDependencies:
              SelectedQuestionsFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  SelectedQuestionsProvider._internal(
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
    FutureOr<List<SelectedQuestions>> Function(SelectedQuestionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedQuestionsProvider._internal(
        (ref) => create(ref as SelectedQuestionsRef),
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
  AutoDisposeFutureProviderElement<List<SelectedQuestions>> createElement() {
    return _SelectedQuestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedQuestionsProvider &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedQuestionsRef
    on AutoDisposeFutureProviderRef<List<SelectedQuestions>> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _SelectedQuestionsProviderElement
    extends AutoDisposeFutureProviderElement<List<SelectedQuestions>>
    with SelectedQuestionsRef {
  _SelectedQuestionsProviderElement(super.provider);

  @override
  CancelToken? get cancelToken =>
      (origin as SelectedQuestionsProvider).cancelToken;
}

String _$disableTwoFaHash() => r'4632474efadeb101edcb2e4301d73df0115fecc0';

/// See also [disableTwoFa].
@ProviderFor(disableTwoFa)
const disableTwoFaProvider = DisableTwoFaFamily();

/// See also [disableTwoFa].
class DisableTwoFaFamily extends Family<AsyncValue<User?>> {
  /// See also [disableTwoFa].
  const DisableTwoFaFamily();

  /// See also [disableTwoFa].
  DisableTwoFaProvider call(
    AuthDto authDto, {
    CancelToken? cancelToken,
  }) {
    return DisableTwoFaProvider(
      authDto,
      cancelToken: cancelToken,
    );
  }

  @override
  DisableTwoFaProvider getProviderOverride(
    covariant DisableTwoFaProvider provider,
  ) {
    return call(
      provider.authDto,
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
  String? get name => r'disableTwoFaProvider';
}

/// See also [disableTwoFa].
class DisableTwoFaProvider extends AutoDisposeFutureProvider<User?> {
  /// See also [disableTwoFa].
  DisableTwoFaProvider(
    AuthDto authDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => disableTwoFa(
            ref as DisableTwoFaRef,
            authDto,
            cancelToken: cancelToken,
          ),
          from: disableTwoFaProvider,
          name: r'disableTwoFaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$disableTwoFaHash,
          dependencies: DisableTwoFaFamily._dependencies,
          allTransitiveDependencies:
              DisableTwoFaFamily._allTransitiveDependencies,
          authDto: authDto,
          cancelToken: cancelToken,
        );

  DisableTwoFaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authDto,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto authDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<User?> Function(DisableTwoFaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DisableTwoFaProvider._internal(
        (ref) => create(ref as DisableTwoFaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authDto: authDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User?> createElement() {
    return _DisableTwoFaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DisableTwoFaProvider &&
        other.authDto == authDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DisableTwoFaRef on AutoDisposeFutureProviderRef<User?> {
  /// The parameter `authDto` of this provider.
  AuthDto get authDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _DisableTwoFaProviderElement
    extends AutoDisposeFutureProviderElement<User?> with DisableTwoFaRef {
  _DisableTwoFaProviderElement(super.provider);

  @override
  AuthDto get authDto => (origin as DisableTwoFaProvider).authDto;
  @override
  CancelToken? get cancelToken => (origin as DisableTwoFaProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
