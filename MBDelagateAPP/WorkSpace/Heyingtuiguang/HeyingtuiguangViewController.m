//
//  BaodianViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/1.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "HeyingtuiguangViewController.h"
#import "HeyingtuiguangCell.h"
#import "HeyingtuiguangFooterView.h"
#import <Photos/Photos.h>

@interface HeyingtuiguangViewController ()<UITableViewDelegate,UITableViewDataSource,HeyingtuiguangCellDelegate>
@property (nonatomic,strong) UITableView *tableViewTG;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) MBImageView *imageBg;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) HeyingtuiguangFooterView *footerView;
@property (nonatomic,strong) UIView *showBgView;
@property (nonatomic,strong) UIImageView *codeImgView;
@property (nonatomic,strong) UIImageView *transparentCodeImgView;
@property (nonatomic,strong) MBImageView *gifCodeImgView;
@property (nonatomic,strong) UILabel *codeTitleLab;
@property (nonatomic,strong) UIButton *codeDownloadBtn;
@property (nonatomic,strong) UILabel *codeSaveMsgLab;
@end

@implementation HeyingtuiguangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

-(void)initUI
{
    [self.view addSubview:self.imageBg];
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.imageBg addSubview:self.footerView];
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@280);
    }];
    
    [self.imageBg addSubview:self.tableViewTG];
    [self.tableViewTG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(self.footerView.mas_top).offset(0);
    }];
}

#pragma mark - foot block 回调
-(void)footerItemsDidSelect:(NSInteger)row
{
    [self.view addSubview:self.showBgView];
    self.navigationController.navigationBarHidden = YES;
    [self.showBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.showBgView addSubview:self.codeImgView];
    [self.codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.showBgView);
        make.width.equalTo(@152);
        make.height.equalTo(@152);
    }];
    [self.showBgView addSubview:self.gifCodeImgView];
    [self.gifCodeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.showBgView);
        make.width.equalTo(@278);
        make.height.equalTo(@266);
    }];
    [self.showBgView addSubview:self.transparentCodeImgView];
    [self.transparentCodeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.showBgView);
        make.width.equalTo(@272);
        make.height.equalTo(@272);
    }];
    [self.showBgView addSubview:self.codeTitleLab];
    [self.codeTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.transparentCodeImgView.mas_bottom).offset(40);
        make.centerX.equalTo(self.showBgView);
        make.width.equalTo(@(SCREEN_WIDTH-32));
        make.height.equalTo(@16);
    }];
    [self.showBgView addSubview:self.codeDownloadBtn];
    [self.codeDownloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-10));
        make.centerX.equalTo(self.showBgView);
        make.width.equalTo(@66);
        make.height.equalTo(@66);
    }];
    //放大过程中的动画
    [self shakeToShow:_showBgView];
    //保存图片到相册
//    [self saveImageToLibrary:_showBgView];
}

-(void)closeView
{
    [_showBgView removeFromSuperview];
    self.navigationController.navigationBarHidden = NO;
}

/**
 * 放大过程中出现的缓慢动画
 */
- (void)shakeToShow:(UIView *)aView
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.3;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

/**
 * 保存图片到相册
 */
- (void)saveImageToLibrary:(UIView *)view
{
    CGSize s = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(img,self,nil,nil);
}

#pragma mark - HeyingtuiguangCellDelegate
-(void)copySuccess:(NSDictionary *)dict
{
    [self copyUrl:dict[@"url"]];
    //
    for (int i =0; i<self.dataArray.count; i++) {
       NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:self.dataArray[i]];
        if ([dic[@"title"] isEqualToString:dict[@"title"]]) {
            dic[@"isCopy"] = @"1";
            [self.dataArray replaceObjectAtIndex:i withObject:dic];
        }else{
            dic[@"isCopy"] = @"0";
            [self.dataArray replaceObjectAtIndex:i withObject:dic];
        }
    }
    [self.tableViewTG reloadData];
}

/**
 * 复制链接
 */
- (void)copyUrl:(NSString *)url
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = url;
    NSLog(@"url:%@",pasteboard.string);
}

#pragma mark - UITableViewDelegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeyingtuiguangCell *cell = [HeyingtuiguangCell cellWithTableView:tableView];
    [cell baodianWithDictionary:self.dataArray[indexPath.row]];
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}

#pragma mark - event
-(void)codeDownloadBtnClicked
{
    [self.showBgView addSubview:self.codeSaveMsgLab];
    [self.codeSaveMsgLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeTitleLab.mas_bottom).offset(20);
        make.centerX.equalTo(self.showBgView);
        make.width.equalTo(@(SCREEN_WIDTH-32));
        make.height.equalTo(@13);
    }];
}

#pragma mark - lazy
-(UITableView *)tableViewTG
{
    if (!_tableViewTG) {
        _tableViewTG = [[UITableView alloc]initWithFrame:CGRectZero];
        _tableViewTG.delegate = self;
        _tableViewTG.dataSource = self;
        _tableViewTG.tableHeaderView = self.headView;
        _tableViewTG.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableViewTG.tableFooterView = [[UIView alloc]init];
        _tableViewTG.backgroundColor = [UIColor clearColor];
    }
    return _tableViewTG;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@{@"title":@"体育APP推广链接",@"url":@"www.ManBetX.com",@"isCopy":@"0"}, @{@"title":@"合营链接",@"url":@"www.ManBetX.com",@"isCopy":@"0"},@{@"title":@"电竞推广链接",@"url":@"www.ManBetX.com",@"isCopy":@"0"},@{@"title":@"合营代码",@"url":@"888888888",@"isCopy":@"0"}, nil];
    }
    return _dataArray;
}

- (MBImageView*)imageBg{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"bg"];
    }
    return _imageBg;
}

-(UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 16)];
        _headView.backgroundColor = [UIColor clearColor];
    }
    return _headView;
}

-(HeyingtuiguangFooterView *)footerView
{
    if (!_footerView) {
        _footerView = [[HeyingtuiguangFooterView alloc]initWithFrame:CGRectZero];
        WEAKSELF;
        _footerView.itemsDidSelectBlock = ^(NSInteger row){
            [weakSelf footerItemsDidSelect:row];
        };
    }
    return _footerView;
}

-(UIView *)showBgView
{
    if (!_showBgView) {
        _showBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _showBgView.backgroundColor = RGBA(0, 0, 0, 0.90);
    }
    return _showBgView;
}

-(UIImageView *)codeImgView
{
    if (!_codeImgView) {
        _codeImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _codeImgView.image = [UIImage imageNamed:@"heyingscanning"];
        _codeImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _codeImgView;
}

-(UIImageView *)transparentCodeImgView
{
    if (!_transparentCodeImgView) {
        _transparentCodeImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _transparentCodeImgView.image = [UIImage imageNamed:@"code_transparent"];
        _transparentCodeImgView.userInteractionEnabled = YES;
        //添加点击手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
        [_transparentCodeImgView addGestureRecognizer:tapGesture];
    }
    return _transparentCodeImgView;
}

-(MBImageView *)gifCodeImgView
{
    if (!_gifCodeImgView) {
        _gifCodeImgView = [[MBImageView alloc]initWithFrame:CGRectZero];
        [_gifCodeImgView loadGif:@"code_gifLine"];
    }
    return _gifCodeImgView;
}

-(UILabel *)codeTitleLab
{
    if (!_codeTitleLab) {
        _codeTitleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _codeTitleLab.text = @"这是一个二维码";
        _codeTitleLab.font = FONT(16);
        _codeTitleLab.textColor = COLORHEX(@"49efa3");
        _codeTitleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _codeTitleLab;
}

-(UILabel *)codeSaveMsgLab
{
    if (!_codeSaveMsgLab) {
        _codeSaveMsgLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _codeSaveMsgLab.text = @"保存成功";
        _codeSaveMsgLab.font = FONT(13);
        _codeSaveMsgLab.textColor = COLORHEX(@"e4fcf7");
        _codeSaveMsgLab.textAlignment = NSTextAlignmentCenter;
    }
    return _codeSaveMsgLab;
}

-(UIButton *)codeDownloadBtn
{
    if (!_codeDownloadBtn) {
        _codeDownloadBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_codeDownloadBtn setImage:[UIImage imageNamed:@"code_download"] forState:UIControlStateNormal];
        [_codeDownloadBtn addTarget:self action:@selector(codeDownloadBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeDownloadBtn;
}

@end
