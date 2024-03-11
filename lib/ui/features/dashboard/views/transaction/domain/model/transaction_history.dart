import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../../../app/core/constants/db_constants.dart';
import '../../../../../../../app/serializer/date_time_serializer.dart';
import '../../../../../../../app/serializer/tag_serializer.dart';
import '../../../../../utilities/domain/enum/service_category.dart';
import '../enum/transaction_type.dart';

part 'transaction_history.freezed.dart';
part 'transaction_history.g.dart';

@freezed
@HiveType(typeId: DbConstants.seventeen)
class TransactionHistory with _$TransactionHistory {
  factory TransactionHistory(
      {@HiveField(0) @JsonKey(name: 'transaction_id') String? transactionId,
      @HiveField(2) @JsonKey(name: 'user_id') String? userId,
      @HiveField(3) @StringToNumSerializer() @Default(0) num amount,
      @HiveField(4)
      @StringToNumSerializer()
      @Default(0)
      @JsonKey(name: 'transaction_fee')
      num transactionFee,
      @HiveField(5) @Default(Currency.ngn) Currency currency,
      @HiveField(6)
      @JsonKey(name: 'transaction_type')
      @HiveField(7)
      @Default(TransactionType.debit)
      TransactionType transactionType,
      @HiveField(8)
      @JsonKey(name: 'transaction_category')
      ServiceCategory? transactionCategory,
      @HiveField(9)
      @JsonKey(name: 'transaction_reference')
      String? transactionReference,
      @HiveField(10) @JsonKey(name: 'beneficiary_name') String? beneficiaryName,
      @HiveField(11) @JsonKey(name: 'extra_details') ExtraDetails? extraDetails,
      @HiveField(12) String? remarks,
      @HiveField(13) String? status,
      @HiveField(14)
      @JsonKey(name: 'created_at')
      @DateTimeSerializer()
      DateTime? createdAt,
      @HiveField(15)
      @JsonKey(name: 'updated_at')
      @DateTimeSerializer()
      DateTime? updatedAt}) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}

@freezed
@HiveType(typeId: DbConstants.eighteen)
class ExtraDetails with _$ExtraDetails {
  factory ExtraDetails(
      {@HiveField(0) @JsonKey(name: 'sender_name') String? senderName,
      @HiveField(1)
      @JsonKey(name: 'sender_tag')
      @TagSerializer()
      String? senderTag,
      @HiveField(2)
      @JsonKey(name: 'receiver_tag')
      @TagSerializer()
      String? receiverTag,
      @HiveField(3) @JsonKey(name: 'receiver_picture') String? receiverPicture,
      @HiveField(4) String? phoneNumber,
      @HiveField(5) ServiceCategory? category,
      @HiveField(6) String? subCategory,
      @StringToNumSerializer() @Default(0) @HiveField(7) num amount,
      @HiveField(8) String? customerId,
      @HiveField(9) String? email,
      @HiveField(10) String? token,
      @HiveField(11) String? date,
      @HiveField(12) String? transactionId,
      @HiveField(13) String? vat,
      @HiveField(14) String? customerReferenceNumber,
      @HiveField(15) String? customerReceiptNumber,
      @HiveField(16) String? customerFirstName,
      @HiveField(17) String? customerName,
      @HiveField(18) String? address,
      @StringToNumSerializer()
      @Default(0)
      @HiveField(19)
      num units}) = _ExtraDetails;

  factory ExtraDetails.fromJson(Map<String, dynamic> json) =>
      _$ExtraDetailsFromJson(json);
}
