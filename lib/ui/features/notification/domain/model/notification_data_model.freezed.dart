// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationDataModel _$NotificationDataModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationDataModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationDataModel {
  num get total => throw _privateConstructorUsedError;
  String get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifications')
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataModelCopyWith<NotificationDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataModelCopyWith<$Res> {
  factory $NotificationDataModelCopyWith(NotificationDataModel value,
          $Res Function(NotificationDataModel) then) =
      _$NotificationDataModelCopyWithImpl<$Res, NotificationDataModel>;
  @useResult
  $Res call(
      {num total,
      String page,
      @JsonKey(name: 'notifications') List<NotificationModel> notifications});
}

/// @nodoc
class _$NotificationDataModelCopyWithImpl<$Res,
        $Val extends NotificationDataModel>
    implements $NotificationDataModelCopyWith<$Res> {
  _$NotificationDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationDataModelImplCopyWith<$Res>
    implements $NotificationDataModelCopyWith<$Res> {
  factory _$$NotificationDataModelImplCopyWith(
          _$NotificationDataModelImpl value,
          $Res Function(_$NotificationDataModelImpl) then) =
      __$$NotificationDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num total,
      String page,
      @JsonKey(name: 'notifications') List<NotificationModel> notifications});
}

/// @nodoc
class __$$NotificationDataModelImplCopyWithImpl<$Res>
    extends _$NotificationDataModelCopyWithImpl<$Res,
        _$NotificationDataModelImpl>
    implements _$$NotificationDataModelImplCopyWith<$Res> {
  __$$NotificationDataModelImplCopyWithImpl(_$NotificationDataModelImpl _value,
      $Res Function(_$NotificationDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? notifications = null,
  }) {
    return _then(_$NotificationDataModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataModelImpl implements _NotificationDataModel {
  _$NotificationDataModelImpl(
      {this.total = 2,
      this.page = '1',
      @JsonKey(name: 'notifications')
      final List<NotificationModel> notifications = const []})
      : _notifications = notifications;

  factory _$NotificationDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataModelImplFromJson(json);

  @override
  @JsonKey()
  final num total;
  @override
  @JsonKey()
  final String page;
  final List<NotificationModel> _notifications;
  @override
  @JsonKey(name: 'notifications')
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationDataModel(total: $total, page: $page, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page,
      const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataModelImplCopyWith<_$NotificationDataModelImpl>
      get copyWith => __$$NotificationDataModelImplCopyWithImpl<
          _$NotificationDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationDataModel implements NotificationDataModel {
  factory _NotificationDataModel(
          {final num total,
          final String page,
          @JsonKey(name: 'notifications')
          final List<NotificationModel> notifications}) =
      _$NotificationDataModelImpl;

  factory _NotificationDataModel.fromJson(Map<String, dynamic> json) =
      _$NotificationDataModelImpl.fromJson;

  @override
  num get total;
  @override
  String get page;
  @override
  @JsonKey(name: 'notifications')
  List<NotificationModel> get notifications;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDataModelImplCopyWith<_$NotificationDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
