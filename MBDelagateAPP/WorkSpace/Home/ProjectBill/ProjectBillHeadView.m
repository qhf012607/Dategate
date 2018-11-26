//
//  ProjectBillHeadView.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/22.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "ProjectBillHeadView.h"

@interface ProjectBillHeadView ()
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIView *dateBgView;
@property (nonatomic,strong) UIButton *dateBtn;
@property (nonatomic,strong) UIButton *searchBtn;
@end
@implementation ProjectBillHeadView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupOriginal];
    }
    return self;
}

-(void)setupOriginal
{
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(@33);
        make.height.equalTo(@13);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.titleLab.mas_right).offset(10);
        make.width.equalTo(@16);
        make.height.equalTo(@1);
    }];
    
    [self addSubview:self.searchBtn];
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(@(-33));
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [self addSubview:self.dateBgView];
    [self.dateBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.bottom.equalTo(@(-16));
        make.left.equalTo(self.lineView.mas_right).offset(10);
        make.right.equalTo(self.searchBtn.mas_left).offset(-20);
    }];
    
    [self.dateBgView addSubview:self.dateBtn];
    [self.dateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.right.equalTo(@0);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [self.dateBgView addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(self.dateBtn.mas_left).offset(0);
        make.bottom.equalTo(@0);
    }];
}

#pragma mark - event
-(void)dateBtnClicked
{
    self.dateBtnBlock();
}

-(void)searchBtnClicked
{
    self.searchBtnBlock();
}

#pragma mark - lazy
-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.textColor = RGBA(255, 255, 255, 0.49);
        _titleLab.font = FONT(13);
        _titleLab.text = @"选择日期";
    }
    return _titleLab;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = RGB(182, 182, 182);
    }
    return _lineView;
}

-(UIView *)dateBgView
{
    if (!_dateBgView) {
        _dateBgView = [[UIView alloc]initWithFrame:CGRectZero];
        _dateBgView.backgroundColor = RGB(88, 87, 88);
        _dateBgView.layer.borderColor = RGB(61, 61, 62).CGColor;
        _dateBgView.layer.borderWidth = 1.0f;
        _dateBgView.clipsToBounds = YES;
        _dateBgView.layer.cornerRadius = 3.0f;
    }
    return _dateBgView;
}

-(UILabel *)dateLab
{
    if (!_dateLab) {
        _dateLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _dateLab.textColor = RGB(255, 255, 255);
        _dateLab.font = FONT(14);
        _dateLab.text = @"08/2018";
        _dateLab.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLab;
}

-(UIButton *)dateBtn
{
    if (!_dateBtn) {
        _dateBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_dateBtn setImage:[UIImage imageNamed:@"icon-clendar"] forState:UIControlStateNormal];
        _dateBtn.backgroundColor = RGB(72, 71, 72);
        [_dateBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        [_dateBtn addTarget:self action:@selector(dateBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dateBtn;
}

-(UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_searchBtn setImage:[UIImage imageNamed:@"serchGif@x"] forState:UIControlStateNormal];
        [_searchBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5.7, 5, 5.7)];
        [_searchBtn addTarget:self action:@selector(searchBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}

@end
