import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_questions.freezed.dart';
part 'selected_questions.g.dart';

@freezed
class SelectedQuestions with _$SelectedQuestions {
  factory SelectedQuestions(
      {@JsonKey(name: 'user_id') String? userId,
      String? question,
      @JsonKey(name: 'question_id') String? questionId}) = _SelectedQuestions;

  factory SelectedQuestions.fromJson(Map<String, dynamic> json) =>
      _$SelectedQuestionsFromJson(json);
}
