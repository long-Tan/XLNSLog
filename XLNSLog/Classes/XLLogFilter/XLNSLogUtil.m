//
//  XLNSLogUtil.m
//  LogTool
//
//  Created by Shawn on 2021/1/15.
//

#import "XLNSLogUtil.h"

@implementation XLNSLogUtil

+(UIWindow *)getCurrentWindow {
    UIWindow * window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
            {
                if (windowScene.activationState == UISceneActivationStateForegroundActive)
                {
                    window = windowScene.windows.firstObject;
                    break;
                }
            }
    }
    else {
        window = [UIApplication sharedApplication].keyWindow;
    }
    return window;
}

+(NSString *)getCurrentTime {
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss"];
    return [formatter stringFromDate:[NSDate date]];
}

+(NSString *)StrWithAssistantMessage:(NSString *)str {
    return [NSString stringWithFormat:@"%@:  %@",[XLNSLogUtil getCurrentTime],str];
}

@end
