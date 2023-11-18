class SecurityQuestionResponse {
  SecurityQuestionResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<SecurityQuestionData>? data;

  factory SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =>
      SecurityQuestionResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<SecurityQuestionData>.from(
            json["data"].map((x) => SecurityQuestionData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SecurityQuestionData {
  SecurityQuestionData({
    this.id,
    this.question,
  });

  String? id;
  String? question;

  factory SecurityQuestionData.fromJson(Map<String, dynamic> json) =>
      SecurityQuestionData(
        id: json["id"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
      };
}

class SetSecurityQuestionData {
  SetSecurityQuestionData({
    this.id,
    this.answer,
  });

  String? id;
  String? answer;

  factory SetSecurityQuestionData.fromJson(Map<String, dynamic> json) =>
      SetSecurityQuestionData(
        id: json["question_id"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
      };
}

class SelectedQuestionResponse {
  SelectedQuestionResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<SelectedQuestionResponseData>? data;

  factory SelectedQuestionResponse.fromJson(Map<String, dynamic> json) =>
      SelectedQuestionResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<SelectedQuestionResponseData>.from(
            json["data"].map((x) => SelectedQuestionResponseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SelectedQuestionResponseData {
  SelectedQuestionResponseData({
    this.userId,
    this.questionId,
    this.question,
  });

  String? userId;
  String? questionId;
  String? question;

  factory SelectedQuestionResponseData.fromJson(Map<String, dynamic> json) =>
      SelectedQuestionResponseData(
        userId: json["user_id"],
        questionId: json["question_id"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "question_id": questionId,
        "question": question,
      };
}
