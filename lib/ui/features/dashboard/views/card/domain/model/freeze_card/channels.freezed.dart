// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channels.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Channels _$ChannelsFromJson(Map<String, dynamic> json) {
  return _Channels.fromJson(json);
}

/// @nodoc
mixin _$Channels {
  bool? get atm => throw _privateConstructorUsedError;
  bool? get pos => throw _privateConstructorUsedError;
  bool? get web => throw _privateConstructorUsedError;
  bool? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelsCopyWith<Channels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelsCopyWith<$Res> {
  factory $ChannelsCopyWith(Channels value, $Res Function(Channels) then) =
      _$ChannelsCopyWithImpl<$Res, Channels>;
  @useResult
  $Res call(
      {bool? atm,
      bool? pos,
      bool? web,
      bool? mobile,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$ChannelsCopyWithImpl<$Res, $Val extends Channels>
    implements $ChannelsCopyWith<$Res> {
  _$ChannelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atm = freezed,
    Object? pos = freezed,
    Object? web = freezed,
    Object? mobile = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      atm: freezed == atm
          ? _value.atm
          : atm // ignore: cast_nullable_to_non_nullable
              as bool?,
      pos: freezed == pos
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as bool?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelsImplCopyWith<$Res>
    implements $ChannelsCopyWith<$Res> {
  factory _$$ChannelsImplCopyWith(
          _$ChannelsImpl value, $Res Function(_$ChannelsImpl) then) =
      __$$ChannelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? atm,
      bool? pos,
      bool? web,
      bool? mobile,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$ChannelsImplCopyWithImpl<$Res>
    extends _$ChannelsCopyWithImpl<$Res, _$ChannelsImpl>
    implements _$$ChannelsImplCopyWith<$Res> {
  __$$ChannelsImplCopyWithImpl(
      _$ChannelsImpl _value, $Res Function(_$ChannelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atm = freezed,
    Object? pos = freezed,
    Object? web = freezed,
    Object? mobile = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ChannelsImpl(
      atm: freezed == atm
          ? _value.atm
          : atm // ignore: cast_nullable_to_non_nullable
              as bool?,
      pos: freezed == pos
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as bool?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelsImpl implements _Channels {
  _$ChannelsImpl(
      {this.atm,
      this.pos,
      this.web,
      this.mobile,
      @JsonKey(name: '_id') this.id});

  factory _$ChannelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelsImplFromJson(json);

  @override
  final bool? atm;
  @override
  final bool? pos;
  @override
  final bool? web;
  @override
  final bool? mobile;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'Channels(atm: $atm, pos: $pos, web: $web, mobile: $mobile, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelsImpl &&
            (identical(other.atm, atm) || other.atm == atm) &&
            (identical(other.pos, pos) || other.pos == pos) &&
            (identical(other.web, web) || other.web == web) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, atm, pos, web, mobile, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelsImplCopyWith<_$ChannelsImpl> get copyWith =>
      __$$ChannelsImplCopyWithImpl<_$ChannelsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelsImplToJson(
      this,
    );
  }
}

abstract class _Channels implements Channels {
  factory _Channels(
      {final bool? atm,
      final bool? pos,
      final bool? web,
      final bool? mobile,
      @JsonKey(name: '_id') final String? id}) = _$ChannelsImpl;

  factory _Channels.fromJson(Map<String, dynamic> json) =
      _$ChannelsImpl.fromJson;

  @override
  bool? get atm;
  @override
  bool? get pos;
  @override
  bool? get web;
  @override
  bool? get mobile;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$ChannelsImplCopyWith<_$ChannelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
