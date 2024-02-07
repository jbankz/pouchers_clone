// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['_id'] as String?,
      client: json['client'] as String?,
      account: json['account'] as String?,
      type: json['type'] as String?,
      sessionId: json['sessionId'] as String?,
      nameEnquiryReference: json['nameEnquiryReference'] as String?,
      paymentReference: json['paymentReference'] as String?,
      mandateReference: json['mandateReference'],
      isReversed: json['isReversed'] as bool?,
      reversalReference: json['reversalReference'],
      provider: json['provider'] as String?,
      providerChannel: json['providerChannel'] as String?,
      providerChannelCode: json['providerChannelCode'] as String?,
      destinationInstitutionCode: json['destinationInstitutionCode'] as String?,
      creditAccountName: json['creditAccountName'] as String?,
      creditAccountNumber: json['creditAccountNumber'] as String?,
      creditBankVerificationNumber: json['creditBankVerificationNumber'],
      creditKycLevel: json['creditKYCLevel'] as String?,
      debitAccountName: json['debitAccountName'] as String?,
      debitAccountNumber: json['debitAccountNumber'] as String?,
      debitBankVerificationNumber: json['debitBankVerificationNumber'],
      debitKycLevel: json['debitKYCLevel'] as String?,
      transactionLocation: json['transactionLocation'] as String?,
      narration: json['narration'] as String?,
      amount: json['amount'] as int?,
      fees: json['fees'] as int?,
      vat: json['vat'] as int?,
      stampDuty: json['stampDuty'] as int?,
      responseCode: json['responseCode'] as String?,
      responseMessage: json['responseMessage'] as String?,
      status: json['status'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      approvedBy: json['approvedBy'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'client': instance.client,
      'account': instance.account,
      'type': instance.type,
      'sessionId': instance.sessionId,
      'nameEnquiryReference': instance.nameEnquiryReference,
      'paymentReference': instance.paymentReference,
      'mandateReference': instance.mandateReference,
      'isReversed': instance.isReversed,
      'reversalReference': instance.reversalReference,
      'provider': instance.provider,
      'providerChannel': instance.providerChannel,
      'providerChannelCode': instance.providerChannelCode,
      'destinationInstitutionCode': instance.destinationInstitutionCode,
      'creditAccountName': instance.creditAccountName,
      'creditAccountNumber': instance.creditAccountNumber,
      'creditBankVerificationNumber': instance.creditBankVerificationNumber,
      'creditKYCLevel': instance.creditKycLevel,
      'debitAccountName': instance.debitAccountName,
      'debitAccountNumber': instance.debitAccountNumber,
      'debitBankVerificationNumber': instance.debitBankVerificationNumber,
      'debitKYCLevel': instance.debitKycLevel,
      'transactionLocation': instance.transactionLocation,
      'narration': instance.narration,
      'amount': instance.amount,
      'fees': instance.fees,
      'vat': instance.vat,
      'stampDuty': instance.stampDuty,
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'status': instance.status,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'approvedBy': instance.approvedBy,
    };
