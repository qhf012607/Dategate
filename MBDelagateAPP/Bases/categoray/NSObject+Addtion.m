//
//  NSObject+Addtion.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/2.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "NSObject+Addtion.h"

@implementation NSObject (Addtion)
+(void)pushController:(RootViewController*)cont{
    [GGappDelegate.rootNave pushViewController:cont animated:true ];
}

+ (BOOL)checkPassWorkForClockFunc:(NSDictionary *)dic{
    return true;
}
@end
