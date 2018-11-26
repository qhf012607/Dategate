//
//  MBDeskFile.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/20.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol animateDeskProcol <NSObject>

-(void)animateLeft:(UIView*)leftView main:(UIView*)mainView complete:(void(^)(void))callback;

- (void)dismissLeft:(UIView*)leftView main:(UIView*)mainView complete:(void(^)(void))callback;
@end
@interface MBDeskFile : NSObject

@end

NS_ASSUME_NONNULL_END
