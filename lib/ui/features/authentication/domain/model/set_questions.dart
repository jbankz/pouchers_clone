import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_questions.freezed.dart';
part 'set_questions.g.dart';

@freezed
class SetQuestions with _$SetQuestions {
  factory SetQuestions(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'question_id') String? questionId,
      String? answer}) = _SetQuestions;

  factory SetQuestions.fromJson(Map<String, dynamic> json) =>
      _$SetQuestionsFromJson(json);
}
