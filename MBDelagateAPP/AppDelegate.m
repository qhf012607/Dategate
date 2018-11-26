//
//  AppDelegate.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/19.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "AppDelegate.h"
#import "MBLeftViewController.h"
#import "MBDelegateTabBarController.h"
#import "./Clock/HomeViewController.h"
#import "./Clock/public/UNNotificationsManager/UNNotificationsManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//     MBBaseViewController *cont = [[MBBaseViewController alloc]init];
//    cont.hiddenNav = true;
//    MBNavigationController *nave = [[MBNavigationController alloc]initWithRootViewController:cont];
//
//    self.baseController = cont;
    if (@available(iOS 10.0, *)) {
        [UNNotificationsManager registerLocalNotification];
    } else {
        // Fallback on earlier versions
    }
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *vc = [mainStoryboard instantiateInitialViewController];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [[NSNotificationCenter defaultCenter]postNotificationName:APPBecomeInactive object:nil];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     [[NSNotificationCenter defaultCenter]postNotificationName:APPBecomeBackground object:nil];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
   
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
      [[NSNotificationCenter defaultCenter]postNotificationName:APPBecomeActive object:nil];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
