import UIKit
import Flutter
import Intercom

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    Intercom.setApiKey("ios_sdk-a1b43e5e09d3ef333aaec60a4ae3cfa79f477358", forAppId:"ors25jkb")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
