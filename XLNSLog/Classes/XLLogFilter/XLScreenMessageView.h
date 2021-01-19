//
//  XLScreenMessageView.h
//  LogTool
//
//  Created by Shawn on 2021/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLScreenMessageView : UIView

-(instancetype)initWithDataArray:(NSMutableArray *)array;


-(void)refreshNewStringInScreen:(NSString *)str;

-(void)show;

-(void)hide;

@end

NS_ASSUME_NONNULL_END
