// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  List<ScheduleModel> get schedules => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleStateCopyWith<T, ScheduleState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<T, $Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState<T> value, $Res Function(ScheduleState<T>) then) =
      _$ScheduleStateCopyWithImpl<T, $Res, ScheduleState<T>>;
  @useResult
  $Res call({bool isBusy, List<ScheduleModel> schedules});
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<T, $Res, $Val extends ScheduleState<T>>
    implements $ScheduleStateCopyWith<T, $Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? schedules = null,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleStateImplCopyWith<T, $Res>
    implements $ScheduleStateCopyWith<T, $Res> {
  factory _$$ScheduleStateImplCopyWith(_$ScheduleStateImpl<T> value,
          $Res Function(_$ScheduleStateImpl<T>) then) =
      __$$ScheduleStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool isBusy, List<ScheduleModel> schedules});
}

/// @nodoc
class __$$ScheduleStateImplCopyWithImpl<T, $Res>
    extends _$ScheduleStateCopyWithImpl<T, $Res, _$ScheduleStateImpl<T>>
    implements _$$ScheduleStateImplCopyWith<T, $Res> {
  __$$ScheduleStateImplCopyWithImpl(_$ScheduleStateImpl<T> _value,
      $Res Function(_$ScheduleStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? schedules = null,
  }) {
    return _then(_$ScheduleStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
    ));
  }
}

/// @nodoc

class _$ScheduleStateImpl<T> implements _ScheduleState<T> {
  const _$ScheduleStateImpl(
      {this.isBusy = false, final List<ScheduleModel> schedules = const []})
      : _schedules = schedules;

  @override
  @JsonKey()
  final bool isBusy;
  final List<ScheduleModel> _schedules;
  @override
  @JsonKey()
  List<ScheduleModel> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  String toString() {
    return 'ScheduleState<$T>(isBusy: $isBusy, schedules: $schedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isBusy, const DeepCollectionEquality().hash(_schedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleStateImplCopyWith<T, _$ScheduleStateImpl<T>> get copyWith =>
      __$$ScheduleStateImplCopyWithImpl<T, _$ScheduleStateImpl<T>>(
          this, _$identity);
}

abstract class _ScheduleState<T> implements ScheduleState<T> {
  const factory _ScheduleState(
      {final bool isBusy,
      final List<ScheduleModel> schedules}) = _$ScheduleStateImpl<T>;

  @override
  bool get isBusy;
  @override
  List<ScheduleModel> get schedules;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleStateImplCopyWith<T, _$ScheduleStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
