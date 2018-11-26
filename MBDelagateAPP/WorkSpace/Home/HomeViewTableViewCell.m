//
//  HomeViewTableViewCell.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/2.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "HomeViewTableViewCell.h"
@interface HomeViewTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageFirst;
@property (weak, nonatomic) IBOutlet UILabel *labForImageFirst;
@property (weak, nonatomic) IBOutlet UIImageView *imageSecond;
@property (weak, nonatomic) IBOutlet UILabel *labForSecnd;
@property (weak, nonatomic) IBOutlet UIImageView *imageEyesLeft;
@property (weak, nonatomic) IBOutlet MBImageView *imageEyesRight;
@property (weak, nonatomic) IBOutlet UIImageView *imageRefresh;

@end

@implementation HomeViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configCell:(NSDictionary*)dic{
    self.labContent.text = dic[@"content"];
  //  self.labForImageFirst.text = dic[@"count"];
    self.imageFirst.image = [UIImage imageNamed:dic[@"icon"]];
//    if (dic[@"eyeleft"]) {
//
//    }
    if (dic[@"gif"]) {
         [self.imageEyesRight loadGif:dic[@"gif"]];
    }else{
        self.imageEyesRight.image = nil;
    }
    if (dic[@"type"]) {
        self.imageRefresh.image = [UIImage imageNamed:@"icon-changeFresh"];
    }else{
        self.imageRefresh.image = nil;
    }
   
}

- (IBAction)refreshAmount:(id)sender {
    if ([self.labContent.text isEqualToString:@"账户余额：23.2323W"]) {
        self.labContent.text = @"账户余额：232323";
         [CyUserDefaults saveValue:@"0" forkey:@"HomeCellW"];
    }else{
        self.labContent.text = @"账户余额：23.2323W";
         [CyUserDefaults saveValue:@"1" forkey:@"HomeCellW"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
