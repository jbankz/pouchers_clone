// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$requestsHash() => r'3291ee5238d1a9d1f85e3a1643656bc699cbc554';

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

/// See also [requests].
@ProviderFor(requests)
const requestsProvider = RequestsFamily();

/// See also [requests].
class RequestsFamily extends Family<AsyncValue<List<RequestModel>>> {
  /// See also [requests].
  const RequestsFamily();

  /// See also [requests].
  RequestsProvider call(
    RequestDto requestDto, {
    CancelToken? cancelToken,
  }) {
    return RequestsProvider(
      requestDto,
      cancelToken: cancelToken,
    );
  }

  @override
  RequestsProvider getProviderOverride(
    covariant RequestsProvider provider,
  ) {
    return call(
      provider.requestDto,
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
  String? get name => r'requestsProvider';
}

/// See also [requests].
class RequestsProvider extends AutoDisposeFutureProvider<List<RequestModel>> {
  /// See also [requests].
  RequestsProvider(
    RequestDto requestDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => requests(
            ref as RequestsRef,
            requestDto,
            cancelToken: cancelToken,
          ),
          from: requestsProvider,
          name: r'requestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requestsHash,
          dependencies: RequestsFamily._dependencies,
          allTransitiveDependencies: RequestsFamily._allTransitiveDependencies,
          requestDto: requestDto,
          cancelToken: cancelToken,
        );

  RequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requestDto,
    required this.cancelToken,
  }) : super.internal();

  final RequestDto requestDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<RequestModel>> Function(RequestsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestsProvider._internal(
        (ref) => create(ref as RequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requestDto: requestDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RequestModel>> createElement() {
    return _RequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestsProvider &&
        other.requestDto == requestDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requestDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RequestsRef on AutoDisposeFutureProviderRef<List<RequestModel>> {
  /// The parameter `requestDto` of this provider.
  RequestDto get requestDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _RequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<RequestModel>>
    with RequestsRef {
  _RequestsProviderElement(super.provider);

  @override
  RequestDto get requestDto => (origin as RequestsProvider).requestDto;
  @override
  CancelToken? get cancelToken => (origin as RequestsProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
