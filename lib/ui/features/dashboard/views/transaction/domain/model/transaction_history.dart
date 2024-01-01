import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../../../app/serializer/date_time_serializer.dart';
import '../../../../../../../app/serializer/tag_serializer.dart';
import '../../../../../utilities/domain/enum/service_category.dart';
import '../enum/transaction_type.dart';

part 'transaction_history.freezed.dart';
part 'transaction_history.g.dart';

@freezed
class TransactionHistory with _$TransactionHistory {
  @HiveType(typeId: 17, adapterName: 'TransactionHistoryAdapter')
  factory TransactionHistory(
      {@HiveField(0) @JsonKey(name: 'transaction_id') String? transactionId,
      @HiveField(2) @JsonKey(name: 'user_id') String? userId,
      @HiveField(3) @StringToNumSerializer() @Default(0) num amount,
      @HiveField(4)
      @StringToNumSerializer()
      @Default(0)
      @JsonKey(name: 'transaction_fee')
      num transactionFee,
      @HiveField(5) @Default(Currency.NGN) Currency currency,
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
class ExtraDetails with _$ExtraDetails {
  @HiveType(typeId: 18, adapterName: 'ExtraDetailsAdapter')
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
      @HiveField(3)
      @JsonKey(name: 'receiver_picture')
      String? receiverPicture}) = _ExtraDetails;

  factory ExtraDetails.fromJson(Map<String, dynamic> json) =>
      _$ExtraDetailsFromJson(json);
}
