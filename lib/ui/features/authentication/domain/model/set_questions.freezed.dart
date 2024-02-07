// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_questions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetQuestions _$SetQuestionsFromJson(Map<String, dynamic> json) {
  return _SetQuestions.fromJson(json);
}

/// @nodoc
mixin _$SetQuestions {
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String? get questionId => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetQuestionsCopyWith<SetQuestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetQuestionsCopyWith<$Res> {
  factory $SetQuestionsCopyWith(
          SetQuestions value, $Res Function(SetQuestions) then) =
      _$SetQuestionsCopyWithImpl<$Res, SetQuestions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'question_id') String? questionId,
      String? answer});
}

/// @nodoc
class _$SetQuestionsCopyWithImpl<$Res, $Val extends SetQuestions>
    implements $SetQuestionsCopyWith<$Res> {
  _$SetQuestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? questionId = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetQuestionsImplCopyWith<$Res>
    implements $SetQuestionsCopyWith<$Res> {
  factory _$$SetQuestionsImplCopyWith(
          _$SetQuestionsImpl value, $Res Function(_$SetQuestionsImpl) then) =
      __$$SetQuestionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'question_id') String? questionId,
      String? answer});
}

/// @nodoc
class __$$SetQuestionsImplCopyWithImpl<$Res>
    extends _$SetQuestionsCopyWithImpl<$Res, _$SetQuestionsImpl>
    implements _$$SetQuestionsImplCopyWith<$Res> {
  __$$SetQuestionsImplCopyWithImpl(
      _$SetQuestionsImpl _value, $Res Function(_$SetQuestionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? questionId = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$SetQuestionsImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetQuestionsImpl implements _SetQuestions {
  _$SetQuestionsImpl(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'question_id') this.questionId,
      this.answer});

  factory _$SetQuestionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetQuestionsImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'question_id')
  final String? questionId;
  @override
  final String? answer;

  @override
  String toString() {
    return 'SetQuestions(userId: $userId, questionId: $questionId, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetQuestionsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, questionId, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetQuestionsImplCopyWith<_$SetQuestionsImpl> get copyWith =>
      __$$SetQuestionsImplCopyWithImpl<_$SetQuestionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetQuestionsImplToJson(
      this,
    );
  }
}

abstract class _SetQuestions implements SetQuestions {
  factory _SetQuestions(
      {@JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'question_id') final String? questionId,
      final String? answer}) = _$SetQuestionsImpl;

  factory _SetQuestions.fromJson(Map<String, dynamic> json) =
      _$SetQuestionsImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'question_id')
  String? get questionId;
  @override
  String? get answer;
  @override
  @JsonKey(ignore: true)
  _$$SetQuestionsImplCopyWith<_$SetQuestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
