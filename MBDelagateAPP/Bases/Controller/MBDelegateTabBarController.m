//
//  PRTabBarController.m
//  Project
//
//  Created by Kamael on 2018/7/16.
//  Copyright © 2018年 Kamael. All rights reserved.
//

#import "MBDelegateTabBarController.h"
#import "ViewController.h"
#import "MYHomeViewController.h"
#import "AppDelegate.h"
@interface MBDelegateTabBarController ()
@property(nonatomic,strong)UISwipeGestureRecognizer *swipRight;
@property(nonatomic,strong)UIVisualEffectView *blurEffect;

@end

@implementation MBDelegateTabBarController
- (instancetype)init{
    if (self=[super init]) {
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor redColor];
    self.tabBar.hidden = YES;
   // [self createViewControllers];
  //  [self setTabbarImage];

//    self.delegate = self;
//    for(UINavigationController *nav in self.viewControllers){
//        nav.delegate = self;
//    }
      MYHomeViewController *recommand = [[MYHomeViewController alloc]init];
    self.viewControllers = @[recommand];
    [self setDefaut];
}

- (void)setDefaut{
     [self swipRight];
    [self addblur];
    
}

- (void)addblur{
    UIBlurEffect *blurEffectTem = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    //  毛玻璃视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffectTem];
    
    //添加到要有毛玻璃特效的控件中
    effectView.frame = self.view.bounds;
    [self.view addSubview:effectView];
    self.blurEffect = effectView;
    self.effectaAlph = 0.0;
//    //设置模糊透明度
//    effectView.alpha = self.effectaAlph;
    
}

/**
 *  纯代码设置ViewControllers
 */
- (void)createViewControllers{
    NSMutableArray *viewControllers = [NSMutableArray new];
  
    ViewController *vc = [[ViewController alloc]init];
    //        int x = arc4random() % 255;
    //        vc.view.backgroundColor = RGB(x, x, x);
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [viewControllers addObject:nav];
    
  
    MYHomeViewController *recommand = [[MYHomeViewController alloc]init];
    //        int x = arc4random() % 255;
    //        vc.view.backgroundColor = RGB(x, x, x);
    UINavigationController *navR = [[UINavigationController alloc] initWithRootViewController:recommand];
    [viewControllers addObject:navR];
    
    MYHomeViewController *dataVC = [[MYHomeViewController alloc] init];
    //        int x = arc4random() % 255;
    //        vc.view.backgroundColor = RGB(x, x, x);
    UINavigationController *navh = [[UINavigationController alloc] initWithRootViewController:dataVC];
    [viewControllers addObject:navh];
    
    ViewController *mineVc = [[ViewController alloc] init];
    UINavigationController *navm = [[UINavigationController alloc] initWithRootViewController:mineVc];
    [viewControllers addObject:navm];
    self.viewControllers = viewControllers;
}

/**
 *  设置tabbar图片
 */
- (void)setTabbarImage
{
    NSArray *nomalImages = @[@"com_tab_bar_1_nor",@"com_tab_bar_2_nor",@"com_tab_bar_4_nor",@"com_tab_bar_5_nor"];
    NSArray *highlightImages = @[@"com_tab_bar_1_sel",@"com_tab_bar_2_sel",@"com_tab_bar_4_sel",@"com_tab_bar_5_sel"];
    NSArray *titles = @[@"首页",@"赛程",@"数据",@"我的"];
    
    for(int i=0; i< self.tabBar.items.count; i++){
        UITabBarItem *item = self.tabBar.items[i];
        item.title = titles[i];
        item.image = [[UIImage imageNamed:nomalImages[i]]
                      imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:highlightImages[i]]
                              imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    NSDictionary *nomalDic = @{NSForegroundColorAttributeName:UIColorFromRGB(0x666666)};
    NSDictionary *selectDic = @{NSForegroundColorAttributeName:MAIN_RED_COLOR};
    
    [[UITabBarItem appearance] setTitleTextAttributes:nomalDic forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:selectDic forState:UIControlStateSelected];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if(index==1){
        
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    BOOL hide = NO;
    [navigationController setNavigationBarHidden:hide animated:YES];
}


// 支持设备自动旋转
- (BOOL)shouldAutorotate
{
    return YES;
}

// 支持横竖屏显示
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if(self.rotate){
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [ GGappDelegate.baseController dissMissLeft];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showleftView{
     [ GGappDelegate.baseController showLeft];
}

- (UISwipeGestureRecognizer*)swipRight{
    if (!_swipRight) {
        _swipRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showleftView)];
        [_swipRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [self.view addGestureRecognizer:_swipRight];
    }
    return _swipRight;
    
}

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
