//
//  XLScreenMessageView.m
//  LogTool
//
//  Created by Shawn on 2021/1/13.
//

#import "XLScreenMessageView.h"
#import "XLLogCell.h"
#import "XLNSLogUtil.h"

@interface XLScreenMessageView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,assign) BOOL onScreen;
@property (nonatomic,assign) BOOL autoScroll; // if need to auto scroll the screen
@end

@implementation XLScreenMessageView

-(instancetype)initWithDataArray:(NSMutableArray *)array {
    self = [super initWithFrame:UIScreen.mainScreen.bounds];
    if (self) {
        _dataArray = array;
        float statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,statusBarHeight,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - statusBarHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = nil;
        if (@available(iOS 13.0, *)) {
            _tableView.automaticallyAdjustsScrollIndicatorInsets = NO;
        } else {
            // Fallback on earlier versions
        }
        [self addSubview:_tableView];
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.8;
        
        //
        NSBundle * currentBundle = [NSBundle bundleForClass:[self class]];
        [_tableView registerNib:[UINib nibWithNibName:@"XLLogCell" bundle:currentBundle] forCellReuseIdentifier:@"XLLogCell"];
        _autoScroll = YES;
    }
    return self;
}

#pragma mark tableview
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XLLogCell * cell = [tableView dequeueReusableCellWithIdentifier:@"XLLogCell" forIndexPath:indexPath];
    [cell setMessage:[_dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [XLLogCell heightWithString:[_dataArray objectAtIndex:indexPath.row]];
}

-(void)refreshNewStringInScreen:(NSString *)str {
    if (_onScreen) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0];
//        [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
        [_tableView reloadData];
        if (_autoScroll) {
            [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        }
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.y);
    NSLog(@"当前高度%f",scrollView.contentSize.height);
    float currentRollY = scrollView.contentOffset.y;
    float contentHeight = scrollView.contentSize.height;
    float tableHeight = _tableView.bounds.size.height;
    //whe user scroll up, don't auto scroll.
    if ((currentRollY + tableHeight ) < contentHeight) {
        _autoScroll = NO;
    }
    else {
        _autoScroll = YES;
    }
}

-(void)show {
    UIWindow * window = [XLNSLogUtil getCurrentWindow];
    _onScreen = YES;
    [window addSubview:self];
    [self.tableView reloadData];
}

-(void)hide {
    [self removeFromSuperview];
    _onScreen = NO;
}

@end
