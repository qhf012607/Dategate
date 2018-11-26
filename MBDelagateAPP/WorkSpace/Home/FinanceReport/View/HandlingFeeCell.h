//
//  HandlingFeeCell.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/26.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^arrowBtnBlock)(UIButton *btn);
@class HandlingFeeFrame;
@interface HandlingFeeCell : UITableViewCell

@property (nonatomic,strong) HandlingFeeFrame *feeFrame;

@property (nonatomic,copy) arrowBtnBlock arrowBlock;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
