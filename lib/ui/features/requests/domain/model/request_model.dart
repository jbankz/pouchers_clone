import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'request_model.freezed.dart';
part 'request_model.g.dart';

@freezed
@HiveType(typeId: DbConstants.twentyTwo)
class RequestModel with _$RequestModel {
  factory RequestModel({
    @JsonKey(name: 'request_id') String? requestId,
    @JsonKey(name: 'requestee_user_id') String? requesteeUserId,
    @JsonKey(name: 'requester_user_id') String? requesterUserId,
    @StringToNumSerializer() @Default(0) num amount,
    @StringToNumSerializer()
    @JsonKey(name: 'fulfilled_amount')
    @Default(0)
    num fulfilledAmount,
    @DateTimeSerializer() @JsonKey(name: 'created_at') DateTime? createdAt,
    String? note,
    String? status,
    String? reason,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_picture') String? profilePicture,
  }) = _RequestModel;

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);
}
