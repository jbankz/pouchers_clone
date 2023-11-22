// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uploadFileHash() => r'1e26f8f1d716333a1bec8a92c5b7daad42941823';

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

/// See also [uploadFile].
@ProviderFor(uploadFile)
const uploadFileProvider = UploadFileFamily();

/// See also [uploadFile].
class UploadFileFamily extends Family<AsyncValue<bool>> {
  /// See also [uploadFile].
  const UploadFileFamily();

  /// See also [uploadFile].
  UploadFileProvider call({
    required UploadDto uploadDto,
    CancelToken? cancelToken,
  }) {
    return UploadFileProvider(
      uploadDto: uploadDto,
      cancelToken: cancelToken,
    );
  }

  @override
  UploadFileProvider getProviderOverride(
    covariant UploadFileProvider provider,
  ) {
    return call(
      uploadDto: provider.uploadDto,
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
  String? get name => r'uploadFileProvider';
}

/// See also [uploadFile].
class UploadFileProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [uploadFile].
  UploadFileProvider({
    required UploadDto uploadDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => uploadFile(
            ref as UploadFileRef,
            uploadDto: uploadDto,
            cancelToken: cancelToken,
          ),
          from: uploadFileProvider,
          name: r'uploadFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadFileHash,
          dependencies: UploadFileFamily._dependencies,
          allTransitiveDependencies:
              UploadFileFamily._allTransitiveDependencies,
          uploadDto: uploadDto,
          cancelToken: cancelToken,
        );

  UploadFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uploadDto,
    required this.cancelToken,
  }) : super.internal();

  final UploadDto uploadDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UploadFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadFileProvider._internal(
        (ref) => create(ref as UploadFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uploadDto: uploadDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UploadFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadFileProvider &&
        other.uploadDto == uploadDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uploadDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadFileRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `uploadDto` of this provider.
  UploadDto get uploadDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _UploadFileProviderElement extends AutoDisposeFutureProviderElement<bool>
    with UploadFileRef {
  _UploadFileProviderElement(super.provider);

  @override
  UploadDto get uploadDto => (origin as UploadFileProvider).uploadDto;
  @override
  CancelToken? get cancelToken => (origin as UploadFileProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
