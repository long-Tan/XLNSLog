//
//  XLLogCell.h
//  LogTool
//
//  Created by Shawn on 2021/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLLogCell : UITableViewCell

+(float)heightWithString:(NSString *)str;

-(void)setMessage:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
