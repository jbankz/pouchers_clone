import 'package:intercom_flutter/intercom_flutter.dart';

class IntercomManager {
  static final _instance = Intercom.instance;

  static void displayMessenger() => _instance.displayMessenger();
}
