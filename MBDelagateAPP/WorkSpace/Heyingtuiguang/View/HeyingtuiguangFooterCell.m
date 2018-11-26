//
//  HeyingtuiguangFooterCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/17.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "HeyingtuiguangFooterCell.h"

@interface HeyingtuiguangFooterCell ()
@property (nonatomic,strong) UIImageView *codeImgView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIView *horizontalLineView;
@property (nonatomic,strong) UIView *verticalLineView;
@end
@implementation HeyingtuiguangFooterCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self setupOriginal];
    }
    return self;
}

-(void)setupOriginal
{
    [self addSubview:self.codeImgView];
    [self.codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.centerX.equalTo(self);
        make.width.equalTo(@77);
        make.height.equalTo(@77);
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeImgView.mas_bottom).offset(8);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@11);
    }];
    
    [self addSubview:self.horizontalLineView];
    [self.horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@(-33));
        make.right.equalTo(@(-1));
        make.width.equalTo(@1);
    }];
    
    [self addSubview:self.verticalLineView];
    [self.verticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@(-33));
        make.bottom.equalTo(@(-1));
        make.height.equalTo(@1);
    }];
}

-(void)tuiguangCellWithDictionary:(NSDictionary *)dict indexPath:(NSIndexPath *)indexPath
{
    _codeImgView.image = [UIImage imageNamed:@"heyingscanning"];
    
    _titleLab.text = dict[@"title"];
    
    if (indexPath.row == 0) {
        _horizontalLineView.hidden = NO;
        _verticalLineView.hidden = NO;
    }else if (indexPath.row == 1){
        _horizontalLineView.hidden = YES;
        _verticalLineView.hidden = NO;
        [_verticalLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(33));
            make.right.equalTo(@0);
            make.bottom.equalTo(@(-1));
            make.height.equalTo(@1);
        }];
    }else if (indexPath.row == 2){
        _horizontalLineView.hidden = NO;
        _verticalLineView.hidden = YES;
        [_horizontalLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(33));
            make.bottom.equalTo(@0);
            make.right.equalTo(@(-1));
            make.width.equalTo(@1);
        }];
    }else if (indexPath.row == 3){
        _horizontalLineView.hidden = YES;
        _verticalLineView.hidden = YES;
    }
}

#pragma mark - lazy
-(UIImageView *)codeImgView
{
    if (_codeImgView == nil) {
        _codeImgView = [[UIImageView alloc]init];
        _codeImgView.userInteractionEnabled = YES;
    }
    return _codeImgView;
}

-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = RGB(255, 255, 255);
        _titleLab.font = [UIFont systemFontOfSize:11];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

-(UIView *)horizontalLineView
{
    if (!_horizontalLineView) {
        _horizontalLineView = [[UIView alloc]initWithFrame:CGRectZero];
        _horizontalLineView.backgroundColor = RGBA(255, 255, 255, 0.04);
    }
    return _horizontalLineView;
}

-(UIView *)verticalLineView
{
    if (!_verticalLineView) {
        _verticalLineView = [[UIView alloc]initWithFrame:CGRectZero];
        _verticalLineView.backgroundColor = RGBA(255, 255, 255, 0.04);
    }
    return _verticalLineView;
}


@end
