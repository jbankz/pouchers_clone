import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_local_bank.freezed.dart';
part 'guest_local_bank.g.dart';

@freezed
class GuestLocalBank with _$GuestLocalBank {
  factory GuestLocalBank({
    String? name,
    String? uuid,
    @StringToNumSerializer() @Default(0) num interInstitutionCode,
    @StringToNumSerializer() @Default(0) num sortCode,
    @StringToNumSerializer() @Default(0) num ussdCode,
  }) = _GuestLocalBank;

  factory GuestLocalBank.fromJson(Map<String, dynamic> json) =>
      _$GuestLocalBankFromJson(json);
}
