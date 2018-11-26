//
//  BaoDianTableViewCell.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/26.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "BaoDianTableViewCell.h"
@interface BaoDianTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *upLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;

@end
@implementation BaoDianTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.upLable.text = @"一个只有你知道的秘密，怎么获取新玩家";
    self.dateLable.text = @"2018/9/10 17:49";
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
