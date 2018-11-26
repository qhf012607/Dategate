//
//  MBAlertView.m
//  MBDelagateAPP
//
//  Created by inara on 2018/10/30.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBAlertView.h"

@interface MBAlertView()

@property (nonatomic, strong) UIImageView * alertBg;
@property (nonatomic, strong) UILabel * alertMessage;

@end


@implementation MBAlertView

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _alertBg = [[UIImageView alloc] init];
        [self addSubview:_alertBg];
        
        _alertMessage = [[UILabel alloc] init];
        [self addSubview:_alertMessage];
        _alertMessage.numberOfLines = 0;
        _alertMessage.font = [UIFont systemFontOfSize:11];
        
    }
    
    return self;
    
}

-(void)layoutSubviews{
    
    [_alertBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [_alertMessage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(2);
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-5);
        make.bottom.mas_equalTo(self).offset(-2);
    }];
}

-(void)setIsMistake:(NSString *)isMistake{
    
    _alertMessage.text = self.messege;
    _alertBg.image = [isMistake isEqualToString:@"Yes"]?[UIImage imageNamed:@"alertMistakeStyle"]:[UIImage imageNamed:@"alertNomalStyle"];

    _alertMessage.textColor = [isMistake isEqualToString:@"Yes"]?RGB(174, 174, 174):RGB(73, 73, 73);
}

@end
