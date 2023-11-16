class AuthDto {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? referralCode;
  final String? otp;
  final String? tag;
  final String? pin;
  final String? resetCode;

  AuthDto(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password,
      this.referralCode,
      this.otp,
      this.tag,
      this.pin,
      this.resetCode});

  Map<String, dynamic> toJson() => {
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        if (email != null) 'email': email,
        if (phoneNumber != null) 'phone_number': phoneNumber,
        if (password != null) 'password': password,
        if (referralCode != null) 'referral_code': referralCode,
        if (otp != null) 'otp': otp,
        if (tag != null) 'tag': tag,
        if (pin != null) 'pin': pin,
        if (resetCode != null) 'reset_code': resetCode,
      };
}
