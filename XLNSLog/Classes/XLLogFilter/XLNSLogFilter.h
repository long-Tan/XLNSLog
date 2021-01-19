//
//  XLNSLogFilter.h
//  LogTool
//
//  Created by Shawn on 2021/1/12.
//



#import <Foundation/Foundation.h>
#import "XLNSLogHeader.h"



NS_ASSUME_NONNULL_BEGIN

@interface XLNSLogFilter : NSObject

+(XLNSLogFilter *)shareInstance;

/// If use the screen to show the log message
/// @param printFlag yes mean show
-(void)showTheLogMessageOnScreen:(BOOL)printFlag;

extern void XLLogMessageF(NSString *format, ...);

@end

NS_ASSUME_NONNULL_END



