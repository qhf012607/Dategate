//
//  DLMemberCenter.m
//  MBDelagateAPP
//
//  Created by rhonin on 2019/2/2.
//  Copyright © 2019年 rhonin. All rights reserved.
//

#import "DLMemberCenter.h"

@implementation DLMemberCenter
+(instancetype)center
{
    static DLMemberCenter *member = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        member = [[DLMemberCenter alloc] init];
    });
    return member;
}

- (void)setTokenAfterLogin:(NSString * _Nonnull)token{
    _token = token;
}
@end
