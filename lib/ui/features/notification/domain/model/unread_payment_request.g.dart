// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnreadPaymentRequestImpl _$$UnreadPaymentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UnreadPaymentRequestImpl(
      unreadPaymentRequestCount: json['unreadPaymentRequestCount'] as int? ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map(
                  (e) => NotificationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UnreadPaymentRequestImplToJson(
        _$UnreadPaymentRequestImpl instance) =>
    <String, dynamic>{
      'unreadPaymentRequestCount': instance.unreadPaymentRequestCount,
      'result': instance.result,
    };
