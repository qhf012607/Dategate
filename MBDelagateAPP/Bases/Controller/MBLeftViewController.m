//
//  MBLeftViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/9/20.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBLeftViewController.h"
#import "../View/MBLeftShowView/LeftViewCell.h"
#import "HeyingtuiguangViewController.h"
#import "DelegateNotificationViewController.h"
#import "HYJihuaViewController.h"
#import "../View/UpdateView/MBUpdateView.h"
#import "HYBDViewController.h"

@interface MBLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *arrayData;
@property(nonatomic,strong)UIView *headview;
@property(nonatomic,strong)UILabel *labMont;
@property(nonatomic,strong)UILabel *lablife;
@property(nonatomic,strong)UILabel *labwin;
@property(nonatomic,strong)UILabel *labboton;
@property(nonatomic,strong)UIImageView *imageHead;
@property(nonatomic,strong)MBImageView *imageBg;
@property(nonatomic,strong)UILabel *labname;
@property(nonatomic,strong)UIImageView *imageBgUp;
@property(nonatomic,strong)UIImageView *imageBgDown;
@property(nonatomic,strong)UILabel *lablifMount;
@property(nonatomic,strong)UILabel *labwinMount;
@property(nonatomic,strong)NSMutableArray *dicNotifacation;
@property(nonatomic,strong)MBUpdateView *updateView;
@end

@implementation MBLeftViewController
- (instancetype)init{
    if (self=[super init]) {
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.arrayData = [NSMutableArray arrayWithObjects:@{@"title":@"通知",@"sel":@"icon-message2",@"Desel":@"icon-message"},@{@"title":@"合营推广",@"sel":@"icon-plan3",@"Desel":@"icon-plan2"},@{@"title":@"合营宝典",@"sel":@"icon-computer3",@"Desel":@"icon-computerN"},@{@"title":@"修改密码",@"sel":@"icon-change",@"Desel":@"lefticon-change"},@{@"title":@"帮助",@"sel":@"icon-chelp3",@"Desel":@"icon-chelp"},@{@"title":@"合营计划",@"sel":@"icon-plan3",@"Desel":@"icon-plan2"},@{@"title":@"检查更新",@"sel":@"icon-update3",@"Desel":@"icon-update1"}, nil];
   
    self.dicNotifacation = [NSMutableArray arrayWithObjects:@{@"number":@"22"},@{@"number":@"19"},@{@"number":@"19"}, nil];
    [self addTabble];
   
    // Do any additional setup after loading the view.
}

- (void)addTabble{
     [self.view addSubview:self.imageBg];
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
      self.table.tableHeaderView = self.headview;
    [self.labname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(42);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(51);
    }];
    [self.imageHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.headview.mas_centerX);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(94);
    }];
    [self.imageBgUp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
         make.right.mas_equalTo(-30);
        make.top.mas_equalTo(68);
        make.height.mas_equalTo(124);
    }];
    [self.imageBgDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(self.imageBgUp.mas_bottom);
        make.height.mas_equalTo(119);
    }];
    [self.labMont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.imageHead.mas_bottom).offset(10);
    }];
    [self.lablifMount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.imageBgDown.mas_right).multipliedBy(0.25).offset(30-30/4);
        make.top.mas_equalTo(self.imageBgUp.mas_bottom).offset(17);
    }];
    [self.lablife mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerX.mas_equalTo(self.imageBgDown.mas_right).multipliedBy(0.25).offset(30-30/4);
        make.top.mas_equalTo(self.lablifMount.mas_bottom).offset(4);
    }];
    [self.labwinMount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.imageBgDown.mas_right).multipliedBy(0.75).offset(30-30*0.75);
         make.top.mas_equalTo(self.imageBgUp.mas_bottom).offset(17);
        
    }];
    [self.labwin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.imageBgDown.mas_right).multipliedBy(0.75).offset(30-30*0.75);
        make.top.mas_equalTo(self.labwinMount.mas_bottom).offset(4);
    }];
    
    [self.labboton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.labwin.mas_bottom).offset(30); make.centerX.mas_equalTo(self.imageBgDown.mas_right).multipliedBy(0.5).offset(30-30*0.5);
        
    }];
    
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftViewCell"];

    [cell configCell:self.arrayData[indexPath.row]];
    if (indexPath.row<self.dicNotifacation.count) {
        [cell configNumber:self.dicNotifacation[indexPath.row]];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell selected:true];
    switch (indexPath.row) {
        case 0:
            [self notifacation];
            break;
        case 1:
            //合营推广

            [self hytg];

            break;
        case 2:
            [self hybd];
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            [self hyjh];
            break;
        case 6:
            //检查更新
            [self update];
            break;
            
        default:
            break;
    }
}

- (void)hybd{
    [NSObject pushController:[[HYBDViewController alloc]init]];
}


-(void)hytg
{
    HeyingtuiguangViewController *tg = [[HeyingtuiguangViewController alloc]init];
    tg.hiddenNav = NO;
    tg.navigationItem.title = @"优惠通知";
    [self.navigationController pushViewController:tg animated:YES];
}

- (void)hyjh{
     [NSObject pushController:[[HYJihuaViewController alloc]init]];
}

- (void)notifacation{
    [NSObject pushController:[[DelegateNotificationViewController alloc]init]];
}

-(void)update
{
    [self.view addSubview:self.updateView];
    [self.updateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

-(void)checkUpdate:(BOOL)isCancel
{
    if (isCancel) {
        [_updateView removeFromSuperview];
        _updateView = nil;
    }else{
        [_updateView removeFromSuperview];
        _updateView = nil;
    }
}

#pragma mark -
- (void)addmas{
    
}

- (UITableView*)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_table registerNib:[UINib nibWithNibName:@"LeftViewCell" bundle:nil] forCellReuseIdentifier:@"LeftViewCell"];
        _table.delegate = self;
        _table.dataSource  = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.backgroundColor = [UIColor clearColor];
    }
    return _table;
}

- (UIView*)headview{
    if (!_headview) {
        _headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 350)];
        _labname = [[UILabel alloc]initWithFrame:CGRectZero];
        _labname.text = @"ManBetX";
        _labname.font = [UIFont systemFontOfSize:20];
//        _labname.backgroundColor = [UIColor redColor];
        [_headview addSubview:_labname];
        
        _imageBgUp = [[UIImageView alloc]initWithFrame:CGRectZero];
        _imageBgUp.image = [UIImage imageNamed:@"leftheadbg"];
        [_headview addSubview:_imageBgUp];
        _imageBgDown = [[UIImageView alloc]initWithFrame:CGRectZero];
        _imageBgDown.image = [UIImage imageNamed:@"lefthead-bg2"];
        [_headview addSubview:_imageBgDown];
        MBImageView *head = [[MBImageView alloc]initWithFrame:CGRectZero];
        [head setImage:[UIImage imageNamed:@"ManBetXlogo"]];
        [_headview addSubview:head];
        _imageHead = head;
        
        UILabel *labLevel = [[UILabel alloc]initWithFrame:CGRectZero];
        labLevel.textColor = MBlightwhite;
        NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:@"佣兵等级30%"];
         labLevel.font = [UIFont systemFontOfSize:24];
        [attriStr addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xa5a5a5) range:NSMakeRange(0, 4)];
        [attriStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, 4)];
        [attriStr addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xd2b375) range:NSMakeRange( 4,  attriStr.length-4)];
         [attriStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(attriStr.length-1, 1)];
        labLevel.attributedText = attriStr;
        labLevel.textAlignment = NSTextAlignmentCenter;
        [_headview addSubview:labLevel];
        _labMont = labLevel;
        
        UILabel *lablife = [[UILabel alloc]initWithFrame:CGRectZero];
        lablife.font = [UIFont systemFontOfSize:12];
        lablife.text = @"本月活跃会员数还差";
        lablife.textColor = MBlightwhite;
        [_headview addSubview:lablife];
        _lablife = lablife;
        
        UILabel *labLifeMount  = [[UILabel alloc]initWithFrame:CGRectZero];
        labLifeMount.font = [UIFont systemFontOfSize:20];
        labLifeMount.text = @"52";
        labLifeMount.textColor = MByellow;
        _lablifMount = labLifeMount;
        [_headview addSubview:labLifeMount];
        
        UILabel *labWan = [[UILabel alloc]initWithFrame:CGRectZero];
        labWan.font = [UIFont systemFontOfSize:12];
        labWan.text = @"净盈利还少";
        labWan.textColor = MBlightwhite;
        [_headview addSubview:labWan];
        _labwin = labWan;
        
        UILabel *labWanMount  = [[UILabel alloc]initWithFrame:CGRectZero];
        labWanMount.font = [UIFont systemFontOfSize:20];
        labWanMount.text = @"5200";
        labWanMount.textColor = MByellow;
        _labwinMount = labWanMount;
         [_headview addSubview:labWanMount];
        
        UILabel *labF = [[UILabel alloc]initWithFrame:CGRectZero];
        NSMutableAttributedString * attriStrBotton = [[NSMutableAttributedString alloc] initWithString:@"就能获得 35% 佣金啦"];
        labF.textColor = [UIColor whiteColor];
        [attriStrBotton addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xd2b375) range:NSMakeRange( 4,  4)];
        labF.attributedText = attriStrBotton;
        [_headview addSubview:labF];
        
        _labboton = labF;
        
    }
    return _headview;
}

- (MBImageView*)imageBg{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"leftBg"];
    }
    return _imageBg;
}

-(MBUpdateView *)updateView
{
    if (!_updateView) {
        _updateView = [[MBUpdateView alloc]initWithFrame:CGRectZero];
        WEAKSELF;
        _updateView.updateBlock = ^{
            [weakSelf checkUpdate:NO];
        };
        _updateView.cancelBlock = ^{
            [weakSelf checkUpdate:YES];
        };
    }
    return _updateView;
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

