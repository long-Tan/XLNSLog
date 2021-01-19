//
//  XLLogCell.m
//  LogTool
//
//  Created by Shawn on 2021/1/15.
//

#import "XLLogCell.h"

#define KXLLogCellFontSize 15

static UITextView * cellTextView; //for calculate the height of cell

@interface XLLogCell()
@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@end

@implementation XLLogCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _logTextView.textColor = [UIColor whiteColor];
    _logTextView.backgroundColor = [UIColor clearColor];
    _logTextView.textContainerInset = UIEdgeInsetsZero;
    _logTextView.textContainer.lineFragmentPadding = 0;
    _logTextView.font = [UIFont systemFontOfSize:KXLLogCellFontSize];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

+(float)heightWithString:(NSString *)str {
    if (!cellTextView) {
        cellTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        cellTextView.font = [UIFont systemFontOfSize:KXLLogCellFontSize];
        cellTextView.textContainerInset = UIEdgeInsetsZero;
        cellTextView.textContainer.lineFragmentPadding = 0;
    }
    cellTextView.text = str;
    CGSize size = [cellTextView sizeThatFits:cellTextView.bounds.size];
    return size.height + 10;
    
}

-(void)setMessage:(NSString *)str {
    _logTextView.text = str;
    
}

@end
