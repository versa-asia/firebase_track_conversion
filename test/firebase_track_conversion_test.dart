import 'package:firebase_track_conversion/src/firebase_track_conversion_method_channel.dart';
import 'package:firebase_track_conversion/src/firebase_track_conversion_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_track_conversion/firebase_track_conversion.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirebaseTrackConversionPlatform
    with MockPlatformInterfaceMixin
    implements FirebaseTrackConversionPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FirebaseTrackConversionPlatform initialPlatform =
      FirebaseTrackConversionPlatform.instance;

  test('MethodChannelFirebaseTrackConversion is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelFirebaseTrackConversion>());
  });

  test('getPlatformVersion', () async {
    FirebaseTrackConversion firebaseTrackConversionPlugin =
        FirebaseTrackConversion.instance;
    MockFirebaseTrackConversionPlatform fakePlatform =
        MockFirebaseTrackConversionPlatform();
    FirebaseTrackConversionPlatform.instance = fakePlatform;

    expect(await firebaseTrackConversionPlugin.getPlatformVersion(), '42');
  });
}
