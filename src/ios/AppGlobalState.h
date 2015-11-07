#import <Cordova/CDVPlugin.h>

@interface AppGlobalState : CDVPlugin{
    NSMutableDictionary *_stateDictionary;
    long long _timerStartTime;
    NSTimer * _timer;
}

- (void)getAppState:(CDVInvokedUrlCommand *)command;

- (void)setAppState:(CDVInvokedUrlCommand *)command;

- (void)loadUrl:(CDVInvokedUrlCommand *)command;

- (void)exitApp:(CDVInvokedUrlCommand *)command;

- (void)startDocumentLoadTimer:(CDVInvokedUrlCommand *)command;

@end