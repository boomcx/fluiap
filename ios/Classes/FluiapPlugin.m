#import "FluiapPlugin.h"
#import "CHIAPManager.h"

@implementation FluiapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.xzkj/fluiap"
            binaryMessenger:[registrar messenger]];
  FluiapPlugin* instance = [[FluiapPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"purchase" isEqualToString:call.method]) {
//        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
        [[CHIAPManager shareSIAPManager] startPurchWithID:call.arguments[@"id"] completeHandle:^(SIAPPurchType type, NSData *data) {
            NSLog(@"%ld", type);
            NSLog(@"%@", data);
        }];
        
    } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
