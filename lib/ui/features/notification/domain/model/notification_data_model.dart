import 'package:pouchers/ui/features/notification/domain/model/notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data_model.freezed.dart';
part 'notification_data_model.g.dart';

@freezed
class NotificationDataModel with _$NotificationDataModel {
  factory NotificationDataModel(
      {@Default(2) num total,
      @Default('1') String page,
      @JsonKey(name: 'notifications')
      @Default([])
      List<NotificationModel> notifications}) = _NotificationDataModel;

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataModelFromJson(json);
}
