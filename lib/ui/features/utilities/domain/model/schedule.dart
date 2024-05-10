import 'package:pouchers/app/serializer/date_time_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  factory Schedule(
      {@Default(0) num? id,
      @JsonKey(name: 'schedule_id') String? scheduleId,
      @JsonKey(name: 'user_id') String? userId,
      String? amount,
      String? recipient,
      String? category,
      @JsonKey(name: 'sub_category') String? subCategory,
      String? frequency,
      @JsonKey(name: 'created_at') @DateTimeSerializer() DateTime? createdAt,
      @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime? updatedAt,
      @JsonKey(name: 'mapped_frequency') String? mappedFrequency,
      @JsonKey(name: 'bank_name') String? bankName,
      String? note,
      String? status,
      @JsonKey(name: 'mobile_operator_public_id')
      String? mobileOperatorPublicId,
      @JsonKey(name: 'mobile_operator_service_id')
      String? mobileOperatorServiceId,
      @JsonKey(name: 'merchant_account') String? merchantAccount,
      @JsonKey(name: 'merchant_service') String? merchantService}) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
