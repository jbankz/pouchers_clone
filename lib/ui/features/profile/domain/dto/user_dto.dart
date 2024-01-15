class UserDto {
  final String? bvn;
  final String? idType;
  final bool? isUploadId;
  final String? idNumber;
  final String? surname;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? resetCode;
  final String? dob;
  final String? fcmToken;
  final String? tag;
  final String? profilePicture;
  final List<String>? contacts;

  UserDto(
      {this.bvn,
      this.idType,
      this.isUploadId,
      this.idNumber,
      this.surname,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phoneNumber,
      this.resetCode,
      this.dob,
      this.fcmToken,
      this.tag,
      this.contacts,
      this.profilePicture});

  Map<String, dynamic> toJson() => {
        if (bvn != null) 'bvn': bvn,
        if (idType != null) 'id_type': idType,
        if (isUploadId != null) 'is_upload_id': isUploadId,
        if (idNumber != null) 'id_number': idNumber,
        if (surname != null) 'surname': surname,
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        if (gender != null) 'gender': gender,
        if (phoneNumber != null) 'phone_number': phoneNumber,
        if (email != null) 'email': email,
        if (resetCode != null) 'reset_code': resetCode,
        if (dob != null) 'dob': dob,
        if (fcmToken != null) 'fcm_token': fcmToken,
        if (tag != null) 'tag': tag,
        if (contacts != null) 'contacts': contacts,
        if (profilePicture != null) 'profile_picture': profilePicture,
      };
}
