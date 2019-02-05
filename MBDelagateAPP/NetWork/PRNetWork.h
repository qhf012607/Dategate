//
//  DHNetWork.h
//  MXProject
//
//  Created by Kamael on 2018/7/7.
//  Copyright © 2018年 olin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACRequest.h"

@interface PRNetWork : NSObject



/**
 登录接口

 @param dict
 @return token
 */
+ (RACSignal *)loginWith:(NSDictionary *)dict ;




/**
 获取用户信息接口

 @param
 @return dic
 */
+ (RACSignal *)getUserInfo;

/**
 获取错误提示
 
 @param code 错误码
 @return 错误提示
 */
+(NSString*)getErrorString:(NSInteger)code;

@end
