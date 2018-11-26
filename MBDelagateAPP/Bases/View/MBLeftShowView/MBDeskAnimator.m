//
//  MBDeskAnimator.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/20.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBDeskAnimator.h"

@implementation MBDeskAnimator
- (void)animateLeft:(UIView *)leftView main:(UIView *)mainView complete:(nonnull void (^)(void))callback{
    [UIView animateWithDuration:0.3 animations:^{
        leftView.frame = CGRectMake(0, 0, leftView.frame.size.width, leftView.frame.size.height);
        mainView.frame = CGRectMake(leftView.frame.origin.x+leftView.frame.size.width, 0, mainView.frame.size.width, mainView.frame.size.height);
        GGappDelegate.baseController.tabbar.effectaAlph = 0.5;
    }completion:^(BOOL finished) {
        if (callback) {
            callback();
        }
    }];
}

- (void)dismissLeft:(UIView *)leftView main:(UIView *)mainView complete:(nonnull void (^)(void))callback{
    [UIView animateWithDuration:0.3 animations:^{
        leftView.frame = CGRectMake(-leftView.frame.size.width, 0, leftView.frame.size.width, leftView.frame.size.height);
         mainView.frame = CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height);
        GGappDelegate.baseController.tabbar.effectaAlph = 0.0;
    }completion:^(BOOL finished) {
        if (callback) {
            callback();
        }
    }];
}
@end
