//
//  MBUpdateView.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/31.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "MBUpdateView.h"

@interface MBUpdateView ()
@property (nonatomic,strong) UIImageView *mainImgView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIButton *cancelBtn;
@property (nonatomic,strong) UIButton *updateBtn;
@end
@implementation MBUpdateView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(0, 0, 0, 0.70);
        
        [self setupOriginal];
    }
    return self;
}

-(void)setupOriginal
{
    [self addSubview:self.mainImgView];
    [self.mainImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@266);
        make.height.equalTo(@326);
    }];
    
    [self.mainImgView addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-20));
        make.left.equalTo(@24);
        make.width.equalTo(@86);
        make.height.equalTo(@28);
    }];
    
    [self.mainImgView addSubview:self.updateBtn];
    [self.updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-20));
        make.right.equalTo(@(-44));
        make.width.equalTo(@86);
        make.height.equalTo(@28);
    }];
    
    [self.mainImgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cancelBtn.mas_top).offset(-20);
        make.left.equalTo(@0);
        make.right.equalTo(@(-20));
        make.height.equalTo(@1);
    }];
    
    [self.mainImgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineView.mas_top).offset(-26);
        make.left.equalTo(@16);
        make.right.equalTo(@(-36));
        make.height.equalTo(@15);
    }];
}

#pragma mark - event
-(void)updateBtnClicked
{
    self.updateBlock();
}

-(void)cancelBtnClicked
{
    self.cancelBlock();
}

#pragma mark - lazy
-(UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _bgView;
}

-(UIImageView *)mainImgView
{
    if (!_mainImgView) {
        _mainImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _mainImgView.image = [UIImage imageNamed:@"update_bg"];
        _mainImgView.userInteractionEnabled = YES;
    }
    return _mainImgView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.textColor = RGB(0, 0, 0);
        _titleLab.font = FONT(15);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.text = @"发现新版本V1.1可以下载啦！";
    }
    return _titleLab;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = RGB(66, 66, 66);
    }
    return _lineView;
}

-(UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_cancelBtn setImage:[UIImage imageNamed:@"update_cancel"] forState:UIControlStateNormal];
        [_cancelBtn setImage:[UIImage imageNamed:@"update_cancel_high"] forState:UIControlStateSelected];
        [_cancelBtn addTarget:self action:@selector(cancelBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

-(UIButton *)updateBtn
{
    if (!_updateBtn) {
        _updateBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_updateBtn setImage:[UIImage imageNamed:@"update_update"] forState:UIControlStateNormal];
        [_updateBtn setImage:[UIImage imageNamed:@"update_update_high"] forState:UIControlStateSelected];
        [_updateBtn addTarget:self action:@selector(updateBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _updateBtn;
}

@end
