import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/constants/db_constants.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
@HiveType(typeId: DbConstants.eight)
class NotificationModel with _$NotificationModel {
  factory NotificationModel(
      {@HiveField(0) num? id,
      @HiveField(1) @JsonKey(name: 'notification_id') String? notificationId,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @JsonKey(name: 'created_at')
      @HiveField(4)
      @DateTimeSerializer()
      DateTime? createdAt,
      @HiveField(5)
      @JsonKey(name: 'is_read')
      @Default(false)
      bool isRead}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
