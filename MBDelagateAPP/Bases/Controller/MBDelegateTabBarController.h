//
//  PRTabBarController.h
//  Project
//
//  Created by Kamael on 2018/7/16.
//  Copyright © 2018年 Kamael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBDelegateTabBarController : UITabBarController<UITabBarControllerDelegate,UINavigationControllerDelegate>

@property (assign, nonatomic) BOOL rotate;

@property (assign, nonatomic) float effectaAlph;
@end
