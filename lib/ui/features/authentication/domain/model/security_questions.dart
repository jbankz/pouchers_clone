import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_questions.freezed.dart';
part 'security_questions.g.dart';

@freezed
class SecurityQuestions with _$SecurityQuestions {
  factory SecurityQuestions({String? id, String? question}) =
      _SecurityQuestions;

  factory SecurityQuestions.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionsFromJson(json);
}
