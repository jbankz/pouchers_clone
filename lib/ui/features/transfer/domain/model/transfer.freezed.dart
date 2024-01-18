// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transfer _$TransferFromJson(Map<String, dynamic> json) {
  return _Transfer.fromJson(json);
}

/// @nodoc
mixin _$Transfer {
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_name')
  String? get senderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_name')
  String? get receiverName => throw _privateConstructorUsedError;
  @TagSerializer()
  @JsonKey(name: 'receiver_tag')
  String? get receiverTag => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @StringToNumSerializer()
  num get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  String? get transactionDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferCopyWith<Transfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) then) =
      _$TransferCopyWithImpl<$Res, Transfer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'sender_name') String? senderName,
      @JsonKey(name: 'receiver_name') String? receiverName,
      @TagSerializer() @JsonKey(name: 'receiver_tag') String? receiverTag,
      String? note,
      @StringToNumSerializer() num amount,
      @JsonKey(name: 'transaction_date') String? transactionDate,
      String? status});
}

/// @nodoc
class _$TransferCopyWithImpl<$Res, $Val extends Transfer>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? senderName = freezed,
    Object? receiverName = freezed,
    Object? receiverTag = freezed,
    Object? note = freezed,
    Object? amount = null,
    Object? transactionDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: freezed == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverTag: freezed == receiverTag
          ? _value.receiverTag
          : receiverTag // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferImplCopyWith<$Res>
    implements $TransferCopyWith<$Res> {
  factory _$$TransferImplCopyWith(
          _$TransferImpl value, $Res Function(_$TransferImpl) then) =
      __$$TransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'sender_name') String? senderName,
      @JsonKey(name: 'receiver_name') String? receiverName,
      @TagSerializer() @JsonKey(name: 'receiver_tag') String? receiverTag,
      String? note,
      @StringToNumSerializer() num amount,
      @JsonKey(name: 'transaction_date') String? transactionDate,
      String? status});
}

/// @nodoc
class __$$TransferImplCopyWithImpl<$Res>
    extends _$TransferCopyWithImpl<$Res, _$TransferImpl>
    implements _$$TransferImplCopyWith<$Res> {
  __$$TransferImplCopyWithImpl(
      _$TransferImpl _value, $Res Function(_$TransferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? senderName = freezed,
    Object? receiverName = freezed,
    Object? receiverTag = freezed,
    Object? note = freezed,
    Object? amount = null,
    Object? transactionDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$TransferImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: freezed == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverTag: freezed == receiverTag
          ? _value.receiverTag
          : receiverTag // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferImpl implements _Transfer {
  _$TransferImpl(
      {@JsonKey(name: 'transaction_id') this.transactionId,
      @JsonKey(name: 'sender_name') this.senderName,
      @JsonKey(name: 'receiver_name') this.receiverName,
      @TagSerializer() @JsonKey(name: 'receiver_tag') this.receiverTag,
      this.note,
      @StringToNumSerializer() this.amount = 0,
      @JsonKey(name: 'transaction_date') this.transactionDate,
      this.status});

  factory _$TransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @override
  @JsonKey(name: 'sender_name')
  final String? senderName;
  @override
  @JsonKey(name: 'receiver_name')
  final String? receiverName;
  @override
  @TagSerializer()
  @JsonKey(name: 'receiver_tag')
  final String? receiverTag;
  @override
  final String? note;
  @override
  @JsonKey()
  @StringToNumSerializer()
  final num amount;
  @override
  @JsonKey(name: 'transaction_date')
  final String? transactionDate;
  @override
  final String? status;

  @override
  String toString() {
    return 'Transfer(transactionId: $transactionId, senderName: $senderName, receiverName: $receiverName, receiverTag: $receiverTag, note: $note, amount: $amount, transactionDate: $transactionDate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.receiverTag, receiverTag) ||
                other.receiverTag == receiverTag) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, senderName,
      receiverName, receiverTag, note, amount, transactionDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      __$$TransferImplCopyWithImpl<_$TransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferImplToJson(
      this,
    );
  }
}

abstract class _Transfer implements Transfer {
  factory _Transfer(
      {@JsonKey(name: 'transaction_id') final String? transactionId,
      @JsonKey(name: 'sender_name') final String? senderName,
      @JsonKey(name: 'receiver_name') final String? receiverName,
      @TagSerializer() @JsonKey(name: 'receiver_tag') final String? receiverTag,
      final String? note,
      @StringToNumSerializer() final num amount,
      @JsonKey(name: 'transaction_date') final String? transactionDate,
      final String? status}) = _$TransferImpl;

  factory _Transfer.fromJson(Map<String, dynamic> json) =
      _$TransferImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  @JsonKey(name: 'sender_name')
  String? get senderName;
  @override
  @JsonKey(name: 'receiver_name')
  String? get receiverName;
  @override
  @TagSerializer()
  @JsonKey(name: 'receiver_tag')
  String? get receiverTag;
  @override
  String? get note;
  @override
  @StringToNumSerializer()
  num get amount;
  @override
  @JsonKey(name: 'transaction_date')
  String? get transactionDate;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
