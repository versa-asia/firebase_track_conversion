import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'firebase_track_conversion_method_channel.dart';

abstract class FirebaseTrackConversionPlatform extends PlatformInterface {
  /// Constructs a FirebaseTrackConversionPlatform.
  FirebaseTrackConversionPlatform() : super(token: _token);

  static final Object _token = Object();

  static FirebaseTrackConversionPlatform _instance =
      MethodChannelFirebaseTrackConversion();

  /// The default instance of [FirebaseTrackConversionPlatform] to use.
  ///
  /// Defaults to [MethodChannelFirebaseTrackConversion].
  static FirebaseTrackConversionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FirebaseTrackConversionPlatform] when
  /// they register themselves.
  static set instance(FirebaseTrackConversionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void initiateOnDeviceConversionMeasurement({required String email}) {
    throw UnimplementedError(
        'initiateOnDeviceConversionMeasurement() has not been implemented.');
  }
}
