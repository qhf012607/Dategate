//
//  CommissionFooterCell.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/18.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommissionFooterCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)commissionFooterWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
