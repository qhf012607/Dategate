//
//  LeftViewCell.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/1.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "LeftViewCell.h"
@interface LeftViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imagehead;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labright;

@property (weak, nonatomic) NSDictionary *dic;
@end
@implementation LeftViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
}

- (void)configCell:(NSDictionary*)dic{
    self.dic = dic;
    self.labTitle.text = dic[@"title"];
    self.imagehead.image = [UIImage imageNamed:dic[@"Desel"]];
   // self.labright.text = dic[@"des"];
}

- (void)configNumber:(NSDictionary*)dic{
    if (dic[@"number"]) {
        self.labright.text = dic[@"number"];
    }else{
        self.labright.text = @"";
    }
}

- (void)selected:(BOOL)sel{
    if (sel) {
        self.labright.textColor = MByellow;
        self.labTitle.textColor = MByellow;
        [self performSelector:@selector(timerChangeColor) withObject:nil afterDelay:0.3];
        self.imagehead.image = [UIImage imageNamed:self.dic[@"sel"]];
    }else{
        self.labright.textColor = [UIColor whiteColor];
        self.labTitle.textColor = [UIColor whiteColor];;
        self.imagehead.image = [UIImage imageNamed:self.dic[@"Desel"]];
    }
}

- (void)timerChangeColor{
    [self selected:false];
}
@end
