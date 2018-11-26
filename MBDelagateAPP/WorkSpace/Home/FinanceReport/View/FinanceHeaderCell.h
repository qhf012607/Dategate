//
//  FinanceHeaderCell.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/23.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FinanceHeaderCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)configWithCell:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
