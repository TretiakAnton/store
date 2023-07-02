import UIKit
import Flutter
import Firebase
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
                 GeneratedPluginRegistrant.register(with: self)
                 if FirebaseApp.app() == nil {
                     FirebaseApp.configure()
                     Messaging.messaging().delegate = self
                     GeneratedPluginRegistrant.register(with: self)

                      UNUserNotificationCenter.current().delegate = self

                         let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                         UNUserNotificationCenter.current().requestAuthorization(
                           options: authOptions,
                           completionHandler: { _, _ in }
                         )

                         application.registerForRemoteNotifications()
                     }
                 return super.application(application, didFinishLaunchingWithOptions: launchOptions)
             }
}
