
//
//  NotifactionCell.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/23.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "NotifactionCell.h"
@interface NotifactionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mas_right;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIView *viewCover;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mas_left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentRight;
@property (nonatomic, strong) MBNotifacateModel *dic;
@end
@implementation NotifactionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.time.textColor = RGBA(255, 255, 255, 0.4);
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UISwipeGestureRecognizer *geter = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(spanGester:)];
    [self addGestureRecognizer:geter];
    UISwipeGestureRecognizer *geterleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(spanGester:)];
    geterleft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:geterleft];
}

- (void)config:(MBNotifacateModel*)dic{
    self.dic = dic;
    if ([dic.deleted isEqualToString:@"false"]) {
        self.mas_right.constant = 33;
        self.contentRight.constant = 5;
    }else{
        self.mas_right.constant = 73;
        self.contentRight.constant = -35;
    }
    if (![dic.type isEqualToString:@"1"]) {
        self.name.text = @"优惠通知";
        self.imageLeft.image = [UIImage imageNamed:@"Preferential"];
    }else{
        self.name.text = @"账单通知";
        self.imageLeft.image = [UIImage imageNamed:@"icon-payment"];
    }
    self.time.text  = dic.time;
    self.content.text = dic.content;
}

- (IBAction)delete:(UIButton*)sender{
    if (self.deleteData) {
        self.deleteData();
    }
}


- (void)spanGester:(UISwipeGestureRecognizer*)gester{
    if (gester.direction == UISwipeGestureRecognizerDirectionLeft) {
        [UIView animateWithDuration:0.5 animations:^{
            self.mas_right.constant = 73;
            self.contentRight.constant = -35;
            [self layoutIfNeeded];
           
        } completion:^(BOOL finished) {
            [self.dic setValue:@"true" forKey:@"deleted"];
        }];
    }else if (gester.direction == UISwipeGestureRecognizerDirectionRight){
        [UIView animateWithDuration:0.5 animations:^{
            self.mas_right.constant = 33;
             self.contentRight.constant = 5;
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
              [self.dic setValue:@"false" forKey:@"deleted"];
        }];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
