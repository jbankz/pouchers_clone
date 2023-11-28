class UserDto {
  final String? bvn;
  final String? idType;
  final bool? isUploadId;
  final String? idNumber;
  final String? surname;
  final String? firstName;
  final String? lastName;

  UserDto(
      {this.bvn,
      this.idType,
      this.isUploadId,
      this.idNumber,
      this.surname,
      this.firstName,
      this.lastName});

  Map<String, dynamic> toJson() => {
        if (bvn != null) 'bvn': bvn,
        if (idType != null) 'id_type': idType,
        if (isUploadId != null) 'is_upload_id': isUploadId,
        if (idNumber != null) 'id_number': idNumber,
        if (surname != null) 'surname': surname,
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName
      };
}
