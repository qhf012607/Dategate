//
//  MBBaseViewController.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/20.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "RootViewController.h"
#import "MBDeskFile.h"
#import "MBDelegateTabBarController.h"
#import "MBLeftViewController.h"

#define showLeftComplete @"showLeftComplete"
#define hiddenLeftComplete @"hiddenLeftComplete"

NS_ASSUME_NONNULL_BEGIN

@interface MBBaseViewController : RootViewController
@property(nonatomic,assign)float scaleLeft;
@property(nonatomic,strong)id<animateDeskProcol> animator;
@property(nonatomic,strong)MBDelegateTabBarController *tabbar;
@property(nonatomic,strong)MBLeftViewController *leftController;

- (void)showLeft;
- (void)dissMissLeft;
@end

NS_ASSUME_NONNULL_END
