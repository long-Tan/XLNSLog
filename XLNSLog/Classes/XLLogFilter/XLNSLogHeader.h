//
//  XLNSLogHeader.h
//  LogTool
//
//  Created by Shawn on 2021/1/13.
//

#import "XLNSLogFilter.h"



//if is open the function  1:open the function 0:Close the function
#define KXLNSLOG_OPEN 1

//the max number of log message
#define KXL_MAX_LOG_NUMBER 1000

#ifdef DEBUG

#ifdef KXLNSLOG_OPEN
#define NSLog(...)
#define XLOG(...) XLLogMessageF(__VA_ARGS__)
#endif

#else
#define NSLog(...)
#define XLOG(...) {}

#endif
