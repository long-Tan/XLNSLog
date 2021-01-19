//
//  ScreenShowManager.m
//  LogTool
//
//  Created by Shawn on 2021/1/13.
//

#import "XLScreenShowManager.h"
#import "XLNSLogHeader.h"
#import <UIKit/UIKit.h>
#import "XLScreenMessageView.h"
#import "XLNSLogUtil.h"
#import "XLNSLogHeader.h"

@interface XLScreenShowManager()
@property (nonatomic,strong) NSMutableArray * stringArray;
@property (nonatomic,strong) UIButton * switchButton;
@property (nonatomic,strong) UIWindow * window;
@property (nonatomic,strong) XLScreenMessageView * messageView;
@property (nonatomic,assign) BOOL isShowMessageView;
@end

@implementation XLScreenShowManager

-(instancetype)init {
    self = [super init];
    if (self) {
        _stringArray = [NSMutableArray array];
        //if in the begining of app, needing to some time to activate the windowScene, then you can add subviews
        [self performSelector:@selector(createViews) withObject:nil afterDelay:0.5];
    }
    return self;
}

-(void)createViews {
    //create a movable button
    _switchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    float width = 35;
    _switchButton.frame = CGRectMake(100, 100, width, width);
    [_switchButton addTarget:self action:@selector(switchButtonClicked) forControlEvents:UIControlEventTouchDownRepeat];
    _switchButton.backgroundColor = [UIColor whiteColor];
    [_switchButton setTitle:@"1" forState:UIControlStateNormal];
    _switchButton.layer.masksToBounds = YES;
    _switchButton.layer.cornerRadius = width / 2.0;
    _switchButton.layer.borderColor = [[UIColor blackColor] CGColor];
    _switchButton.layer.borderWidth = 0.5;
    [_switchButton addTarget:self action:@selector(buttonMoving:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_switchButton addTarget:self action:@selector(buttonUp:withEvent:) forControlEvents:UIControlEventTouchDragOutside];;
    _window = [XLNSLogUtil getCurrentWindow];
    _window.backgroundColor = [UIColor grayColor];
    [_window addSubview:_switchButton];
}

#pragma mark moving button
-(void)buttonMoving:(UIButton *)bt withEvent:ev{
    bt.center = [[[ev allTouches] anyObject]locationInView:_window];
}

-(void)buttonUp:(UIButton *)bt withEvent:ev{
    bt.center = [[[ev allTouches] anyObject]locationInView:_window];
}

-(void)switchButtonClicked {
    _switchButton.selected = !_switchButton.selected;
    if (_switchButton.selected) {
        //show the message screen
        [self.messageView show];
        [[XLNSLogUtil getCurrentWindow]bringSubviewToFront:_switchButton];
        _isShowMessageView = YES;
    }
    else {
        //close the screen
        [self.messageView hide];
        _isShowMessageView = NO;
    }
}

-(void)addStringInScreen:(NSString *)str {
    if (str == nil) {
        return;
    }
    [_stringArray addObject:str];
    if (_stringArray.count > KXL_MAX_LOG_NUMBER) {
        [_stringArray removeObjectsInRange:NSMakeRange(0, 300)];
    }
    if (_isShowMessageView) {
        [self.messageView refreshNewStringInScreen:str];
    }
    
}

-(XLScreenMessageView *)messageView {
    if (!_messageView) {
        _messageView = [[XLScreenMessageView alloc]initWithDataArray:_stringArray];
    }
    return _messageView;
}

@end
