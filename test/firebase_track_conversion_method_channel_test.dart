import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_track_conversion/firebase_track_conversion_method_channel.dart';

void main() {
  MethodChannelFirebaseTrackConversion platform = MethodChannelFirebaseTrackConversion();
  const MethodChannel channel = MethodChannel('firebase_track_conversion');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
