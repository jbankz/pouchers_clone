import 'dart:io';

class UploadDto {
  final File? file;
  final String? profilePicture;
  final String? utilityBill;

  UploadDto({this.file, this.profilePicture, this.utilityBill});

  Map<String, dynamic> toJson() => {
        if (profilePicture != null) 'profile_picture': profilePicture,
        if (utilityBill != null) 'utility_bill': utilityBill
      };
}
