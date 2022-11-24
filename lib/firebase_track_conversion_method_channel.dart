import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'firebase_track_conversion_platform_interface.dart';

/// An implementation of [FirebaseTrackConversionPlatform] that uses method channels.
class MethodChannelFirebaseTrackConversion
    extends FirebaseTrackConversionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('firebase_track_conversion');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  void initiateOnDeviceConversionMeasurement({required String email}) {
    methodChannel.invokeMethod(
      'initiateOnDeviceConversionMeasurement',
      <String, Object?>{'email': email},
    );
  }
}
