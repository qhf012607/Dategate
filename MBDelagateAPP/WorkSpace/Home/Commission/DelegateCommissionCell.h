//
//  YongjinCell.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/17.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CommissionFrame;
typedef void(^arrowClickedBlock)(CommissionFrame *frame);

@interface DelegateCommissionCell : UITableViewCell

@property (nonatomic,strong) CommissionFrame *commissionFrame;

@property (nonatomic,  copy) arrowClickedBlock arrowBlock;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
