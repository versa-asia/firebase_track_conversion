#import "FirebaseTrackConversionPlugin.h"
#if __has_include(<firebase_track_conversion/firebase_track_conversion-Swift.h>)
#import <firebase_track_conversion/firebase_track_conversion-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "firebase_track_conversion-Swift.h"
#endif

@implementation FirebaseTrackConversionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFirebaseTrackConversionPlugin registerWithRegistrar:registrar];
}
@end
