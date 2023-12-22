import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../../../data/repository/module/notification_repo_module.dart';
import '../notification_usecase.dart';
import '../read_notification_usecase.dart';
import '../unread_payment_notification_usecase.dart';

final getNotificationUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => NotificationUseCaseImpl(ref.read(notificationRepoModule)));

final readNotificationUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ReadNotificationUseCaseImpl(ref.read(notificationRepoModule)));

final getUnreadPaymentNotificationUseCaseModule =
    Provider<PoucherUseCaseWithOutParam>((ref) =>
        UnreadPaymentNotificationUseCaseImpl(ref.read(notificationRepoModule)));
