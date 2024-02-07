import 'package:Pouchers/ui/features/notification/data/source/notification_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';
import '../notification_source.dart';

final notificationSourceModule = Provider<NotificationSource>((ref) =>
    NotificationSourceImpl(networkService: ref.watch(networkServiceProvider)));
