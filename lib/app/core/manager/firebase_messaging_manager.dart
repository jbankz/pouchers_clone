import 'package:Pouchers/app/config/app_logger.dart';
import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

import '../theme/light_theme.dart';

class FirebaseMessagingManager {
  static final _logger = getLogger('FirebaseMessagingManager');
  static late FirebaseMessaging _firebaseMessaging;

  static FirebaseMessaging get instance => _firebaseMessaging;

  static Future<void> initializeInstance(WidgetRef ref) async {
    _firebaseMessaging = FirebaseMessaging.instance;
    await _setupFCM(ref);
  }

  // Initialize Firebase Cloud Messaging
  static Future<void> _setupFCM(WidgetRef widgetRef) async {
    await _firebaseMessaging.requestPermission();

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _parseNotification(message.notification!);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      if (message.notification?.title != null) {
        await _parseNotification(message.notification!);
      }
    });

    FirebaseMessaging.onBackgroundMessage(
      (message) => _backgroundMessageHandler(message.data),
    );

    try {
      await _firebaseMessaging.getToken().then(
        (String? token) {
          assert(token != null);
          widgetRef.read(userNotifierProvider.notifier).updateProfile(
              UserDto(fcmToken: token),
              showNotificationTray: false);
        },
      );
    } catch (e, stack) {
      _logger.e('Error: $e ===> $stack');
    }
  }

  // Parse and show notification
  static Future<void> _parseNotification(
      RemoteNotification notification) async {
    showSimpleNotification(
      Text(
        notification.body ?? '',
        style: kHeadline6Style.copyWith(color: Colors.white),
      ),
      duration: const Duration(seconds: 10),
      background: kPrimaryColor,
      elevation: 0,
    );
  }

  // Handle background messages
  static Future<dynamic> _backgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) _logger.d(message['data']);

    if (message.containsKey('notification')) _logger.d(message['notification']);
  }
}
