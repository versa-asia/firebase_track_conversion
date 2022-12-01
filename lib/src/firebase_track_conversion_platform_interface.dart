import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'firebase_track_conversion_method_channel.dart';

abstract class FirebaseTrackConversionPlatform extends PlatformInterface {
  @protected
  FirebaseApp? appInstance;

  /// Constructs a FirebaseTrackConversionPlatform.
  FirebaseTrackConversionPlatform({this.appInstance}) : super(token: _token);

  static final Object _token = Object();

  static FirebaseTrackConversionPlatform? _instance;

  /// Returns the [FirebaseApp] for the current instance.
  FirebaseApp get app {
    if (appInstance == null) {
      return Firebase.app();
    }

    return appInstance!;
  }

  /// The default instance of [FirebaseTrackConversionPlatform] to use.
  ///
  /// Defaults to [MethodChannelFirebaseTrackConversion].
  static FirebaseTrackConversionPlatform get instance {
    return _instance ??= MethodChannelFirebaseTrackConversion.instance;
  }

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FirebaseTrackConversionPlatform] when
  /// they register themselves.
  static set instance(FirebaseTrackConversionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Create an instance using [app] using the existing implementation
  factory FirebaseTrackConversionPlatform.instanceFor(
      {required FirebaseApp app}) {
    return FirebaseTrackConversionPlatform.instance.delegateFor(app: app);
  }

  /// Enables delegates to create new instances of themselves
  FirebaseTrackConversionPlatform delegateFor({required FirebaseApp app}) {
    throw UnimplementedError('delegateFor() is not implemented');
  }

  void initiateOnDeviceConversionMeasurement({required String email}) {
    throw UnimplementedError(
        'initiateOnDeviceConversionMeasurement() has not been implemented.');
  }
}
