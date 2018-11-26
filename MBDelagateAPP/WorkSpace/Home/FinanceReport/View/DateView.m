//
//  DateView.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/23.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "DateView.h"

@interface DateView ()
@property (nonatomic,strong) UIButton *dateBtn;
@end
@implementation DateView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(88, 87, 88);
        self.layer.borderColor = RGB(61, 61, 62).CGColor;
        self.layer.borderWidth = 1.0f;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 3.0f;
        //
        [self setupOriginal];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame titleType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(88, 87, 88);
        self.layer.borderColor = RGB(61, 61, 62).CGColor;
        self.layer.borderWidth = 1.0f;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 3.0f;
        _dateTitleType = type;
        //
        [self setupOriginal];
    }
    return self;
}

-(void)setupOriginal
{
    [self addSubview:self.dateBtn];
    [self.dateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.right.equalTo(@0);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [self addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(self.dateBtn.mas_left).offset(0);
        make.height.equalTo(@40);
    }];
}

#pragma mark - event
-(void)dateBtnClicked
{
    self.dateBlock();
}

#pragma mark - lazy
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

-(UILabel *)dateLab
{
    if (!_dateLab) {
        _dateLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _dateLab.textColor = RGB(255, 255, 255);
        _dateLab.font = FONT(14);
        _dateLab.textAlignment = NSTextAlignmentCenter;
        switch (_dateTitleType) {
            case DateTitleTypeMonthAndYear:
                _dateLab.text = @"08/2018";
                break;
            case DateTitleTypeDayMonthAndYear:
                _dateLab.text = @"24/08/2018";
                break;
            default:
                break;
        }
    }
    return _dateLab;
}

@end
