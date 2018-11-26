
//
//  GestureScrollView.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/12.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "GestureScrollView.h"

@implementation GestureScrollView

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UITableViewWrapperView")]) {
//        return YES;
//    }
//    NSLog(@"_____%@______other:%@",gestureRecognizer,otherGestureRecognizer);
//    return NO;
//}
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.childView&&[self pointInside:point withEvent:event]) {
        return self.childView;
    }else{
        return [super hitTest:point withEvent:event];
    }
    
}
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer

@end
