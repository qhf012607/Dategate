//
//  DLMemberCenter.h
//  MBDelagateAPP
//
//  Created by rhonin on 2019/2/2.
//  Copyright © 2019年 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLMemberCenter : NSObject
+(instancetype)center;

@property(nonatomic,copy,readonly)NSString *token;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *passWord;

- (void)setTokenAfterLogin:(NSString * _Nonnull)token;
@end

NS_ASSUME_NONNULL_END
