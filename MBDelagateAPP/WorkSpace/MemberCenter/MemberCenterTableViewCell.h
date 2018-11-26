//
//  MemberCenterTableViewCell.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/22.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberCenterModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MemberCenterTableViewCell : UITableViewCell
@property(nonatomic,strong)UIScrollView *scroll;

- (void)configCell:(MemberCenterModel*)model;


@end

NS_ASSUME_NONNULL_END
