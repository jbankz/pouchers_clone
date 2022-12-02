
class ContactListResponse {
  ContactListResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  String? status;
  String? message;
  int? code;
  List<ContactListData>? data;

  factory ContactListResponse.fromJson(Map<String, dynamic> json) => ContactListResponse(
    status: json["status"],
    message: json["message"],
    code: json["code"],
    data: List<ContactListData>.from(json["data"].map((x) => ContactListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "code": code,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ContactListData {
  ContactListData({
    this.id,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.tag,
  });

  int? id;
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? tag;

  factory ContactListData.fromJson(Map<String, dynamic> json) => ContactListData(
    id: json["id"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    profilePicture: json["profile_picture"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone_number": phoneNumber,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "profile_picture": profilePicture,
    "tag": tag,
  };
}
