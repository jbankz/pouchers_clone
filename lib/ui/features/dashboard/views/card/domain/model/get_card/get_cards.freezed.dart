// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_cards.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetCards _$GetCardsFromJson(Map<String, dynamic> json) {
  return _GetCards.fromJson(json);
}

/// @nodoc
mixin _$GetCards {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<Data>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCardsCopyWith<GetCards> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCardsCopyWith<$Res> {
  factory $GetCardsCopyWith(GetCards value, $Res Function(GetCards) then) =
      _$GetCardsCopyWithImpl<$Res, GetCards>;
  @useResult
  $Res call(
      {String? status,
      String? message,
      int? code,
      @JsonKey(defaultValue: []) List<Data>? data});
}

/// @nodoc
class _$GetCardsCopyWithImpl<$Res, $Val extends GetCards>
    implements $GetCardsCopyWith<$Res> {
  _$GetCardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCardsImplCopyWith<$Res>
    implements $GetCardsCopyWith<$Res> {
  factory _$$GetCardsImplCopyWith(
          _$GetCardsImpl value, $Res Function(_$GetCardsImpl) then) =
      __$$GetCardsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      String? message,
      int? code,
      @JsonKey(defaultValue: []) List<Data>? data});
}

/// @nodoc
class __$$GetCardsImplCopyWithImpl<$Res>
    extends _$GetCardsCopyWithImpl<$Res, _$GetCardsImpl>
    implements _$$GetCardsImplCopyWith<$Res> {
  __$$GetCardsImplCopyWithImpl(
      _$GetCardsImpl _value, $Res Function(_$GetCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetCardsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCardsImpl implements _GetCards {
  _$GetCardsImpl(
      {this.status,
      this.message,
      this.code,
      @JsonKey(defaultValue: []) final List<Data>? data})
      : _data = data;

  factory _$GetCardsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCardsImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final int? code;
  final List<Data>? _data;
  @override
  @JsonKey(defaultValue: [])
  List<Data>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetCards(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCardsImplCopyWith<_$GetCardsImpl> get copyWith =>
      __$$GetCardsImplCopyWithImpl<_$GetCardsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCardsImplToJson(
      this,
    );
  }
}

abstract class _GetCards implements GetCards {
  factory _GetCards(
      {final String? status,
      final String? message,
      final int? code,
      @JsonKey(defaultValue: []) final List<Data>? data}) = _$GetCardsImpl;

  factory _GetCards.fromJson(Map<String, dynamic> json) =
      _$GetCardsImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  @JsonKey(defaultValue: [])
  List<Data>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetCardsImplCopyWith<_$GetCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
