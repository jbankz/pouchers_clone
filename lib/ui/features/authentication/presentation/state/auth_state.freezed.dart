// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<SecurityQuestions> get securityQuestion =>
      throw _privateConstructorUsedError;
  List<SelectedQuestions> get selectedQuestions =>
      throw _privateConstructorUsedError;
  Generate2faToken? get generate2faToken => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<T, AuthState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<T, $Res> {
  factory $AuthStateCopyWith(
          AuthState<T> value, $Res Function(AuthState<T>) then) =
      _$AuthStateCopyWithImpl<T, $Res, AuthState<T>>;
  @useResult
  $Res call(
      {bool isBusy,
      T? data,
      String? errorMessage,
      List<SecurityQuestions> securityQuestion,
      List<SelectedQuestions> selectedQuestions,
      Generate2faToken? generate2faToken,
      StackTrace? stackTrace});

  $Generate2faTokenCopyWith<$Res>? get generate2faToken;
}

/// @nodoc
class _$AuthStateCopyWithImpl<T, $Res, $Val extends AuthState<T>>
    implements $AuthStateCopyWith<T, $Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? securityQuestion = null,
    Object? selectedQuestions = null,
    Object? generate2faToken = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      securityQuestion: null == securityQuestion
          ? _value.securityQuestion
          : securityQuestion // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestions>,
      selectedQuestions: null == selectedQuestions
          ? _value.selectedQuestions
          : selectedQuestions // ignore: cast_nullable_to_non_nullable
              as List<SelectedQuestions>,
      generate2faToken: freezed == generate2faToken
          ? _value.generate2faToken
          : generate2faToken // ignore: cast_nullable_to_non_nullable
              as Generate2faToken?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $Generate2faTokenCopyWith<$Res>? get generate2faToken {
    if (_value.generate2faToken == null) {
      return null;
    }

    return $Generate2faTokenCopyWith<$Res>(_value.generate2faToken!, (value) {
      return _then(_value.copyWith(generate2faToken: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<T, $Res>
    implements $AuthStateCopyWith<T, $Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl<T> value, $Res Function(_$AuthStateImpl<T>) then) =
      __$$AuthStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      T? data,
      String? errorMessage,
      List<SecurityQuestions> securityQuestion,
      List<SelectedQuestions> selectedQuestions,
      Generate2faToken? generate2faToken,
      StackTrace? stackTrace});

  @override
  $Generate2faTokenCopyWith<$Res>? get generate2faToken;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthStateImpl<T>>
    implements _$$AuthStateImplCopyWith<T, $Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl<T> _value, $Res Function(_$AuthStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? securityQuestion = null,
    Object? selectedQuestions = null,
    Object? generate2faToken = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$AuthStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      securityQuestion: null == securityQuestion
          ? _value._securityQuestion
          : securityQuestion // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestions>,
      selectedQuestions: null == selectedQuestions
          ? _value._selectedQuestions
          : selectedQuestions // ignore: cast_nullable_to_non_nullable
              as List<SelectedQuestions>,
      generate2faToken: freezed == generate2faToken
          ? _value.generate2faToken
          : generate2faToken // ignore: cast_nullable_to_non_nullable
              as Generate2faToken?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl<T> implements _AuthState<T> {
  const _$AuthStateImpl(
      {this.isBusy = false,
      this.data,
      this.errorMessage,
      final List<SecurityQuestions> securityQuestion = const [],
      final List<SelectedQuestions> selectedQuestions = const [],
      this.generate2faToken = null,
      this.stackTrace})
      : _securityQuestion = securityQuestion,
        _selectedQuestions = selectedQuestions;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  final T? data;
  @override
  final String? errorMessage;
  final List<SecurityQuestions> _securityQuestion;
  @override
  @JsonKey()
  List<SecurityQuestions> get securityQuestion {
    if (_securityQuestion is EqualUnmodifiableListView)
      return _securityQuestion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_securityQuestion);
  }

  final List<SelectedQuestions> _selectedQuestions;
  @override
  @JsonKey()
  List<SelectedQuestions> get selectedQuestions {
    if (_selectedQuestions is EqualUnmodifiableListView)
      return _selectedQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedQuestions);
  }

  @override
  @JsonKey()
  final Generate2faToken? generate2faToken;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AuthState<$T>(isBusy: $isBusy, data: $data, errorMessage: $errorMessage, securityQuestion: $securityQuestion, selectedQuestions: $selectedQuestions, generate2faToken: $generate2faToken, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._securityQuestion, _securityQuestion) &&
            const DeepCollectionEquality()
                .equals(other._selectedQuestions, _selectedQuestions) &&
            (identical(other.generate2faToken, generate2faToken) ||
                other.generate2faToken == generate2faToken) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBusy,
      const DeepCollectionEquality().hash(data),
      errorMessage,
      const DeepCollectionEquality().hash(_securityQuestion),
      const DeepCollectionEquality().hash(_selectedQuestions),
      generate2faToken,
      stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<T, _$AuthStateImpl<T>> get copyWith =>
      __$$AuthStateImplCopyWithImpl<T, _$AuthStateImpl<T>>(this, _$identity);
}

abstract class _AuthState<T> implements AuthState<T> {
  const factory _AuthState(
      {final bool isBusy,
      final T? data,
      final String? errorMessage,
      final List<SecurityQuestions> securityQuestion,
      final List<SelectedQuestions> selectedQuestions,
      final Generate2faToken? generate2faToken,
      final StackTrace? stackTrace}) = _$AuthStateImpl<T>;

  @override
  bool get isBusy;
  @override
  T? get data;
  @override
  String? get errorMessage;
  @override
  List<SecurityQuestions> get securityQuestion;
  @override
  List<SelectedQuestions> get selectedQuestions;
  @override
  Generate2faToken? get generate2faToken;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<T, _$AuthStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
