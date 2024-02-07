import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: '_id') String? id,
    String? client,
    String? account,
    String? type,
    String? sessionId,
    String? nameEnquiryReference,
    String? paymentReference,
    dynamic mandateReference,
    bool? isReversed,
    dynamic reversalReference,
    String? provider,
    String? providerChannel,
    String? providerChannelCode,
    String? destinationInstitutionCode,
    String? creditAccountName,
    String? creditAccountNumber,
    dynamic creditBankVerificationNumber,
    @JsonKey(name: 'creditKYCLevel') String? creditKycLevel,
    String? debitAccountName,
    String? debitAccountNumber,
    dynamic debitBankVerificationNumber,
    @JsonKey(name: 'debitKYCLevel') String? debitKycLevel,
    String? transactionLocation,
    String? narration,
    int? amount,
    int? fees,
    int? vat,
    int? stampDuty,
    String? responseCode,
    String? responseMessage,
    String? status,
    bool? isDeleted,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
    DateTime? approvedAt,
    String? approvedBy,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
