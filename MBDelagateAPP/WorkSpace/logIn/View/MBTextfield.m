//
//  MBTextfield.m
//  MBDelagateAPP
//
//  Created by inara on 2018/10/23.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBTextfield.h"


@interface MBTextfield()<UITextFieldDelegate>

//图片
@property (nonatomic, strong) UIImageView * textImage;
//线
@property (nonatomic, strong) UIView * lineView;
@end

@implementation MBTextfield

-(instancetype)init{
    
    if (self= [super init]) {
        self.userInteractionEnabled = true;
        _textImage = [[UIImageView alloc] init];
        [self addSubview:_textImage];
        
        
        _lineView = [[UIView alloc] init];
        [self addSubview:_lineView];
        
        _mbTextField = [[UITextField alloc] init];
        [self addSubview:_mbTextField];
    }
    return self;
}


-(void)layoutSubviews{
    __weak MBTextfield * weakself = self;

    [_textImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(18);
        make.left.mas_equalTo(self);
        make.width.height.mas_equalTo(@24);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.textImage.mas_bottom).offset(18);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(@1.5);
    }];
    
    [_mbTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakself.textImage);
        make.left.mas_equalTo(weakself.textImage.mas_right).offset(24);
        make.right.mas_equalTo(self);
        make.height.mas_equalTo(weakself.textImage);
    }];
    
}

-(void)setIsSelect:(NSString *)isSelect{

    _mbTextField.placeholder = self.placeholder;
    [_mbTextField setValue:[UIFont boldSystemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
    if ([isSelect isEqualToString:@"light"]) {
        
        
        
        _textImage.image = [UIImage imageNamed:self.mbSelectTextImage];
        _lineView.backgroundColor = RGB(255, 255, 255);
        [_mbTextField setValue:RGB(218, 218, 218) forKeyPath:@"_placeholderLabel.textColor"];
        
    }else{
        
        _textImage.image = [UIImage imageNamed:self.mbTextImage];
        _lineView.backgroundColor = RGB(174,174,174);
        [_mbTextField setValue:RGB(174,174,174) forKeyPath:@"_placeholderLabel.textColor"];
    }
    
}



@end
