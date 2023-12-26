import 'package:Pouchers/app/config/app_config.dart';
import 'package:intercom_flutter/intercom_flutter.dart';

import '../../../ui/features/profile/domain/model/user.dart';
import '../../config/app_logger.dart';

class IntercomManager {
  static final logger = getLogger('IntercomManager');

  static final _instance = Intercom.instance;

  static Future<void> initialize() async =>
      _instance.initialize(AppConfig.intercomAppId,
          androidApiKey: AppConfig.androidIntercomId,
          iosApiKey: AppConfig.iosIntercomId);

  static Future<void> displayMessenger() async =>
      await _instance.displayMessenger();

  static Future<void> loginIdentifiedUser(User? data) async =>
      await _instance.loginIdentifiedUser(
          userId: data?.userId,
          statusCallback: IntercomStatusCallback(
              onSuccess: () =>
                  logger.i('Successfully logged users id: ${data?.userId}'),
              onFailure: (error) =>
                  logger.e('Failed to logged users id: ${data?.userId}')));
}
