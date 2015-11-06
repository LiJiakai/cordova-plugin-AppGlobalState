/********* AppGlobalState.m Cordova Plugin Implementation *******/

#import "AppGlobalState.h"
#import <Cordova/CDVPluginResult.h>

@implementation AppGlobalState

- (void)pluginInitialize{
    self->_stateDictionary = [NSMutableDictionary dictionaryWithCapacity:4];
}

- (void)getAppState:(CDVInvokedUrlCommand *)command{
    NSString *key = [command argumentAtIndex:0];
    if (key == nil) {
        [self constructPluginResult:0 msg:@"请传入key参数" callback:command.callbackId];
        return;
    }
    NSString *appState = [self->_stateDictionary objectForKey:key];
    if (appState == nil) {
        [self constructPluginResult:0 msg:@"无此数据" callback:command.callbackId];
        return;
    }
    [self constructPluginResult:1 msg:appState callback:command.callbackId];
}

- (void) constructPluginResult:(int)successFlag msg:(NSString *)message callback:(NSString *) callbackId{
    CDVCommandStatus commandStatus = (successFlag == 1?CDVCommandStatus_OK:CDVCommandStatus_ERROR);
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:commandStatus messageAsString:message];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)setAppState:(CDVInvokedUrlCommand *)command{
    NSString *key = [command argumentAtIndex:0];
    NSString *value = [command argumentAtIndex:1];
    
    if (key == nil || value == nil) {
        [self constructPluginResult:0 msg:@"key和value的值不能为空" callback:command.callbackId];
        return;
    }
    [self->_stateDictionary setValue:value forKey:key];
}

- (void)loadUrl:(CDVInvokedUrlCommand *)command{
    NSString *url = [command argumentAtIndex:0];
    if (url == nil) {
        NSLog(@"空URL参数");
        return;
    }
    NSURL* fileURL = [NSURL URLWithString:url];
    NSString* filePath = [self.commandDelegate pathForResource:[fileURL path]];
    NSURL * loadedFileUrl = [NSURL fileURLWithPath:filePath];
    
    NSURLRequest *loadedUrlRequest = [NSURLRequest requestWithURL:loadedFileUrl];
    [self.webView loadRequest:loadedUrlRequest];
}
- (void)exitApp:(CDVInvokedUrlCommand *)command{
    exit(EXIT_SUCCESS);
}

@end