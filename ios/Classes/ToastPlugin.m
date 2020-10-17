#import "ToastPlugin.h"

@implementation ToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"toast_plugin"
            binaryMessenger:[registrar messenger]];
  ToastPlugin* instance = [[ToastPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"showToast" isEqualToString:call.method]) {
      NSDictionary* map = call.arguments;
      NSString* message = map[@"message"];
      
      UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
      
      UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
      [alert addAction:okAction];
      
      UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
      [alert addAction:cancel];
      
      UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
      [[keyWindow rootViewController] presentViewController:alert animated:YES completion:nil];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
