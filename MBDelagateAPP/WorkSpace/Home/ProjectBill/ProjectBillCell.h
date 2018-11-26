//
//  ProjectBillCell.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/22.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProjectBillCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)projectBillWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
