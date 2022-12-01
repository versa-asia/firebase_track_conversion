import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'firebase_track_conversion_platform_interface.dart';

/// An implementation of [FirebaseTrackConversionPlatform] that uses method channels.
class MethodChannelFirebaseTrackConversion
    extends FirebaseTrackConversionPlatform {
  MethodChannelFirebaseTrackConversion({required FirebaseApp app})
      : super(appInstance: app);

  MethodChannelFirebaseTrackConversion._() : super(appInstance: null);

  static MethodChannelFirebaseTrackConversion get instance {
    return MethodChannelFirebaseTrackConversion._();
  }

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('firebase_track_conversion');

  @override
  FirebaseTrackConversionPlatform delegateFor({required FirebaseApp app}) {
    return MethodChannelFirebaseTrackConversion(app: app);
  }

  @override
  void initiateOnDeviceConversionMeasurement({required String email}) {
    methodChannel.invokeMethod(
      'initiateOnDeviceConversionMeasurement',
      <String, Object?>{'email': email},
    );
  }
}
