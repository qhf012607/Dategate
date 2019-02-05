//
//  HomeViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/19.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MYHomeViewController.h"
#import "HomeViewTableViewCell.h"
#import "HomeContentVieCell.h"
#import "MemberCenterViewController.h"
#import "HomeViewController.h"
#import "ProjectBill/ProjectBillViewController.h"
#import "FinanceReport/FinanceReportViewController.h"

@interface MYHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *navigationView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *arrayheadData;
@property(nonatomic,strong)NSArray *arrayContData;
@property(nonatomic,strong)MBImageView *imageHead;
@property(nonatomic,strong)UILabel *titlelab;
@property(nonatomic,strong)MBImageView *imageList;
@property(nonatomic,strong)MBImageView *imageBg;
@end

@implementation MYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [[PRNetWork getUserInfo]subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
}

- (void)initUI{
    [self.view addSubview:self.imageBg];
    [self.view addSubview:self.navigationView];
    [self.view addSubview:self.tableView];
 
    if ([[CyUserDefaults valueForKey:@"homeHiddenCell"] isEqualToString:@"1"]) {
        self.arrayheadData = @[@{@"content":@"会员总量：23,2323",@"count":@"15",@"icon":@"icon-member",@"gif":@"updong"},@{@"content":@"存款余额：13,2323W",@"icon":@"icon-deposit"},@{@"content":@"活跃用户：23,2323",@"count":@"20",@"icon":@"icon-user"}];
    }else{
         self.arrayheadData = @[@{@"content":@"账户余额：23.2323W",@"icon":@"icon-balance",@"acount":@"true",@"type":@"1"},@{@"content":@"会员总量：23,2323",@"count":@"15",@"icon":@"icon-member",@"gif":@"updong"},@{@"content":@"存款余额：13,2323W",@"icon":@"icon-deposit"},@{@"content":@"活跃用户：23,2323",@"count":@"20",@"icon":@"icon-user"}];
    }
   
    self.arrayContData = @[@"member",@"financial",@"commisson"];
    [self addMas];
    [self addHeader];
}


- (void)addMas{
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationView.bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}


- (void)addHeader{
    self.tableView.mj_header = [MBRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullrefresh)];
}

- (void)pullrefresh{
    [self performSelector:@selector(endReresh) withObject:nil afterDelay:2];
}

- (void)endReresh{
   
    [self.tableView.mj_header endRefreshing];
    if ([[CyUserDefaults valueForKey:@"HomeCellW"]isEqualToString:@"1"]) {
         self.arrayheadData = @[@{@"content":@"账户余额：23.2323W",@"icon":@"icon-balance",@"acount":@"true",@"type":@"1"},@{@"content":@"会员总量：23,2323",@"count":@"15",@"icon":@"icon-member",@"gif":@"updong"},@{@"content":@"存款余额：13,2323W",@"icon":@"icon-deposit"},@{@"content":@"活跃用户：23,2323",@"count":@"20",@"icon":@"icon-user"}];
    }else{
         self.arrayheadData = @[@{@"content":@"账户余额：232323",@"icon":@"icon-balance",@"acount":@"true",@"type":@"1"},@{@"content":@"会员总量：23,2323",@"count":@"15",@"icon":@"icon-member",@"gif":@"updong"},@{@"content":@"存款余额：13,2323W",@"icon":@"icon-deposit"},@{@"content":@"活跃用户：23,2323",@"count":@"20",@"icon":@"icon-user"}];
    }
    
    [self.tableView reloadData];
    [CyUserDefaults saveValue:@"0" forkey:@"homeHiddenCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.arrayheadData.count;
    }else{
        return 3;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"myoffsetTabe%f",scrollView.contentOffset.y);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {//homeContentCell
        cell = [tableView dequeueReusableCellWithIdentifier:@"homviewheadCell"];
        [(HomeViewTableViewCell*)cell configCell:self.arrayheadData[indexPath.row]];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"homeContentCell"];
        [(HomeContentVieCell*)cell config:self.arrayContData[indexPath.row]];
    }
    cell.backgroundColor = [UIColor clearColor];
    //    [cell ]
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0&&indexPath.section == 0) {
        if (self.arrayheadData.count > 3) {
            [self hiddenAcount];
        }
      
    }else if (indexPath.row == 0&&indexPath.section == 1){
        MemberCenterViewController *controller = [[MemberCenterViewController alloc]init];
        controller.hiddenNav = true;
        [NSObject pushController:controller];
    }else if (indexPath.row == 1&&indexPath.section == 1){
        FinanceReportViewController *controller = [[FinanceReportViewController alloc]init];
        [NSObject pushController:controller];
    }else if (indexPath.row == 2&&indexPath.section == 1){
        ProjectBillViewController *controller = [[ProjectBillViewController alloc]init];
        [NSObject pushController:controller];
    }else if (indexPath.row == 1){
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HomeViewController *vc = [mainStoryboard instantiateInitialViewController];
        GGappDelegate.window.rootViewController = vc;
    }
}

- (void)hiddenAcount{
    self.arrayheadData = @[@{@"content":@"会员总量：23,2323",@"count":@"15",@"icon":@"icon-member"},@{@"content":@"存款余额：13,2323W",@"icon":@"icon-deposit"},@{@"content":@"活跃用户：23,2323",@"count":@"20",@"icon":@"icon-user"}];
    [self.tableView reloadData];
    [CyUserDefaults saveValue:@"1" forkey:@"homeHiddenCell"];
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"HomeViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"homviewheadCell"];
         [_tableView registerNib:[UINib nibWithNibName:@"HomeContentVieCell" bundle:nil] forCellReuseIdentifier:@"homeContentCell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIView*)navigationView{
    CGFloat height = 0 ;
    if (statusBarHeight > 20) {
        height = 88;
    }else{
        height = 64;
    }
    if (!_navigationView) {
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
//        UIImageView *image = [UIImageView alloc]initWithFrame:CGRectMake(30, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        self.titlelab = [[UILabel alloc]initWithFrame:CGRectMake(0, statusBarHeight, SCREEN_WIDTH, height-statusBarHeight)];
        self.titlelab.textAlignment = NSTextAlignmentCenter;
        self.titlelab.font = [UIFont systemFontOfSize:13];
        self.titlelab.textColor = UIColorFromRGB(0xcdcdcd);
        self.titlelab.text = @"Manbetx!晚上好";
        [_navigationView addSubview:self.titlelab];
        
        self.imageHead  = [[MBImageView alloc]initWithFrame:CGRectMake(31, statusBarHeight+5, 33, 33)];
        self.imageHead.image = [UIImage imageNamed:@"ManBetXlogo"];
         [_navigationView addSubview:self.imageHead];
        self.imageList = [[MBImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-25-31, statusBarHeight+5, 33, 33)];
        self.imageList.contentMode = UIViewContentModeCenter;
        self.imageList.image = [UIImage imageNamed:@"icon-liest"];
        UITapGestureRecognizer *gester = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showleftMenue)];
        [_navigationView addGestureRecognizer:gester];
         [_navigationView addSubview:self.imageList];
    }
    return _navigationView;
}

- (void)showleftMenue{
     [ GGappDelegate.baseController showLeft];
}

- (MBImageView*)imageBg{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"bg"];
    }
    return _imageBg;
}

@end
