import 'package:pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';
import '../../../../../app/serializer/tag_serializer.dart';

part 'transfer.freezed.dart';
part 'transfer.g.dart';

@freezed
@HiveType(typeId: DbConstants.seven)
class Transfer with _$Transfer {
  factory Transfer(
      {@JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'sender_name') String? senderName,
      @JsonKey(name: 'receiver_name') String? receiverName,
      @TagSerializer() @JsonKey(name: 'receiver_tag') String? receiverTag,
      String? note,
      @StringToNumSerializer() @Default(0) num amount,
      @JsonKey(name: 'transaction_date') String? transactionDate,
      String? status,
      String? frequency,
      String? scheduleId}) = _Transfer;

  factory Transfer.fromJson(Map<String, dynamic> json) =>
      _$TransferFromJson(json);
}
