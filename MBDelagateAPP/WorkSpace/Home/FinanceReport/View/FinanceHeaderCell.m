//
//  FinanceHeaderCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/23.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "FinanceHeaderCell.h"

@interface FinanceHeaderCell ()
@property (nonatomic,strong) UIImageView *bgImgView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *amountLab;
@property (nonatomic,strong) UILabel *amountUnitLab;
@end
@implementation FinanceHeaderCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"financeHeaderCell";
    FinanceHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[FinanceHeaderCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupOriginal];
    }
    return self;
}

-(void)setupOriginal
{
    [self.contentView addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@108);
        make.height.equalTo(@75);
    }];
    
    [self.bgImgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@22.5);
        make.left.equalTo(@16);
        make.height.equalTo(@11);
    }];
    
    [self.bgImgView addSubview:self.amountLab];
    [self.amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-17.5));
        make.left.equalTo(@16);
        make.height.equalTo(@15);
    }];
    
    [self.bgImgView addSubview:self.amountUnitLab];
    [self.amountUnitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.amountLab);
        make.right.equalTo(@(-12));
        make.height.equalTo(@11);
    }];
}

#pragma mark -
-(void)configWithCell:(NSDictionary *)dict
{
    _titleLab.text = dict[@"title"];
    
    _amountLab.text = dict[@"amount"];
}

#pragma mark - lazy
-(UIImageView *)bgImgView
{
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImgView.image = [UIImage imageNamed:@"caiwuform-bg"];
        _bgImgView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    }
    return _bgImgView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.textColor = RGBA(255, 255, 255, 0.49);
        _titleLab.font = FONT(11);
    }
    return _titleLab;
}

-(UILabel *)amountLab
{
    if (!_amountLab) {
        _amountLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _amountLab.textColor = RGB(255, 255, 255);
        _amountLab.font = FONT(15);
    }
    return _amountLab;
}

-(UILabel *)amountUnitLab
{
    if (!_amountUnitLab) {
        _amountUnitLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _amountUnitLab.textColor = RGB(240, 206, 137);
        _amountUnitLab.font = FONT(11);
        _amountUnitLab.text = @"￥";
    }
    return _amountUnitLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
