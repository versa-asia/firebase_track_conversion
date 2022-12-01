part of '../firebase_track_conversion.dart';

class FirebaseTrackConversion extends FirebasePluginPlatform {
  FirebaseApp app;
  static final Map<String, FirebaseTrackConversion> _trackerInstances = {};

  FirebaseTrackConversion._({required this.app})
      : super(app.name, 'firebase_track_conversion');

  // Cached and lazily loaded instance of [FirebaseAnalyticsPlatform] to avoid
  // creating a [MethodChannelFirebaseAnalytics] when not needed or creating an
  // instance with the default app before a user specifies an app.
  FirebaseTrackConversionPlatform? _delegatePackingProperty;

  FirebaseTrackConversionPlatform get _delegate {
    return _delegatePackingProperty ??=
        FirebaseTrackConversionPlatform.instanceFor(app: app);
  }

  factory FirebaseTrackConversion.instanceFor({required FirebaseApp app}) {
    if (kIsWeb || app.name == defaultFirebaseAppName) {
      return _trackerInstances.putIfAbsent(app.name, () {
        return FirebaseTrackConversion._(app: app);
      });
    }

    throw PlatformException(
      code: 'default-app',
      message: 'Analytics has multi-app support for web only.',
    );
  }

  static FirebaseTrackConversion get instance {
    FirebaseApp app = Firebase.app();
    return FirebaseTrackConversion.instanceFor(app: app);
  }

  void initiateOnDeviceConversionMeasurement({required String email}) {
    return _delegate.initiateOnDeviceConversionMeasurement(email: email);
  }
}
