//
//  MBTextfield.h
//  MBDelagateAPP
//
//  Created by inara on 2018/10/23.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBTextfield : UIView

@property (nonatomic, copy)NSString * mbTextImage;
@property (nonatomic, copy)NSString * mbSelectTextImage;
@property (nonatomic, copy)NSString * placeholder;
@property (nonatomic, copy)NSString * mbText;
@property (nonatomic, copy)NSString * isSelect;
//输入框
@property (nonatomic, strong) UITextField * mbTextField;
////图片
//@property (nonatomic, strong) UIImageView * textImage;
////线
//@property (nonatomic, strong) UIView * lineView;


-(void)setIsSelect:(NSString *)isSelect;
@end
