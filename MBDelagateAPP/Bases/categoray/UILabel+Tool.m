//
//  UILabel+Tool.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/22.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "UILabel+Tool.h"

@implementation UILabel (Tool)
+(UILabel*)createLableframe:(CGRect)rect font:(NSInteger)font textAgment:(NSTextAlignment)alignment textColor:(UIColor*)textColor{
    UILabel * lab = [[UILabel alloc]initWithFrame:rect];
    lab.textColor = textColor;
    lab.font = [UIFont systemFontOfSize:font];
    lab.textAlignment = alignment;
    return lab;
}
@end
