#import <Cordova/CDVPlugin.h>

@interface AppGlobalState : CDVPlugin{
    NSMutableDictionary *_stateDictionary;
}

- (void)getAppState:(CDVInvokedUrlCommand *)command;

- (void)setAppState:(CDVInvokedUrlCommand *)command;

@end