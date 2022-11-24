part of '../firebase_track_conversion.dart';

class FirebaseTrackConversion extends FirebasePluginPlatform {
  FirebaseApp app;
  FirebaseTrackConversion._({required this.app})
      : super(app.name, 'firebase_track_conversion');

  @override
  Future<String?> getPlatformVersion() {
    return FirebaseTrackConversionPlatform.instance.getPlatformVersion();
  }

  @override
  void initiateOnDeviceConversionMeasurement({required String email}) {
    return FirebaseTrackConversionPlatform.instance
        .initiateOnDeviceConversionMeasurement(email: email);
  }
}
