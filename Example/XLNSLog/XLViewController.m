//
//  XLViewController.m
//  XLNSLog
//
//  Created by TanQiLong on 01/18/2021.
//  Copyright (c) 2021 TanQiLong. All rights reserved.
//

#import "XLViewController.h"
#import "XLNSLogFilter.h"

@interface XLViewController ()
@property (nonatomic,strong) dispatch_source_t timer;
@end

@implementation XLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[XLNSLogFilter shareInstance] showTheLogMessageOnScreen:YES];
}

- (IBAction)printButtonClicked:(id)sender {
    XLOG(@"NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test NSLog test");
}

- (IBAction)subThreadTest:(id)sender {
    dispatch_queue_t que = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        XLOG(@"Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.");
    });
    dispatch_resume(_timer);
}

@end
