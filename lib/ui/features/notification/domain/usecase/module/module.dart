import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../../../data/repository/module/notification_repo_module.dart';
import '../notification_usecase.dart';

final getNotificationUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => NotificationUseCaseImpl(ref.read(notificationRepoModule)));
