//
//  XJMapSDKPlugin.m
//  cordovaDemo
//
//  Created by zhangty on 2018/12/3.
//

#import "XJMapSDKPlugin.h"
#import <XJMapSDK/XJMapSDK.h>
#import <Cordova/CDVAppDelegate.h>
#import "ExampleLocationViewController.h"

@implementation XJMapSDKPlugin

- (void)initMapSDK:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    @try {
        //初始化SDK
        NSString *appKey = @"";
        if (command.arguments.count >= 1) {
            appKey = command.arguments[0];
        }

    //初始化XJMap
    [XJmapServices setAppKey:appKey];
    [[XJmapServices sharedInstance] application:[UIApplication sharedApplication] didFinishLaunchingWithOptions:nil];
        
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"initSDK ok"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showMap:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    @try {
        //显示地图
        // [XJShareConfig showSharePlatforms:@[@(XJShareTypeWeChat), @(XJShareTypeQQ), @(XJShareTypeSMS)]];
        NSString *mapId = @"";
        if (command.arguments.count >= 1) {
            mapId = command.arguments[0];
        }

        XJMapViewController *vc = [[XJMapViewController alloc] initWithMapId:mapId];
        
        //可以使用其他方式弹出界面，如navigationController
        CDVAppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.window.rootViewController presentViewController:vc animated:true completion:nil];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"showMap ok"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
    
- (void)naviTo:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    @try {
        //导航到具体地点
        NSString *mapId = @"";
        NSString *targetName = @"";
        NSString *targetId = @"";
        if (command.arguments.count >= 2) {
            mapId = command.arguments[0];
            targetName = command.arguments[1];
            targetId = command.arguments[2];
        }
        
        XJMapViewController *vc = [[XJMapViewController alloc] initWithMapId:(NSString *)mapId targetName:targetName targetId:targetId];
        
        //可以使用其他方式弹出界面，如navigationController
        CDVAppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.window.rootViewController presentViewController:vc animated:true completion:nil];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"naviTo ok"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)location:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    @try {
        //定位示例
        ExampleLocationViewController *vc = [[ExampleLocationViewController alloc] init];
        
        //可以使用其他方式弹出界面，如navigationController
        CDVAppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.window.rootViewController presentViewController:vc animated:true completion:nil];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"location ok"];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
