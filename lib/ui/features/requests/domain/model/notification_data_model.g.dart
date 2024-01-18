// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDataModelImpl _$$NotificationDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataModelImpl(
      total: json['total'] as num? ?? 2,
      page: json['page'] as String? ?? '1',
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map(
                  (e) => NotificationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NotificationDataModelImplToJson(
        _$NotificationDataModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'notifications': instance.notifications,
    };
