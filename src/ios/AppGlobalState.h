#import <Cordova/CDVPlugin.h>

@interface AppGlobalState : CDVPlugin{
    NSMutableDictionary *_stateDictionary;
}

- (void)getAppState:(CDVInvokedUrlCommand *)command;

- (void)setAppState:(CDVInvokedUrlCommand *)command;

- (void)loadUrl:(CDVInvokedUrlCommand *)command;

- (void)exitApp:(CDVInvokedUrlCommand *)command;

@end