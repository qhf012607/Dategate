//
//  BaodianCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/16.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "HeyingtuiguangCell.h"

@interface HeyingtuiguangCell ()
@property (nonatomic,strong) UIImageView *bgImgView;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *urlLab;
@property (nonatomic,strong) UIButton *cpBtn;
@property (nonatomic,strong) UILabel *cpSuccessLab;
@property (nonatomic,strong) NSDictionary *cpDict;
@end
@implementation HeyingtuiguangCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"heyingtuiguangCell";
    HeyingtuiguangCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HeyingtuiguangCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
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
        make.top.equalTo(@0);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@75);
    }];
    
    [self.bgImgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20.5);
        make.left.equalTo(@0);
        make.width.equalTo(@2);
        make.height.equalTo(@34);
    }];
    
    [self.bgImgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20.5);
        make.left.equalTo(@16);
        make.right.equalTo(@(-100));
        make.height.equalTo(@16);
    }];
    
    [self.bgImgView addSubview:self.urlLab];
    [self.urlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(4);
        make.left.equalTo(@16);
        make.right.equalTo(@(-100));
        make.height.equalTo(@14);
    }];
    
    [self.bgImgView addSubview:self.cpBtn];
    [self.cpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImgView);
        make.right.equalTo(@(-16));
        make.width.equalTo(@38);
        make.height.equalTo(@38);
    }];
    
    [self.bgImgView addSubview:self.cpSuccessLab];
    [self.cpSuccessLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImgView);
        make.right.equalTo(self.cpBtn.mas_left).offset(-16);
        make.height.equalTo(@13);
    }];
}

#pragma mark -
-(void)baodianWithDictionary:(NSDictionary *)dict
{
    _cpDict = dict;
    
    _titleLab.text = dict[@"title"];
    
    _urlLab.text = dict[@"url"];
    
    if ([dict[@"isCopy"] isEqualToString:@"0"]) {
        _cpSuccessLab.hidden = YES;
    }else{
        _cpSuccessLab.hidden = NO;
    }
}

#pragma mark - event
-(void)cpBtnClicked
{
    [self.delegate copySuccess:_cpDict];
}

#pragma mark - lazy
-(UIImageView *)bgImgView
{
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _bgImgView.image = [UIImage imageNamed:@"heyingBao"];
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = RGB(240, 206, 137);
    }
    return _lineView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.textColor = RGB(255, 255, 255);
        _titleLab.font = [UIFont systemFontOfSize:16];
    }
    return _titleLab;
}

-(UILabel *)urlLab
{
    if (!_urlLab) {
        _urlLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _urlLab.textColor = RGBA(255, 255, 255, 0.64);
        _urlLab.font = [UIFont systemFontOfSize:12];
    }
    return _urlLab;
}

-(UIButton *)cpBtn
{
    if (!_cpBtn) {
        _cpBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_cpBtn setImage:[UIImage imageNamed:@"heyingzhen"] forState:UIControlStateNormal];
        [_cpBtn addTarget:self action:@selector(cpBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cpBtn;
}

-(UILabel *)cpSuccessLab
{
    if (!_cpSuccessLab) {
        _cpSuccessLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _cpSuccessLab.textColor = RGBA(255, 255, 255, 0.49);
        _cpSuccessLab.font = [UIFont systemFontOfSize:13];
        _cpSuccessLab.text = @"复制成功";
    }
    return _cpSuccessLab;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
