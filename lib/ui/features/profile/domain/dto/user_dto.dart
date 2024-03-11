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
  final String? address;
  final String? state;
  final String? postalCode;
  final String? utilityBill;
  final Dojah? dojah;

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
      this.profilePicture,
      this.address,
      this.state,
      this.postalCode,
      this.dojah,
      this.utilityBill});

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
        if (address != null) 'address': address,
        if (state != null) 'state': state,
        if (postalCode != null) 'postal_code': postalCode,
        if (dojah != null) 'dojah_response': dojah?.toJson(),
        if (utilityBill != null) 'utility_bill': utilityBill
      };
}

class Dojah {
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;

  Dojah({this.firstName, this.lastName, this.dateOfBirth});

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'date_of_birth': dateOfBirth
      };

  factory Dojah.fromJson(Map<String, dynamic> json) => Dojah(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '');
}
