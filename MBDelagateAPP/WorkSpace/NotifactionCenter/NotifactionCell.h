//
//  NotifactionCell.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/23.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBNotifacateModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NotifactionCell : UITableViewCell
- (void)config:(MBNotifacateModel*)dic;

@property(nonatomic,copy)void(^deleteData)(void);
@end

NS_ASSUME_NONNULL_END
