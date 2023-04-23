import 'package:firebase_messaging/firebase_messaging.dart';

class FCManager {
  static FirebaseMessaging? firebaseMessaging;

  static void setupFCM() {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    firebaseMessaging = _firebaseMessaging;
  }

  static FirebaseMessaging getInstance() => firebaseMessaging!;
}