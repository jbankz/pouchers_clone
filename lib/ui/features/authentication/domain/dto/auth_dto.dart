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
  final String? oldPin;
  final String? transactionPin;
  final bool userJustWantsToChangeTherePassword;

  AuthDto({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.referralCode,
    this.otp,
    this.tag,
    this.pin,
    this.oldPin,
    this.resetCode,
    this.transactionPin,
    this.userJustWantsToChangeTherePassword = false,
  });

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
        if (oldPin != null) 'oldPin': oldPin,
        if (resetCode != null) 'reset_code': resetCode,
        if (transactionPin != null) 'transactionPin': transactionPin,
      };
}
