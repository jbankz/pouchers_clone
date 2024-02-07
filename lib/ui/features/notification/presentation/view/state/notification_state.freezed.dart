// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  UnreadPaymentRequest? get unreadPaymentModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<T, NotificationState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<T, $Res> {
  factory $NotificationStateCopyWith(NotificationState<T> value,
          $Res Function(NotificationState<T>) then) =
      _$NotificationStateCopyWithImpl<T, $Res, NotificationState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      List<NotificationModel> notifications,
      String? errorMessage,
      StackTrace? stackTrace,
      UnreadPaymentRequest? unreadPaymentModel});

  $UnreadPaymentRequestCopyWith<$Res>? get unreadPaymentModel;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<T, $Res,
        $Val extends NotificationState<T>>
    implements $NotificationStateCopyWith<T, $Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? notifications = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? unreadPaymentModel = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      unreadPaymentModel: freezed == unreadPaymentModel
          ? _value.unreadPaymentModel
          : unreadPaymentModel // ignore: cast_nullable_to_non_nullable
              as UnreadPaymentRequest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnreadPaymentRequestCopyWith<$Res>? get unreadPaymentModel {
    if (_value.unreadPaymentModel == null) {
      return null;
    }

    return $UnreadPaymentRequestCopyWith<$Res>(_value.unreadPaymentModel!,
        (value) {
      return _then(_value.copyWith(unreadPaymentModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<T, $Res>
    implements $NotificationStateCopyWith<T, $Res> {
  factory _$$NotificationStateImplCopyWith(_$NotificationStateImpl<T> value,
          $Res Function(_$NotificationStateImpl<T>) then) =
      __$$NotificationStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      List<NotificationModel> notifications,
      String? errorMessage,
      StackTrace? stackTrace,
      UnreadPaymentRequest? unreadPaymentModel});

  @override
  $UnreadPaymentRequestCopyWith<$Res>? get unreadPaymentModel;
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<T, $Res>
    extends _$NotificationStateCopyWithImpl<T, $Res, _$NotificationStateImpl<T>>
    implements _$$NotificationStateImplCopyWith<T, $Res> {
  __$$NotificationStateImplCopyWithImpl(_$NotificationStateImpl<T> _value,
      $Res Function(_$NotificationStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? notifications = null,
    Object? errorMessage = freezed,
    Object? stackTrace = freezed,
    Object? unreadPaymentModel = freezed,
  }) {
    return _then(_$NotificationStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      unreadPaymentModel: freezed == unreadPaymentModel
          ? _value.unreadPaymentModel
          : unreadPaymentModel // ignore: cast_nullable_to_non_nullable
              as UnreadPaymentRequest?,
    ));
  }
}

/// @nodoc

class _$NotificationStateImpl<T> implements _NotificationState<T> {
  const _$NotificationStateImpl(
      {this.isBusy = false,
      final List<NotificationModel> notifications = const [],
      this.errorMessage,
      this.stackTrace,
      this.unreadPaymentModel})
      : _notifications = notifications;

  @override
  @JsonKey()
  final bool isBusy;
  final List<NotificationModel> _notifications;
  @override
  @JsonKey()
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final String? errorMessage;
  @override
  final StackTrace? stackTrace;
  @override
  final UnreadPaymentRequest? unreadPaymentModel;

  @override
  String toString() {
    return 'NotificationState<$T>(isBusy: $isBusy, notifications: $notifications, errorMessage: $errorMessage, stackTrace: $stackTrace, unreadPaymentModel: $unreadPaymentModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.unreadPaymentModel, unreadPaymentModel) ||
                other.unreadPaymentModel == unreadPaymentModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      const DeepCollectionEquality().hash(_notifications),
      errorMessage,
      stackTrace,
      unreadPaymentModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<T, _$NotificationStateImpl<T>>
      get copyWith =>
          __$$NotificationStateImplCopyWithImpl<T, _$NotificationStateImpl<T>>(
              this, _$identity);
}

abstract class _NotificationState<T> implements NotificationState<T> {
  const factory _NotificationState(
          {final bool isBusy,
          final List<NotificationModel> notifications,
          final String? errorMessage,
          final StackTrace? stackTrace,
          final UnreadPaymentRequest? unreadPaymentModel}) =
      _$NotificationStateImpl<T>;

  @override
  bool get isBusy;
  @override
  List<NotificationModel> get notifications;
  @override
  String? get errorMessage;
  @override
  StackTrace? get stackTrace;
  @override
  UnreadPaymentRequest? get unreadPaymentModel;
  @override
  @JsonKey(ignore: true)
  _$$NotificationStateImplCopyWith<T, _$NotificationStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
