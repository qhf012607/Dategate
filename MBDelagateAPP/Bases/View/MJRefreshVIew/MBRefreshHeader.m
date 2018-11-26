//
//  MBRefreshHeader.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/16.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBRefreshHeader.h"
//
//  MJDIYHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/13.
//  Copyright © 2015年 小码哥. All rights reserved.
//


@interface MBRefreshHeader()

@property (weak, nonatomic) MBImageView *logo;
@end

@implementation MBRefreshHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    

    

    
    // logo
    MBImageView *logo = [[MBImageView alloc] init];
    [logo loadGif:@"MBheadrefresh"];
  //  logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
    
    // loading

}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
   
    
    self.logo.bounds = CGRectMake(0, 0, 30, 30);
    self.logo.center = CGPointMake(self.mj_w * 0.5, self.logo.mj_h*0.6);
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
         
            break;
        case MJRefreshStatePulling:
           
            break;
        case MJRefreshStateRefreshing:
           
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
//    // 1.0 0.5 0.0
//    // 0.5 0.0 0.5
//    CGFloat red = 1.0 - pullingPercent * 0.5;
//    CGFloat green = 0.5 - 0.5 * pullingPercent;
//    CGFloat blue = 0.5 * pullingPercent;
//    self.label.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end

