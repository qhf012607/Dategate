//
//  NSObject+Addtion.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/2.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Addtion)
+(void)pushController:(RootViewController*)cont;

+(BOOL)checkPassWorkForClockFunc:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
