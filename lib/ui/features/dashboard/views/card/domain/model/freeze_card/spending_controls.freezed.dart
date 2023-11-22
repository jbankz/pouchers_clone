// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_controls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpendingControls _$SpendingControlsFromJson(Map<String, dynamic> json) {
  return _SpendingControls.fromJson(json);
}

/// @nodoc
mixin _$SpendingControls {
  Channels? get channels => throw _privateConstructorUsedError;
  List<dynamic>? get allowedCategories => throw _privateConstructorUsedError;
  List<dynamic>? get blockedCategories => throw _privateConstructorUsedError;
  List<dynamic>? get spendingLimits => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingControlsCopyWith<SpendingControls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingControlsCopyWith<$Res> {
  factory $SpendingControlsCopyWith(
          SpendingControls value, $Res Function(SpendingControls) then) =
      _$SpendingControlsCopyWithImpl<$Res, SpendingControls>;
  @useResult
  $Res call(
      {Channels? channels,
      List<dynamic>? allowedCategories,
      List<dynamic>? blockedCategories,
      List<dynamic>? spendingLimits,
      @JsonKey(name: '_id') String? id});

  $ChannelsCopyWith<$Res>? get channels;
}

/// @nodoc
class _$SpendingControlsCopyWithImpl<$Res, $Val extends SpendingControls>
    implements $SpendingControlsCopyWith<$Res> {
  _$SpendingControlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = freezed,
    Object? allowedCategories = freezed,
    Object? blockedCategories = freezed,
    Object? spendingLimits = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      channels: freezed == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as Channels?,
      allowedCategories: freezed == allowedCategories
          ? _value.allowedCategories
          : allowedCategories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      blockedCategories: freezed == blockedCategories
          ? _value.blockedCategories
          : blockedCategories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      spendingLimits: freezed == spendingLimits
          ? _value.spendingLimits
          : spendingLimits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChannelsCopyWith<$Res>? get channels {
    if (_value.channels == null) {
      return null;
    }

    return $ChannelsCopyWith<$Res>(_value.channels!, (value) {
      return _then(_value.copyWith(channels: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpendingControlsImplCopyWith<$Res>
    implements $SpendingControlsCopyWith<$Res> {
  factory _$$SpendingControlsImplCopyWith(_$SpendingControlsImpl value,
          $Res Function(_$SpendingControlsImpl) then) =
      __$$SpendingControlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Channels? channels,
      List<dynamic>? allowedCategories,
      List<dynamic>? blockedCategories,
      List<dynamic>? spendingLimits,
      @JsonKey(name: '_id') String? id});

  @override
  $ChannelsCopyWith<$Res>? get channels;
}

/// @nodoc
class __$$SpendingControlsImplCopyWithImpl<$Res>
    extends _$SpendingControlsCopyWithImpl<$Res, _$SpendingControlsImpl>
    implements _$$SpendingControlsImplCopyWith<$Res> {
  __$$SpendingControlsImplCopyWithImpl(_$SpendingControlsImpl _value,
      $Res Function(_$SpendingControlsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = freezed,
    Object? allowedCategories = freezed,
    Object? blockedCategories = freezed,
    Object? spendingLimits = freezed,
    Object? id = freezed,
  }) {
    return _then(_$SpendingControlsImpl(
      channels: freezed == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as Channels?,
      allowedCategories: freezed == allowedCategories
          ? _value._allowedCategories
          : allowedCategories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      blockedCategories: freezed == blockedCategories
          ? _value._blockedCategories
          : blockedCategories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      spendingLimits: freezed == spendingLimits
          ? _value._spendingLimits
          : spendingLimits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingControlsImpl implements _SpendingControls {
  _$SpendingControlsImpl(
      {this.channels,
      final List<dynamic>? allowedCategories,
      final List<dynamic>? blockedCategories,
      final List<dynamic>? spendingLimits,
      @JsonKey(name: '_id') this.id})
      : _allowedCategories = allowedCategories,
        _blockedCategories = blockedCategories,
        _spendingLimits = spendingLimits;

  factory _$SpendingControlsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingControlsImplFromJson(json);

  @override
  final Channels? channels;
  final List<dynamic>? _allowedCategories;
  @override
  List<dynamic>? get allowedCategories {
    final value = _allowedCategories;
    if (value == null) return null;
    if (_allowedCategories is EqualUnmodifiableListView)
      return _allowedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _blockedCategories;
  @override
  List<dynamic>? get blockedCategories {
    final value = _blockedCategories;
    if (value == null) return null;
    if (_blockedCategories is EqualUnmodifiableListView)
      return _blockedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _spendingLimits;
  @override
  List<dynamic>? get spendingLimits {
    final value = _spendingLimits;
    if (value == null) return null;
    if (_spendingLimits is EqualUnmodifiableListView) return _spendingLimits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'SpendingControls(channels: $channels, allowedCategories: $allowedCategories, blockedCategories: $blockedCategories, spendingLimits: $spendingLimits, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingControlsImpl &&
            (identical(other.channels, channels) ||
                other.channels == channels) &&
            const DeepCollectionEquality()
                .equals(other._allowedCategories, _allowedCategories) &&
            const DeepCollectionEquality()
                .equals(other._blockedCategories, _blockedCategories) &&
            const DeepCollectionEquality()
                .equals(other._spendingLimits, _spendingLimits) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      channels,
      const DeepCollectionEquality().hash(_allowedCategories),
      const DeepCollectionEquality().hash(_blockedCategories),
      const DeepCollectionEquality().hash(_spendingLimits),
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingControlsImplCopyWith<_$SpendingControlsImpl> get copyWith =>
      __$$SpendingControlsImplCopyWithImpl<_$SpendingControlsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingControlsImplToJson(
      this,
    );
  }
}

abstract class _SpendingControls implements SpendingControls {
  factory _SpendingControls(
      {final Channels? channels,
      final List<dynamic>? allowedCategories,
      final List<dynamic>? blockedCategories,
      final List<dynamic>? spendingLimits,
      @JsonKey(name: '_id') final String? id}) = _$SpendingControlsImpl;

  factory _SpendingControls.fromJson(Map<String, dynamic> json) =
      _$SpendingControlsImpl.fromJson;

  @override
  Channels? get channels;
  @override
  List<dynamic>? get allowedCategories;
  @override
  List<dynamic>? get blockedCategories;
  @override
  List<dynamic>? get spendingLimits;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$SpendingControlsImplCopyWith<_$SpendingControlsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
