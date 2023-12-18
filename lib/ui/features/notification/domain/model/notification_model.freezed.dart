// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  @HiveField(0)
  num? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'notification_id')
  String? get notificationId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @HiveField(4)
  @DateTimeSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'is_read', defaultValue: false)
  bool get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {@HiveField(0) num? id,
      @HiveField(1) @JsonKey(name: 'notification_id') String? notificationId,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @JsonKey(name: 'created_at')
      @HiveField(4)
      @DateTimeSerializer()
      DateTime? createdAt,
      @HiveField(5)
      @JsonKey(name: 'is_read', defaultValue: false)
      bool isRead});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? notificationId = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? createdAt = freezed,
    Object? isRead = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) num? id,
      @HiveField(1) @JsonKey(name: 'notification_id') String? notificationId,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @JsonKey(name: 'created_at')
      @HiveField(4)
      @DateTimeSerializer()
      DateTime? createdAt,
      @HiveField(5)
      @JsonKey(name: 'is_read', defaultValue: false)
      bool isRead});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? notificationId = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? createdAt = freezed,
    Object? isRead = null,
  }) {
    return _then(_$NotificationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 8, adapterName: 'NotificationModelAdapter')
class _$NotificationModelImpl implements _NotificationModel {
  _$NotificationModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) @JsonKey(name: 'notification_id') this.notificationId,
      @HiveField(2) this.title,
      @HiveField(3) this.body,
      @JsonKey(name: 'created_at')
      @HiveField(4)
      @DateTimeSerializer()
      this.createdAt,
      @HiveField(5)
      @JsonKey(name: 'is_read', defaultValue: false)
      this.isRead = false});

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @HiveField(0)
  final num? id;
  @override
  @HiveField(1)
  @JsonKey(name: 'notification_id')
  final String? notificationId;
  @override
  @HiveField(2)
  final String? title;
  @override
  @HiveField(3)
  final String? body;
  @override
  @JsonKey(name: 'created_at')
  @HiveField(4)
  @DateTimeSerializer()
  final DateTime? createdAt;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_read', defaultValue: false)
  final bool isRead;

  @override
  String toString() {
    return 'NotificationModel(id: $id, notificationId: $notificationId, title: $title, body: $body, createdAt: $createdAt, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, notificationId, title, body, createdAt, isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  factory _NotificationModel(
      {@HiveField(0) final num? id,
      @HiveField(1)
      @JsonKey(name: 'notification_id')
      final String? notificationId,
      @HiveField(2) final String? title,
      @HiveField(3) final String? body,
      @JsonKey(name: 'created_at')
      @HiveField(4)
      @DateTimeSerializer()
      final DateTime? createdAt,
      @HiveField(5)
      @JsonKey(name: 'is_read', defaultValue: false)
      final bool isRead}) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  @HiveField(0)
  num? get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'notification_id')
  String? get notificationId;
  @override
  @HiveField(2)
  String? get title;
  @override
  @HiveField(3)
  String? get body;
  @override
  @JsonKey(name: 'created_at')
  @HiveField(4)
  @DateTimeSerializer()
  DateTime? get createdAt;
  @override
  @HiveField(5)
  @JsonKey(name: 'is_read', defaultValue: false)
  bool get isRead;
  @override
  @JsonKey(ignore: true)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
