//
//  DHNetWork.m
//  MXProject
//
//  Created by Kamael on 2018/7/7.
//  Copyright © 2018年 olin. All rights reserved.
//

#import "PRNetWork.h"

@implementation PRNetWork

/** 登录 */
+ (RACSignal *)loginWith:(NSDictionary *)dict{
    NSString *url = @"/agent2/api/auth/login";
    return   [[RACRequest postDataWithUrl:url dic:dict] map:^id(id value) {
        NSDictionary *dic = value;
        NSString *access_token = dic[@"access_token"];
        NSString *token_type = dic[@"token_type"];
        NSString *token = [NSString stringWithFormat:@"%@ %@",token_type,access_token];
        [[DLMemberCenter center]setTokenAfterLogin:token];
        return value;
    }] ;
}



+(NSString*)getErrorString:(NSInteger)code{
    NSDictionary *dic = @{@"1001":@"系统错误，请重试",@"3000":@"日期范围错误，请查询三个月内记录",@"3001":@"日期不能为空",@"3002":@"日期格式错误",@"3003":@"数字显示格式错误",@"3004":@"旧密码错误",@"3006":@"登录失败",@"3007":@"已读失败",@"3008":@"删除失败",@"4000":@"不被授权",@"9000":@"未知错误",@"888":@"网络异常",@"999":@"服务器异常"};
    NSString *codestring = [NSString stringWithFormat:@"%ld",(long)code];
    NSString *errorString = [dic valueForKey:codestring];
    return errorString;
}
@end

