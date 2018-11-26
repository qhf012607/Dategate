//
//  AppDelegate.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/19.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBBaseViewController.h"
#import "MBNavigationController.h"
#define CheckPassWorkForClock @"CheckPassWorkForClock"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) id user;
@property (strong, nonatomic) MBBaseViewController *baseController;
@property (strong, nonatomic) MBNavigationController *rootNave ;
@end



#define APPBecomeInactive @"APPBecomeInactive"

#define APPBecomeBackground @"APPBecomeBackgroud"

#define APPBecomeActive @"APPBecomeActive"
//#define <#macro#>
