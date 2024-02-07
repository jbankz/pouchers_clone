// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$schedulesHash() => r'83e6d06b014c9a82aa622ba025f536b4c673d49e';

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

/// See also [schedules].
@ProviderFor(schedules)
const schedulesProvider = SchedulesFamily();

/// See also [schedules].
class SchedulesFamily extends Family<AsyncValue<List<ScheduleModel>>> {
  /// See also [schedules].
  const SchedulesFamily();

  /// See also [schedules].
  SchedulesProvider call(
    ScheduleDto scheduleDto, {
    CancelToken? cancelToken,
  }) {
    return SchedulesProvider(
      scheduleDto,
      cancelToken: cancelToken,
    );
  }

  @override
  SchedulesProvider getProviderOverride(
    covariant SchedulesProvider provider,
  ) {
    return call(
      provider.scheduleDto,
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
  String? get name => r'schedulesProvider';
}

/// See also [schedules].
class SchedulesProvider extends AutoDisposeFutureProvider<List<ScheduleModel>> {
  /// See also [schedules].
  SchedulesProvider(
    ScheduleDto scheduleDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => schedules(
            ref as SchedulesRef,
            scheduleDto,
            cancelToken: cancelToken,
          ),
          from: schedulesProvider,
          name: r'schedulesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$schedulesHash,
          dependencies: SchedulesFamily._dependencies,
          allTransitiveDependencies: SchedulesFamily._allTransitiveDependencies,
          scheduleDto: scheduleDto,
          cancelToken: cancelToken,
        );

  SchedulesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scheduleDto,
    required this.cancelToken,
  }) : super.internal();

  final ScheduleDto scheduleDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<List<ScheduleModel>> Function(SchedulesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SchedulesProvider._internal(
        (ref) => create(ref as SchedulesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scheduleDto: scheduleDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ScheduleModel>> createElement() {
    return _SchedulesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SchedulesProvider &&
        other.scheduleDto == scheduleDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scheduleDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SchedulesRef on AutoDisposeFutureProviderRef<List<ScheduleModel>> {
  /// The parameter `scheduleDto` of this provider.
  ScheduleDto get scheduleDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _SchedulesProviderElement
    extends AutoDisposeFutureProviderElement<List<ScheduleModel>>
    with SchedulesRef {
  _SchedulesProviderElement(super.provider);

  @override
  ScheduleDto get scheduleDto => (origin as SchedulesProvider).scheduleDto;
  @override
  CancelToken? get cancelToken => (origin as SchedulesProvider).cancelToken;
}

String _$deleteScheduleHash() => r'dd31b233e4ec69aece70f7921bafcac1c040977d';

/// See also [deleteSchedule].
@ProviderFor(deleteSchedule)
const deleteScheduleProvider = DeleteScheduleFamily();

/// See also [deleteSchedule].
class DeleteScheduleFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteSchedule].
  const DeleteScheduleFamily();

  /// See also [deleteSchedule].
  DeleteScheduleProvider call(
    ScheduleDto scheduleDto, {
    CancelToken? cancelToken,
  }) {
    return DeleteScheduleProvider(
      scheduleDto,
      cancelToken: cancelToken,
    );
  }

  @override
  DeleteScheduleProvider getProviderOverride(
    covariant DeleteScheduleProvider provider,
  ) {
    return call(
      provider.scheduleDto,
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
  String? get name => r'deleteScheduleProvider';
}

/// See also [deleteSchedule].
class DeleteScheduleProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteSchedule].
  DeleteScheduleProvider(
    ScheduleDto scheduleDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => deleteSchedule(
            ref as DeleteScheduleRef,
            scheduleDto,
            cancelToken: cancelToken,
          ),
          from: deleteScheduleProvider,
          name: r'deleteScheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteScheduleHash,
          dependencies: DeleteScheduleFamily._dependencies,
          allTransitiveDependencies:
              DeleteScheduleFamily._allTransitiveDependencies,
          scheduleDto: scheduleDto,
          cancelToken: cancelToken,
        );

  DeleteScheduleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scheduleDto,
    required this.cancelToken,
  }) : super.internal();

  final ScheduleDto scheduleDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteScheduleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteScheduleProvider._internal(
        (ref) => create(ref as DeleteScheduleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scheduleDto: scheduleDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteScheduleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteScheduleProvider &&
        other.scheduleDto == scheduleDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scheduleDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteScheduleRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `scheduleDto` of this provider.
  ScheduleDto get scheduleDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _DeleteScheduleProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteScheduleRef {
  _DeleteScheduleProviderElement(super.provider);

  @override
  ScheduleDto get scheduleDto => (origin as DeleteScheduleProvider).scheduleDto;
  @override
  CancelToken? get cancelToken =>
      (origin as DeleteScheduleProvider).cancelToken;
}

String _$updateScheduleHash() => r'f87473e6bec0012f18bad9dc64324f65eb2e514a';

/// See also [updateSchedule].
@ProviderFor(updateSchedule)
const updateScheduleProvider = UpdateScheduleFamily();

/// See also [updateSchedule].
class UpdateScheduleFamily extends Family<AsyncValue<bool>> {
  /// See also [updateSchedule].
  const UpdateScheduleFamily();

  /// See also [updateSchedule].
  UpdateScheduleProvider call(
    MobileDto mobileDto, {
    CancelToken? cancelToken,
  }) {
    return UpdateScheduleProvider(
      mobileDto,
      cancelToken: cancelToken,
    );
  }

  @override
  UpdateScheduleProvider getProviderOverride(
    covariant UpdateScheduleProvider provider,
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
  String? get name => r'updateScheduleProvider';
}

/// See also [updateSchedule].
class UpdateScheduleProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateSchedule].
  UpdateScheduleProvider(
    MobileDto mobileDto, {
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => updateSchedule(
            ref as UpdateScheduleRef,
            mobileDto,
            cancelToken: cancelToken,
          ),
          from: updateScheduleProvider,
          name: r'updateScheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateScheduleHash,
          dependencies: UpdateScheduleFamily._dependencies,
          allTransitiveDependencies:
              UpdateScheduleFamily._allTransitiveDependencies,
          mobileDto: mobileDto,
          cancelToken: cancelToken,
        );

  UpdateScheduleProvider._internal(
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
    FutureOr<bool> Function(UpdateScheduleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateScheduleProvider._internal(
        (ref) => create(ref as UpdateScheduleRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateScheduleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateScheduleProvider &&
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

mixin UpdateScheduleRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `mobileDto` of this provider.
  MobileDto get mobileDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _UpdateScheduleProviderElement
    extends AutoDisposeFutureProviderElement<bool> with UpdateScheduleRef {
  _UpdateScheduleProviderElement(super.provider);

  @override
  MobileDto get mobileDto => (origin as UpdateScheduleProvider).mobileDto;
  @override
  CancelToken? get cancelToken =>
      (origin as UpdateScheduleProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
