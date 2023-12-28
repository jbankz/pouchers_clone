import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/serializer/tag_serializer.dart';

part 'transfer.freezed.dart';
part 'transfer.g.dart';

@freezed
class Transfer with _$Transfer {
  @HiveType(typeId: 7, adapterName: 'AttributesAdapter')
  factory Transfer(
      {@JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'sender_name') String? senderName,
      @JsonKey(name: 'receiver_name') String? receiverName,
      @TagSerializer() @JsonKey(name: 'receiver_tag') String? receiverTag,
      String? note,
      @StringToNumSerializer() @Default(0) num amount,
      @JsonKey(name: 'transaction_date') String? transactionDate,
      String? status}) = _Transfer;

  factory Transfer.fromJson(Map<String, dynamic> json) =>
      _$TransferFromJson(json);
}
