import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:Pouchers/app/serializer/string_to_num_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utilities/domain/enum/service_category.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  factory ScheduleModel(
      {@StringToNumSerializer() @Default(0) num amount,
      String? recipient,
      ServiceCategory? category,
      @JsonKey(name: 'schedule_id') String? scheduleId,
      @JsonKey(name: 'sub_category') String? subCategory,
      String? frequency,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'beneficiary_account_name') String? beneficiaryAccountName,
      @JsonKey(name: 'current_provider') String? currentProvider,
      String? status,
      @DateTimeSerializer()
      @JsonKey(name: 'created_at')
      DateTime? createdAt}) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}
