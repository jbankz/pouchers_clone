import 'package:Pouchers/app/serializer/date_time_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  @HiveType(typeId: 8, adapterName: 'NotificationModelAdapter')
  factory NotificationModel(
      {@HiveField(0) String? title,
      @HiveField(1) String? body,
      @JsonKey(name: 'created_at')
      @HiveField(2)
      @DateTimeSerializer()
      DateTime? createdAt}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
