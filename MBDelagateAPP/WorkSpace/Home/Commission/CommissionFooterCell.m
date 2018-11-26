//
//  CommissionFooterCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/18.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "CommissionFooterCell.h"

@interface CommissionFooterCell ()
@property (nonatomic,strong) UIImageView *bgImgView;
@property (nonatomic,strong) UIImageView *iconImgView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *contentLab;
@end
@implementation CommissionFooterCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"commissionFooterCell";
    CommissionFooterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CommissionFooterCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self setupOriginal];
    }
    return self;
}

-(void)setupOriginal
{
    [self.contentView addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@(-10));
    }];
    
    [self.bgImgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.equalTo(@16);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.bgImgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@14);
        make.left.equalTo(self.iconImgView.mas_right).offset(16);
        make.height.equalTo(@16);
    }];
    
    [self.bgImgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@14);
        make.left.equalTo(self.titleLab.mas_left).offset(-16);
        make.right.equalTo(@(-16));
        make.height.equalTo(@16);
    }];
}

#pragma mark -
-(void)commissionFooterWithDictionary:(NSDictionary *)dict
{
    _iconImgView.image = [UIImage imageNamed:dict[@"icon"]];
    
    _titleLab.text = dict[@"title"];
    
    _contentLab.text = dict[@"content"];
}

#pragma mark - lazy
-(UIImageView *)bgImgView
{
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImgView.image = [UIImage imageNamed:@"totle-bg"];
    }
    return _bgImgView;
}

-(UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _iconImgView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.textColor = RGB(255, 255, 255);
        _titleLab.font = FONT(16);
    }
    return _titleLab;
}

-(UILabel *)contentLab
{
    if (!_contentLab) {
        _contentLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLab.textColor = RGB(255, 255, 255);
//        _contentLab.font = UniversalFont(@"SimHei", 16);
        _contentLab.font = FONT(16);
        _contentLab.textAlignment = NSTextAlignmentRight;
    }
    return _contentLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
