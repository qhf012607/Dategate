//
//  BaodianCell.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/16.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HeyingtuiguangCellDelegate <NSObject>

-(void)copySuccess:(NSDictionary *)dict;

@end
@interface HeyingtuiguangCell : UITableViewCell

@property (nonatomic,strong) id<HeyingtuiguangCellDelegate>delegate;

+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)baodianWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
