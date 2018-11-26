//
//  HomeContentVieCell.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/3.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "HomeContentVieCell.h"
@interface HomeContentVieCell ()
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet MBImageView *imageVIew;

@end
@implementation HomeContentVieCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.imageVIew.layer.cornerRadius = 5;
    // Initialization code
}

- (void)config:(NSString*)title{
   // self.contentLab.text = title;
    self.imageVIew.image = [UIImage imageNamed:title];
 //   self.imageVIew.backgroundColor  = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
