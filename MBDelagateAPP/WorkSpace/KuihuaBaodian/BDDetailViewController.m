//
//  BDDetailViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/26.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "BDDetailViewController.h"

@interface BDDetailViewController ()
@property(nonatomic,strong)MBImageView *imageBg;

@property (strong,nonatomic) UIImage *imageCapture;

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *middleLab;
@property (nonatomic,strong) UILabel *contentLab;
@property (nonatomic,strong) UIImageView *scrollBgImg;
@property (nonatomic,strong) UIImageView *headImgView;
@property (nonatomic,strong) UIButton *shareBtn;
@end

@implementation BDDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"合营宝典";
//    [self ui];
    
    [self setupUI];
}

-(void)setupUI
{
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.scrollBgImg];
    [self.scrollBgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.equalTo(@(SCREEN_HEIGHT));
    }];
    
    [self.scrollBgImg addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@200);
    }];
    
    [self.scrollView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_bottom).offset(20);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@16);
    }];
    
    [self.scrollView addSubview:self.middleLab];
    [self.middleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@15);
    }];
    
    [self.scrollView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleLab.mas_bottom).offset(20);
        make.left.equalTo(@33);
        make.width.mas_equalTo(SCREEN_WIDTH-66);
    }];
    
    [self.scrollView addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
        make.top.mas_equalTo(self.contentLab.mas_bottom).offset(50);
    }];
    
    [self ui];
}

- (void)ui{
    self.titleLab.text = @"推荐盘口：苏格兰-0.5";
    self.middleLab.text  = @"水位：0.86 香港盘";
    self.contentLab.text = @"推荐理由：\n1、苏格兰世界排名42名，苏格兰上一场友谊赛被比利时打的信心崩溃，防线暴露出了很大问题。\n2、阿尔巴尼亚世界排名58名，上一场1：0击败以色列，取得了很好的开局\n3、双方并未有交手记录。按照实力还是苏格兰稍微强些。推荐理由：\n1、苏格兰世界排名42名，苏格兰上一场友谊赛被比利时打的信心崩溃，防线暴露出了很大问题。\n2、阿尔巴尼亚世界排名58名，上一场1：0击败以色列，取得了很好的开局\n3、双方并未有交手记录。按照实力还是苏格兰稍微强些。推荐理由：\n1、苏格兰世界排名42名，苏格兰上一场友谊赛被比利时打的信心崩溃，防线暴露出了很大问题。\n2、阿尔巴尼亚世界排名58名，上一场1：0击败以色列，取得了很好的开局\n3、双方并未有交手记录。按照实力还是苏格兰稍微强些。推荐理由：\n1、苏格兰世界排名42名，苏格兰上一场友谊赛被比利时打的信心崩溃，防线暴露出了很大问题。\n2、阿尔巴尼亚世界排名58名，上一场1：0击败以色列，取得了很好的开局\n3、双方并未有交手记录。按照实力还是苏格兰稍微强些。推荐理由：\n1、苏格兰世界排名42名，苏格兰上一场友谊赛被比利时打的信心崩溃，防线暴露出了很大问题。\n2、阿尔巴尼亚世界排名58名，上一场1：0击败以色列，取得了很好的开局\n3、双方并未有交手记录。按照实力还是苏格兰稍微强些。推荐理由：\n1、苏格兰世界排名42名，苏格兰上一场友谊赛被比利时打的信心崩溃，防线暴露出了很大问题\n2、阿尔巴尼亚世界排名58名，上一场1：0击败以色列，取得了很好的开局\n3、双方并未有交手记录。按照实力还是苏格兰稍微强些。";
    
    
    WEAKSELF
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       weakSelf.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.shareBtn.bottom+50);
        [weakSelf.scrollBgImg mas_updateConstraints:^(MASConstraintMaker *make) {
              make.height.equalTo(@(weakSelf.scrollView.contentSize.height));
        }];
    });
   // [self performSelector:@selector(showShare:) withObject:nil afterDelay:2];
  
}

- (IBAction)showShare:(UIButton*)sender{
//    self.imageCapture = [self renderScrollViewToImage];
//    NSString *shareText = @"自定义标题";
//    NSArray *activityItems = @[shareText,self.imageCapture];
//
//    // 自定义的CustomActivity，继承自UIActivity
//   UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
//    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
//        if (completed) {
//            [MBProgressHUD showMessage:@"分享成功" toView:self.view];
//        }else{
//            [MBProgressHUD showMessage:@"分享失败" toView:self.view];
//        }
//    };
//
//  [self presentViewController:activityVC animated:YES completion:nil];
    
    [self setupOriginal];
}

#pragma mark - lazy
-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollView.backgroundColor = [UIColor orangeColor];
    }
    return _scrollView;
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.textColor = RGB(255, 255, 255);
        _titleLab.font = FONT(16);
    }
    return _titleLab;
}

-(UILabel *)middleLab
{
    if (!_middleLab) {
        _middleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _middleLab.textColor = RGB(255, 255, 255);
        _middleLab.font = FONT(15);
    }
    return _middleLab;
}

-(UILabel *)contentLab
{
    if (!_contentLab) {
        _contentLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLab.textColor = RGB(255, 255, 255);
        _contentLab.font = FONT(14);
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

-(UIImageView *)scrollBgImg
{
    if (!_scrollBgImg) {
        _scrollBgImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        _scrollBgImg.image = [UIImage imageNamed:@"bg"];
        _scrollBgImg.userInteractionEnabled = YES;
    }
    return _scrollBgImg;
}

-(UIImageView *)headImgView
{
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _headImgView.image = [UIImage imageNamed:@"head"];
    }
    return _headImgView;
}

-(UIButton *)shareBtn
{
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_shareBtn setTitle:@"share" forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(setupOriginal) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

#pragma mark -
-(UIImage *)captureScreenScrollView:(UIScrollView *)scrollView {
    CGPoint savedContentOffset = scrollView.contentOffset;
    CGRect savedFrame = scrollView.frame;
    scrollView.contentOffset = CGPointZero;
    scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
    
   UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, NO, 0.0);
 //   UIGraphicsBeginImageContext(scrollView.bounds.size);
    //2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //3.截屏
    [scrollView.layer renderInContext:ctx];
    //4、获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.转化成为Data
    //compressionQuality:表示压缩比 0 - 1的取值范围
   // NSData *data = UIImageJPEGRepresentation(newImage, 1);
    //6、关闭上下文
    scrollView.contentOffset = savedContentOffset;
    scrollView.frame = savedFrame;
    UIGraphicsEndImageContext();
   
    
    return newImage;
}




-(void)setupOriginal
{
    UIImage* image = nil;
    
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，调整清晰度。
    UIGraphicsBeginImageContextWithOptions(self.scrollView.contentSize, YES, [UIScreen mainScreen].scale);
    
    CGPoint savedContentOffset = self.scrollView.contentOffset;
    CGRect savedFrame = self.scrollView.frame;
    self.scrollView.contentOffset = CGPointZero;
    self.scrollView.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
    [self.scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    self.scrollView.contentOffset = savedContentOffset;
    self.scrollView.frame = savedFrame;
    
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        //保存图片到相册
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }
}

//指定回调方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo

{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功，可到相册查看" ;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"信息提示"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end
