// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localBanksHash() => r'285169a82be831fdedab87cd7dcf511653502fe9';

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

/// See also [localBanks].
@ProviderFor(localBanks)
const localBanksProvider = LocalBanksFamily();

/// See also [localBanks].
class LocalBanksFamily extends Family<AsyncValue<List<LocalBank>>> {
  /// See also [localBanks].
  const LocalBanksFamily();

  /// See also [localBanks].
  LocalBanksProvider call({
    CancelToken? cancelToken,
  }) {
    return LocalBanksProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  LocalBanksProvider getProviderOverride(
    covariant LocalBanksProvider provider,
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
  String? get name => r'localBanksProvider';
}

/// See also [localBanks].
class LocalBanksProvider extends AutoDisposeFutureProvider<List<LocalBank>> {
  /// See also [localBanks].
  LocalBanksProvider({
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => localBanks(
            ref as LocalBanksRef,
            cancelToken: cancelToken,
          ),
          from: localBanksProvider,
          name: r'localBanksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localBanksHash,
          dependencies: LocalBanksFamily._dependencies,
          allTransitiveDependencies:
              LocalBanksFamily._allTransitiveDependencies,
          cancelToken: cancelToken,
        );

  LocalBanksProvider._internal(
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
    FutureOr<List<LocalBank>> Function(LocalBanksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocalBanksProvider._internal(
        (ref) => create(ref as LocalBanksRef),
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
  AutoDisposeFutureProviderElement<List<LocalBank>> createElement() {
    return _LocalBanksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalBanksProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalBanksRef on AutoDisposeFutureProviderRef<List<LocalBank>> {
  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _LocalBanksProviderElement
    extends AutoDisposeFutureProviderElement<List<LocalBank>>
    with LocalBanksRef {
  _LocalBanksProviderElement(super.provider);

  @override
  CancelToken? get cancelToken => (origin as LocalBanksProvider).cancelToken;
}

String _$transferToLocalBankHash() =>
    r'b477e2059c000ef8d867cb4755c6e397727a8040';

/// See also [transferToLocalBank].
@ProviderFor(transferToLocalBank)
const transferToLocalBankProvider = TransferToLocalBankFamily();

/// See also [transferToLocalBank].
class TransferToLocalBankFamily extends Family<AsyncValue<bool>> {
  /// See also [transferToLocalBank].
  const TransferToLocalBankFamily();

  /// See also [transferToLocalBank].
  TransferToLocalBankProvider call(
    TransferMoneyDto transferMoneyDto, {
    CancelToken? cancelToken,
  }) {
    return TransferToLocalBankProvider(
      transferMoneyDto,
      cancelToken: cancelToken,
    );
  }

  @override
  TransferToLocalBankProvider getProviderOverride(
    covariant TransferToLocalBankProvider provider,
  ) {
    return call(
      provider.transferMoneyDto,
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
  String? get name => r'transferToLocalBankProvider';
}

/// See also [transferToLocalBank].
class TransferToLocalBankProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [transferToLocalBank].
  TransferToLocalBankProvider(
    TransferMoneyDto transferMoneyDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => transferToLocalBank(
            ref as TransferToLocalBankRef,
            transferMoneyDto,
            cancelToken: cancelToken,
          ),
          from: transferToLocalBankProvider,
          name: r'transferToLocalBankProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transferToLocalBankHash,
          dependencies: TransferToLocalBankFamily._dependencies,
          allTransitiveDependencies:
              TransferToLocalBankFamily._allTransitiveDependencies,
          transferMoneyDto: transferMoneyDto,
          cancelToken: cancelToken,
        );

  TransferToLocalBankProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transferMoneyDto,
    required this.cancelToken,
  }) : super.internal();

  final TransferMoneyDto transferMoneyDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(TransferToLocalBankRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransferToLocalBankProvider._internal(
        (ref) => create(ref as TransferToLocalBankRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transferMoneyDto: transferMoneyDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _TransferToLocalBankProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransferToLocalBankProvider &&
        other.transferMoneyDto == transferMoneyDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transferMoneyDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransferToLocalBankRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `transferMoneyDto` of this provider.
  TransferMoneyDto get transferMoneyDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _TransferToLocalBankProviderElement
    extends AutoDisposeFutureProviderElement<bool> with TransferToLocalBankRef {
  _TransferToLocalBankProviderElement(super.provider);

  @override
  TransferMoneyDto get transferMoneyDto =>
      (origin as TransferToLocalBankProvider).transferMoneyDto;
  @override
  CancelToken? get cancelToken =>
      (origin as TransferToLocalBankProvider).cancelToken;
}

String _$p2pTransferHash() => r'd857bdca69bccb400d48ae454d66d14761f37b4a';

/// See also [p2pTransfer].
@ProviderFor(p2pTransfer)
const p2pTransferProvider = P2pTransferFamily();

/// See also [p2pTransfer].
class P2pTransferFamily extends Family<AsyncValue<Transfer>> {
  /// See also [p2pTransfer].
  const P2pTransferFamily();

  /// See also [p2pTransfer].
  P2pTransferProvider call(
    TransferMoneyDto transferMoneyDto, {
    CancelToken? cancelToken,
  }) {
    return P2pTransferProvider(
      transferMoneyDto,
      cancelToken: cancelToken,
    );
  }

  @override
  P2pTransferProvider getProviderOverride(
    covariant P2pTransferProvider provider,
  ) {
    return call(
      provider.transferMoneyDto,
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
  String? get name => r'p2pTransferProvider';
}

/// See also [p2pTransfer].
class P2pTransferProvider extends AutoDisposeFutureProvider<Transfer> {
  /// See also [p2pTransfer].
  P2pTransferProvider(
    TransferMoneyDto transferMoneyDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => p2pTransfer(
            ref as P2pTransferRef,
            transferMoneyDto,
            cancelToken: cancelToken,
          ),
          from: p2pTransferProvider,
          name: r'p2pTransferProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$p2pTransferHash,
          dependencies: P2pTransferFamily._dependencies,
          allTransitiveDependencies:
              P2pTransferFamily._allTransitiveDependencies,
          transferMoneyDto: transferMoneyDto,
          cancelToken: cancelToken,
        );

  P2pTransferProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transferMoneyDto,
    required this.cancelToken,
  }) : super.internal();

  final TransferMoneyDto transferMoneyDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Transfer> Function(P2pTransferRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: P2pTransferProvider._internal(
        (ref) => create(ref as P2pTransferRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transferMoneyDto: transferMoneyDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Transfer> createElement() {
    return _P2pTransferProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is P2pTransferProvider &&
        other.transferMoneyDto == transferMoneyDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transferMoneyDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin P2pTransferRef on AutoDisposeFutureProviderRef<Transfer> {
  /// The parameter `transferMoneyDto` of this provider.
  TransferMoneyDto get transferMoneyDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _P2pTransferProviderElement
    extends AutoDisposeFutureProviderElement<Transfer> with P2pTransferRef {
  _P2pTransferProviderElement(super.provider);

  @override
  TransferMoneyDto get transferMoneyDto =>
      (origin as P2pTransferProvider).transferMoneyDto;
  @override
  CancelToken? get cancelToken => (origin as P2pTransferProvider).cancelToken;
}

String _$scheduleP2pTransferHash() =>
    r'c43125e6dea3ac907829b2c5f5b2f45c3a3ce169';

/// See also [scheduleP2pTransfer].
@ProviderFor(scheduleP2pTransfer)
const scheduleP2pTransferProvider = ScheduleP2pTransferFamily();

/// See also [scheduleP2pTransfer].
class ScheduleP2pTransferFamily extends Family<AsyncValue<Schedule>> {
  /// See also [scheduleP2pTransfer].
  const ScheduleP2pTransferFamily();

  /// See also [scheduleP2pTransfer].
  ScheduleP2pTransferProvider call(
    MobileDto mobileDto, {
    CancelToken? cancelToken,
  }) {
    return ScheduleP2pTransferProvider(
      mobileDto,
      cancelToken: cancelToken,
    );
  }

  @override
  ScheduleP2pTransferProvider getProviderOverride(
    covariant ScheduleP2pTransferProvider provider,
  ) {
    return call(
      provider.mobileDto,
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
  String? get name => r'scheduleP2pTransferProvider';
}

/// See also [scheduleP2pTransfer].
class ScheduleP2pTransferProvider extends AutoDisposeFutureProvider<Schedule> {
  /// See also [scheduleP2pTransfer].
  ScheduleP2pTransferProvider(
    MobileDto mobileDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => scheduleP2pTransfer(
            ref as ScheduleP2pTransferRef,
            mobileDto,
            cancelToken: cancelToken,
          ),
          from: scheduleP2pTransferProvider,
          name: r'scheduleP2pTransferProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleP2pTransferHash,
          dependencies: ScheduleP2pTransferFamily._dependencies,
          allTransitiveDependencies:
              ScheduleP2pTransferFamily._allTransitiveDependencies,
          mobileDto: mobileDto,
          cancelToken: cancelToken,
        );

  ScheduleP2pTransferProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mobileDto,
    required this.cancelToken,
  }) : super.internal();

  final MobileDto mobileDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<Schedule> Function(ScheduleP2pTransferRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleP2pTransferProvider._internal(
        (ref) => create(ref as ScheduleP2pTransferRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mobileDto: mobileDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Schedule> createElement() {
    return _ScheduleP2pTransferProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleP2pTransferProvider &&
        other.mobileDto == mobileDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mobileDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScheduleP2pTransferRef on AutoDisposeFutureProviderRef<Schedule> {
  /// The parameter `mobileDto` of this provider.
  MobileDto get mobileDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _ScheduleP2pTransferProviderElement
    extends AutoDisposeFutureProviderElement<Schedule>
    with ScheduleP2pTransferRef {
  _ScheduleP2pTransferProviderElement(super.provider);

  @override
  MobileDto get mobileDto => (origin as ScheduleP2pTransferProvider).mobileDto;
  @override
  CancelToken? get cancelToken =>
      (origin as ScheduleP2pTransferProvider).cancelToken;
}

String _$requestMoneyHash() => r'2015ff71a654139db92943e6cf70f79035a245d3';

/// See also [requestMoney].
@ProviderFor(requestMoney)
const requestMoneyProvider = RequestMoneyFamily();

/// See also [requestMoney].
class RequestMoneyFamily extends Family<AsyncValue<bool>> {
  /// See also [requestMoney].
  const RequestMoneyFamily();

  /// See also [requestMoney].
  RequestMoneyProvider call(
    TransferMoneyDto transferMoneyDto, {
    CancelToken? cancelToken,
  }) {
    return RequestMoneyProvider(
      transferMoneyDto,
      cancelToken: cancelToken,
    );
  }

  @override
  RequestMoneyProvider getProviderOverride(
    covariant RequestMoneyProvider provider,
  ) {
    return call(
      provider.transferMoneyDto,
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
  String? get name => r'requestMoneyProvider';
}

/// See also [requestMoney].
class RequestMoneyProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [requestMoney].
  RequestMoneyProvider(
    TransferMoneyDto transferMoneyDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => requestMoney(
            ref as RequestMoneyRef,
            transferMoneyDto,
            cancelToken: cancelToken,
          ),
          from: requestMoneyProvider,
          name: r'requestMoneyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requestMoneyHash,
          dependencies: RequestMoneyFamily._dependencies,
          allTransitiveDependencies:
              RequestMoneyFamily._allTransitiveDependencies,
          transferMoneyDto: transferMoneyDto,
          cancelToken: cancelToken,
        );

  RequestMoneyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transferMoneyDto,
    required this.cancelToken,
  }) : super.internal();

  final TransferMoneyDto transferMoneyDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(RequestMoneyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestMoneyProvider._internal(
        (ref) => create(ref as RequestMoneyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transferMoneyDto: transferMoneyDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _RequestMoneyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestMoneyProvider &&
        other.transferMoneyDto == transferMoneyDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transferMoneyDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RequestMoneyRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `transferMoneyDto` of this provider.
  TransferMoneyDto get transferMoneyDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _RequestMoneyProviderElement
    extends AutoDisposeFutureProviderElement<bool> with RequestMoneyRef {
  _RequestMoneyProviderElement(super.provider);

  @override
  TransferMoneyDto get transferMoneyDto =>
      (origin as RequestMoneyProvider).transferMoneyDto;
  @override
  CancelToken? get cancelToken => (origin as RequestMoneyProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
