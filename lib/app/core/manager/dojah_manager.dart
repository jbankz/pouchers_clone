import 'package:Pouchers/app/config/app_config.dart';
import 'package:Pouchers/app/config/app_logger.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dojah_kyc/flutter_dojah_kyc.dart';

import '../../../ui/notification/notification_tray.dart';

class DojahManager {
  final _logger = getLogger('DojahManager');

  Future<void> triggerDojah(
      {required User user,
      required String widgetId,
      required dynamic Function(dynamic)? onSuccess}) async {
    final DojahKYC dojahKyc = DojahKYC(
        appId: AppConfig.dojahAppId,
        publicKey: AppConfig.dojahPublicKey,
        type: 'custom',
        userData: {
          'first_name': user.firstName,
          'last_name': user.lastName,
          'email': user.email
        },
        config: {
          "debug": kDebugMode,
          "mobile": true,
          "widget_id": widgetId
        },
        metaData: {
          "user_id": user.userId
        });

    await dojahKyc.open(PageRouter.globalContext,
        onSuccess: onSuccess,
        onError: (error) {
          _logger.e(error);
          triggerNotificationTray(error.toString(), error: true);
        },
        onClose: (_) => PageRouter.pop());
  }
}
