//
//  UILabel+Tool.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/22.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Tool)
+(UILabel*)createLableframe:(CGRect)rect font:(NSInteger)font textAgment:(NSTextAlignment)alignment textColor:(UIColor*)textColor;
@end

NS_ASSUME_NONNULL_END
