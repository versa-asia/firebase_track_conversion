import Flutter
import UIKit
import FirebaseCore
import FirebaseAnalytics

public class SwiftFirebaseTrackConversionPlugin: NSObject, FlutterPlugin {
  static let instance = SwiftFirebaseTrackConversionPlugin()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      let channel = FlutterMethodChannel(name: "firebase_track_conversion", binaryMessenger: registrar.messenger())
      let instance = SwiftFirebaseTrackConversionPlugin.instance
      registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initiateOnDeviceConversionMeasurement":
        return initiateOnDeviceConversionMeasurement(call, result: result)
    default:
        result(FlutterMethodNotImplemented)
    }
  }

  func initiateOnDeviceConversionMeasurement(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let arguments = call.arguments as? NSDictionary,
          let email = arguments["email"] as? String else {
        result(FlutterError.init(code:"invalidParam", message: "missing argument", details: call.arguments))
        return
    }

    Analytics.initiateOnDeviceConversionMeasurement(emailAddress: email)
  }
}
