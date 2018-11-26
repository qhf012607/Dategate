//
//  FinanceReportCell.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/23.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^arrowBtnBlock)(UIButton *btn);
@class FinanceReportFrame;
@interface FinanceReportCell : UITableViewCell

@property (nonatomic,strong) FinanceReportFrame *reportFrame;

@property (nonatomic,copy) arrowBtnBlock arrowBlock;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
