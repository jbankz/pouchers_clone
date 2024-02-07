import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/notification_repo.dart';
import '../../source/module/module.dart';
import '../notification_repo_impl.dart';

final notificationRepoModule = Provider<NotificationRepo>(
    (ref) => NotificationRepoImpl(ref.read(notificationSourceModule)));
