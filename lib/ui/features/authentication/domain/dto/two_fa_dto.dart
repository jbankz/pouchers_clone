class TwoFaDto {
  final String? questionId;
  final String? answer;
  final String? user2faToken;

  TwoFaDto({this.questionId, this.answer, this.user2faToken});

  Map<String, dynamic> toJson() => {
        if (questionId != null) 'question_id': questionId,
        if (answer != null) 'answer': answer,
        if (user2faToken != null) 'user2faToken': user2faToken
      };
}
