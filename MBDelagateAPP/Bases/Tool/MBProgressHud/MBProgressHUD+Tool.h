//
//  MBProgressHUD+Tool.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/30.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (Tool)

+ (MBProgressHUD*)showDefaultHudtoView:(UIView*)view;


+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD*)showHud:(NSString *)text  view:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
