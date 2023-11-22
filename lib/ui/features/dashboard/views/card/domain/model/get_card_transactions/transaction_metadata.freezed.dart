// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionMetadata _$TransactionMetadataFromJson(Map<String, dynamic> json) {
  return _TransactionMetadata.fromJson(json);
}

/// @nodoc
mixin _$TransactionMetadata {
  String? get channel => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionMetadataCopyWith<TransactionMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionMetadataCopyWith<$Res> {
  factory $TransactionMetadataCopyWith(
          TransactionMetadata value, $Res Function(TransactionMetadata) then) =
      _$TransactionMetadataCopyWithImpl<$Res, TransactionMetadata>;
  @useResult
  $Res call(
      {String? channel,
      String? type,
      String? reference,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$TransactionMetadataCopyWithImpl<$Res, $Val extends TransactionMetadata>
    implements $TransactionMetadataCopyWith<$Res> {
  _$TransactionMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? type = freezed,
    Object? reference = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionMetadataImplCopyWith<$Res>
    implements $TransactionMetadataCopyWith<$Res> {
  factory _$$TransactionMetadataImplCopyWith(_$TransactionMetadataImpl value,
          $Res Function(_$TransactionMetadataImpl) then) =
      __$$TransactionMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? channel,
      String? type,
      String? reference,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$TransactionMetadataImplCopyWithImpl<$Res>
    extends _$TransactionMetadataCopyWithImpl<$Res, _$TransactionMetadataImpl>
    implements _$$TransactionMetadataImplCopyWith<$Res> {
  __$$TransactionMetadataImplCopyWithImpl(_$TransactionMetadataImpl _value,
      $Res Function(_$TransactionMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? type = freezed,
    Object? reference = freezed,
    Object? id = freezed,
  }) {
    return _then(_$TransactionMetadataImpl(
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionMetadataImpl implements _TransactionMetadata {
  _$TransactionMetadataImpl(
      {this.channel, this.type, this.reference, @JsonKey(name: '_id') this.id});

  factory _$TransactionMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionMetadataImplFromJson(json);

  @override
  final String? channel;
  @override
  final String? type;
  @override
  final String? reference;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'TransactionMetadata(channel: $channel, type: $type, reference: $reference, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionMetadataImpl &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channel, type, reference, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionMetadataImplCopyWith<_$TransactionMetadataImpl> get copyWith =>
      __$$TransactionMetadataImplCopyWithImpl<_$TransactionMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionMetadataImplToJson(
      this,
    );
  }
}

abstract class _TransactionMetadata implements TransactionMetadata {
  factory _TransactionMetadata(
      {final String? channel,
      final String? type,
      final String? reference,
      @JsonKey(name: '_id') final String? id}) = _$TransactionMetadataImpl;

  factory _TransactionMetadata.fromJson(Map<String, dynamic> json) =
      _$TransactionMetadataImpl.fromJson;

  @override
  String? get channel;
  @override
  String? get type;
  @override
  String? get reference;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$TransactionMetadataImplCopyWith<_$TransactionMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
