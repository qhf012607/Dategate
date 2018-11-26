//
//  LeftViewCell.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/1.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeftViewCell : UITableViewCell
- (void)configCell:(NSDictionary*)dic;
- (void)configNumber:(NSDictionary*)dic;
- (void)selected:(BOOL)sel;
@end

NS_ASSUME_NONNULL_END
