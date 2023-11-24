import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppHelper {
  static Future<void> copy(String value) async {
    try {
      Clipboard.setData(ClipboardData(text: value));
      triggerNotificationTray('Copied');
    } catch (e) {
      debugPrintStack(label: e.toString());
    }
  }
}
