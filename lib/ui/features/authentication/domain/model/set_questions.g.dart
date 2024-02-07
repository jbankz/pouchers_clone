// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetQuestionsImpl _$$SetQuestionsImplFromJson(Map<String, dynamic> json) =>
    _$SetQuestionsImpl(
      userId: json['user_id'] as String?,
      questionId: json['question_id'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$$SetQuestionsImplToJson(_$SetQuestionsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'question_id': instance.questionId,
      'answer': instance.answer,
    };
