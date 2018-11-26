//
//  MemberCenterTableViewCell.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/22.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MemberCenterTableViewCell.h"
@interface MemberCenterTableViewCell()
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *moneyIn;
@property(nonatomic,strong)UILabel *moneyOut;
@property(nonatomic,strong)UILabel *registDate;
@property(nonatomic,strong)UILabel *winOrDefeat;

@end

@implementation MemberCenterTableViewCell
CGFloat itemWidth = 100;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUi];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)initUi{
    [self.contentView addSubview:self.scroll];
    [self.contentView addSubview:self.name];
    [self.scroll addSubview:self.moneyIn];
    [self.scroll addSubview:self.moneyOut];
    [self.scroll addSubview:self.registDate];
    [self.scroll addSubview:self.winOrDefeat];
    self.scroll.contentSize = CGSizeMake(itemWidth*4, 0);
    
    [self addmas];

}

- (void)updateMas{
    [self.moneyIn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0);
    }];
}

- (void)addmas{
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
    }];
    [self.scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.name.mas_right);
        make.top.bottom.right.mas_equalTo(0);
    }];
    [self.moneyIn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
        make.height.mas_equalTo(self.name.mas_height);
    }];
    [self.moneyOut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.moneyIn.mas_right);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
        make.height.mas_equalTo(self.name.mas_height);
    }];
    [self.registDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.moneyOut.mas_right);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
        make.height.mas_equalTo(self.name.mas_height);
    }];
    [self.winOrDefeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.registDate.mas_right);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
        make.height.mas_equalTo(self.name.mas_height);
    }];
}


- (void)configCell:(MemberCenterModel*)model{
    self.name.text = model.name;
    self.winOrDefeat.text = model.winDefalut;
    self.moneyIn.text = model.inmoney;
    self.moneyOut.text = model.outmoney;
    self.registDate.text = model.time;
}

- (UILabel*)name{
    if (!_name) {
        _name = [UILabel createLableframe:CGRectZero font:14 textAgment:NSTextAlignmentCenter textColor:[UIColor whiteColor]];
    }
    return _name;
}

- (UIScrollView*)scroll{
    if (!_scroll) {
        _scroll = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _scroll.showsHorizontalScrollIndicator = false;
    }
    return _scroll;
}
- (UILabel*)moneyIn{
    if (!_moneyIn) {
        _moneyIn = [UILabel createLableframe:CGRectZero font:14 textAgment:NSTextAlignmentCenter textColor:UIColorHex(0x8c8b8b)];
    }
    return _moneyIn;
}

- (UILabel*)moneyOut{
    if (!_moneyOut) {
        _moneyOut = [UILabel createLableframe:CGRectZero font:14 textAgment:NSTextAlignmentCenter textColor:UIColorHex(0x8c8b8b)];
    }
    return _moneyOut;
}

- (UILabel*)registDate{
    if (!_registDate) {
        _registDate = [UILabel createLableframe:CGRectZero font:14 textAgment:NSTextAlignmentCenter textColor:UIColorHex(0x8c8b8b)];
    }
    return _registDate;
}

- (UILabel*)winOrDefeat{
    if (!_winOrDefeat) {
        _winOrDefeat = [UILabel createLableframe:CGRectZero font:14 textAgment:NSTextAlignmentCenter textColor:UIColorHex(0x8c8b8b)];
    }
    return _winOrDefeat;
}
@end
