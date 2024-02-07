import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'requested_money_model.freezed.dart';
part 'requested_money_model.g.dart';

@freezed
class RequestedMoneyModel with _$RequestedMoneyModel {
  factory RequestedMoneyModel(
      {num? id,
      @JsonKey(name: 'request_id') String? requestId,
      @JsonKey(name: 'requestee_user_id') String? requesteeUserId,
      @JsonKey(name: 'requester_user_id') String? requesterUserId,
      @StringToNumSerializer() @Default(0) num amount,
      @StringToNumSerializer()
      @JsonKey(name: 'fulfilled_amount')
      @Default(0)
      num fulfilledAmount,
      @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
      @DateTimeSerializer() @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? note,
      String? status,
      String? reason}) = _RequestedMoneyModel;

  factory RequestedMoneyModel.fromJson(Map<String, dynamic> json) =>
      _$RequestedMoneyModelFromJson(json);
}
