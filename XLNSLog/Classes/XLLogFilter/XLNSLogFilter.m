//
//  XLNSLogFilter.m
//  LogTool
//
//  Created by Shawn on 2021/1/12.
//

#import "XLNSLogFilter.h"
#import "XLScreenShowManager.h"
#import "XLNSLogUtil.h"

@interface XLNSLogFilter()
@property (nonatomic,assign) BOOL showOnScreen;
@property (nonatomic,strong) XLScreenShowManager * screenManager;
@end

@implementation XLNSLogFilter

static XLNSLogFilter * XLNSLogFilterInstance;

+(XLNSLogFilter *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        XLNSLogFilterInstance = [XLNSLogFilter new];
    });
    return XLNSLogFilterInstance;
}

-(void)showTheLogMessageOnScreen:(BOOL)printFlag {
    _showOnScreen = printFlag;
    if (printFlag == YES) {
        self.screenManager;
    }
}

void XLLogMessageF(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    NSString * str = [[NSString alloc]initWithFormat:format arguments:args];
    va_end(args);
    CFShow((__bridge CFTypeRef)(str));
    /*
     CFShow(CFSTR("LoggerLogToConsole: data is NULL"));
     // Prepare the final representation and log to console
     CFMutableStringRef s = CFStringCreateMutable(NULL, 0);
     CFStringAppendFormat(s, NULL, CFSTR(".%04d %@%@"),
                          1,
                          @"1",
                          (CFStringRef)@"1");
     CFShow(s);
     CFRelease(s);
     */
    [XLNSLogFilterInstance sndeMessageToScreenManager:str];
}

-(void)sndeMessageToScreenManager:(NSString *) str{
    if (!_showOnScreen) {
        return;
    }
    //add the current time of the log
    NSString * messageStr = [XLNSLogUtil StrWithAssistantMessage:str];
    [_screenManager addStringInScreen:messageStr];
    
}

-(XLScreenShowManager *)screenManager {
    if (!_screenManager) {
        _screenManager = [XLScreenShowManager new];
    }
    return _screenManager;
}

@end


