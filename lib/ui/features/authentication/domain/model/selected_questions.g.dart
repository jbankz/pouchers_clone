// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectedQuestionsImpl _$$SelectedQuestionsImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedQuestionsImpl(
      userId: json['user_id'] as String?,
      question: json['question'] as String?,
      questionId: json['question_id'] as String?,
    );

Map<String, dynamic> _$$SelectedQuestionsImplToJson(
        _$SelectedQuestionsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'question': instance.question,
      'question_id': instance.questionId,
    };
