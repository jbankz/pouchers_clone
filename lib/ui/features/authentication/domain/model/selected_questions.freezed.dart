// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_questions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectedQuestions _$SelectedQuestionsFromJson(Map<String, dynamic> json) {
  return _SelectedQuestions.fromJson(json);
}

/// @nodoc
mixin _$SelectedQuestions {
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String? get questionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedQuestionsCopyWith<SelectedQuestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedQuestionsCopyWith<$Res> {
  factory $SelectedQuestionsCopyWith(
          SelectedQuestions value, $Res Function(SelectedQuestions) then) =
      _$SelectedQuestionsCopyWithImpl<$Res, SelectedQuestions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      String? question,
      @JsonKey(name: 'question_id') String? questionId});
}

/// @nodoc
class _$SelectedQuestionsCopyWithImpl<$Res, $Val extends SelectedQuestions>
    implements $SelectedQuestionsCopyWith<$Res> {
  _$SelectedQuestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? question = freezed,
    Object? questionId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedQuestionsImplCopyWith<$Res>
    implements $SelectedQuestionsCopyWith<$Res> {
  factory _$$SelectedQuestionsImplCopyWith(_$SelectedQuestionsImpl value,
          $Res Function(_$SelectedQuestionsImpl) then) =
      __$$SelectedQuestionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      String? question,
      @JsonKey(name: 'question_id') String? questionId});
}

/// @nodoc
class __$$SelectedQuestionsImplCopyWithImpl<$Res>
    extends _$SelectedQuestionsCopyWithImpl<$Res, _$SelectedQuestionsImpl>
    implements _$$SelectedQuestionsImplCopyWith<$Res> {
  __$$SelectedQuestionsImplCopyWithImpl(_$SelectedQuestionsImpl _value,
      $Res Function(_$SelectedQuestionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? question = freezed,
    Object? questionId = freezed,
  }) {
    return _then(_$SelectedQuestionsImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedQuestionsImpl implements _SelectedQuestions {
  _$SelectedQuestionsImpl(
      {@JsonKey(name: 'user_id') this.userId,
      this.question,
      @JsonKey(name: 'question_id') this.questionId});

  factory _$SelectedQuestionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedQuestionsImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? question;
  @override
  @JsonKey(name: 'question_id')
  final String? questionId;

  @override
  String toString() {
    return 'SelectedQuestions(userId: $userId, question: $question, questionId: $questionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedQuestionsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, question, questionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedQuestionsImplCopyWith<_$SelectedQuestionsImpl> get copyWith =>
      __$$SelectedQuestionsImplCopyWithImpl<_$SelectedQuestionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedQuestionsImplToJson(
      this,
    );
  }
}

abstract class _SelectedQuestions implements SelectedQuestions {
  factory _SelectedQuestions(
          {@JsonKey(name: 'user_id') final String? userId,
          final String? question,
          @JsonKey(name: 'question_id') final String? questionId}) =
      _$SelectedQuestionsImpl;

  factory _SelectedQuestions.fromJson(Map<String, dynamic> json) =
      _$SelectedQuestionsImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get question;
  @override
  @JsonKey(name: 'question_id')
  String? get questionId;
  @override
  @JsonKey(ignore: true)
  _$$SelectedQuestionsImplCopyWith<_$SelectedQuestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
