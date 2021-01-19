#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "XLLogCell.h"
#import "XLNSLogFilter.h"
#import "XLNSLogHeader.h"
#import "XLNSLogUtil.h"
#import "XLScreenMessageView.h"
#import "XLScreenShowManager.h"

FOUNDATION_EXPORT double XLNSLogVersionNumber;
FOUNDATION_EXPORT const unsigned char XLNSLogVersionString[];

