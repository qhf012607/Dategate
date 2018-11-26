//
//  GestureScrollView.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/12.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureScrollView : UIScrollView<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIView *childView;
@end

