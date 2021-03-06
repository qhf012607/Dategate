//
//  MBProgressHUD+Tool.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/30.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBProgressHUD+Tool.h"

@implementation MBProgressHUD (Tool)
+ (MBProgressHUD*)showMessage:(NSString *)message  toView:(UIView *)view
{
    if (view == nil){
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    //hud.bezelView.style = MBProgressHUDBackgroundStyleSolidCo;
    hud.userInteractionEnabled= NO;
    // 再设置模式
    hud.mode = MBProgressHUDModeText;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:true afterDelay:1];
    return hud;
}

+ (MBProgressHUD*)showDefaultHudtoView:(UIView*)view{
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 再设置模式
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

+ (MBProgressHUD*)showHud:(NSString *)text  view:(UIView *)view
{
    if (view == nil)
        view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (text.length > 0) {
        hud.labelText = text;
    }else{
        hud.labelText = @"";
    }
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    return hud;
}

+ (void)hideHUDForView:(UIView *)view{
    [self hideHUDForView:view animated:true];
}
@end
