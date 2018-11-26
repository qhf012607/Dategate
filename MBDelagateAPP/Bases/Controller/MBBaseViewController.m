//
//  MBBaseViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/20.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBBaseViewController.h"

#import "MBDeskAnimator.h"
@interface MBBaseViewController ()

@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIView *mainView;
@property(nonatomic,assign)CGFloat originX;
@property(nonatomic,strong)UIView *coverblurView;
@property(nonatomic,strong)UIVisualEffectView *blurEffect;

@property (assign, nonatomic) float effectaAlph;
@end


@implementation MBBaseViewController
- (instancetype)init{
    if (self = [super init]) {
        self.scaleLeft = 0.8;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self addChildViewController:self.leftController];
    [self addChildViewController:self.tabbar];
    self.originX = -SCREEN_WIDTH*self.scaleLeft;
    self.leftController.view.frame = CGRectMake( self.originX, 0, SCREEN_WIDTH*self.scaleLeft, SCREEN_HEIGHT);
    self.tabbar.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.leftController.view];
     self.leftView = self.leftController.view ;
    [self.view addSubview:self.tabbar.view];
    self.mainView = self.tabbar.view  ;
    [self addblur];
   // [self performSelector:@selector(showLeft) withObject:nil afterDelay:1];
   // [self setc]
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(blur) name:APPBecomeInactive object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(blur) name:APPBecomeInactive object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hidBlur) name:APPBecomeActive object:nil];
}

- (void)addblur{
    UIBlurEffect *blurEffectTem = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    //  毛玻璃视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffectTem];
    
    //添加到要有毛玻璃特效的控件中
    effectView.frame = self.view.bounds;
    [GGappDelegate.window addSubview:effectView];
    self.blurEffect = effectView;
    self.effectaAlph = 0.0;
    //    //设置模糊透明度
    //    effectView.alpha = self.effectaAlph;
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
   
}

- (void)blur{
   
    [UIView animateWithDuration:0.5 animations:^{
        self.effectaAlph = 0.7;
    }];
}

- (void)hidBlur{
    [UIView animateWithDuration:0.5 animations:^{
        self.effectaAlph = 0.0;
    }completion:^(BOOL finished) {
     //   [self.coverblurView removeFromSuperview];
    }];
}

- (void)showLeft{
   // if (self.leftView.frame.origin.x<= self.originX) {
        [self.animator animateLeft:self.leftView main:self.mainView complete:^{
            [[NSNotificationCenter defaultCenter]postNotificationName:showLeftComplete object:nil];
        }];
  //  }
}

- (void)dissMissLeft{
    if (self.leftView.frame.origin.x>=0) {
        [self.animator dismissLeft:self.leftView main:self.mainView complete:^{
            [[NSNotificationCenter defaultCenter]postNotificationName:hiddenLeftComplete object:nil];
        }];
    }
}

- (MBLeftViewController*)leftController{
    if (!_leftController) {
        _leftController = [[MBLeftViewController alloc]init];
    }
    return _leftController;
}

- (MBDelegateTabBarController*)tabbar{
    if (!_tabbar) {
        _tabbar = [[MBDelegateTabBarController alloc]init];
    }
    return _tabbar;
}
- (id)animator{
    if (!_animator) {
        _animator = [[MBDeskAnimator alloc]init];
    }
    return _animator;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setEffectaAlph:(float)effectaAlph{
    if (effectaAlph>1.0) {
        _effectaAlph = 1.0;
    }else if (effectaAlph<0){
        _effectaAlph = 0.0;
    }else{
        _effectaAlph = effectaAlph;
    }
    _blurEffect.alpha = _effectaAlph;
}

@end
