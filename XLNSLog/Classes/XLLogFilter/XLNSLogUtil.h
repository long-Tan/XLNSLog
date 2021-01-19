//
//  XLNSLogUtil.h
//  LogTool
//
//  Created by Shawn on 2021/1/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLNSLogUtil : NSObject

+(UIWindow *)getCurrentWindow;

+(NSString *)getCurrentTime;

//add some assistant message
+(NSString *)StrWithAssistantMessage:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
