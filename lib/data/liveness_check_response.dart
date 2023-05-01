
class LivenessCheckResponse {

  LivenessCheckResponse({
    this.status,
    this.selfieUrl,
    this.verificationId,
    this.verificationUrl,
  });

  final bool? status;
  final String? selfieUrl;
  final int? verificationId;
  final String? verificationUrl;



  factory LivenessCheckResponse.fromJson(Map<String, dynamic> json) => LivenessCheckResponse(
    status: json["status"],
    selfieUrl: json["selfieUrl"],
    verificationId: json["verificationId"],
    verificationUrl: json["verificationUrl"]
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "selfieUrl": selfieUrl,
    "verificationId": verificationId,
    "verificationUrl": verificationUrl,
  };


  @override
  List<Object?> get props => [status, selfieUrl, verificationId, verificationUrl];

}

class IdCheckResponse {
  final String? documentType;
  final String? documentNumber;
  final String? dateIssued;
  final String? expiryDate;

  factory IdCheckResponse.fromJson(Map<String, dynamic> json) => IdCheckResponse(
      documentType: json["document_type"],
      documentNumber: json["document_number"],
      dateIssued: json["date_issued"],
      expiryDate: json["expiry_date"]
  );

  Map<String, dynamic> toJson() => {
    "document_type": documentType,
    "document_number": documentNumber,
    "date_issued": dateIssued,
    "expiry_date": expiryDate,
  };

  const IdCheckResponse({this.documentType, this.documentNumber, this.dateIssued, this.expiryDate});

}