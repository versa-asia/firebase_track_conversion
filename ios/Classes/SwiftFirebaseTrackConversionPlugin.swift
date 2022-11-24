import Flutter
import UIKit
import FirebaseAnalytics

public class SwiftFirebaseTrackConversionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "firebase_track_conversion", binaryMessenger: registrar.messenger())
    let instance = SwiftFirebaseTrackConversionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // result("iOS " + UIDevice.current.systemVersion)
    switch call.method {
    case "initiateOnDeviceConversionMeasurement":
        return initiateOnDeviceConversionMeasurement(call, result: result)
    default:
        result(FlutterMethodNotImplemented)
    }
  }

  func initiateOnDeviceConversionMeasurement(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let arguments = call.arguments as? FlutterMap,
    let email = arguments['email'] as? String
  }
}
