//
//  YongjinViewController.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/17.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "DelegateCommissionViewController.h"
#import "DelegateCommissionCell.h"
#import "CommissionFooterCell.h"
#import "CommissionModel.h"
#import "CommissionFrame.h"

@interface DelegateCommissionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableViewYJ;
@property (nonatomic,strong) NSMutableArray *dataArry;
@property (nonatomic,strong) NSMutableArray *footDataArray;
@property (nonatomic,strong) MBImageView *imageBg;
@property (nonatomic,strong) UITableView *tableViewFT;
@property (nonatomic,strong) UILabel *totalLab;
@property (nonatomic,strong) UIImageView *tableBgImgView;
@end

@implementation DelegateCommissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"项目账单";
    
    [self initUI];
}

-(void)initUI
{
    [self.view addSubview:self.imageBg];
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.imageBg addSubview:self.totalLab];
    [self.totalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-20));
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@13);
    }];
    
    [self.imageBg addSubview:self.tableViewFT];
    [self.tableViewFT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.totalLab.mas_top).offset(-10);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@108);
    }];
    
    [self.imageBg addSubview:self.tableBgImgView];
    [self.tableBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.bottom.equalTo(self.tableViewFT.mas_top).offset(-16);
    }];
    
    [self.tableBgImgView addSubview:self.tableViewYJ];
    [self.tableViewYJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
}

#pragma mark - block回调
-(void)arrowBtnClicked:(CommissionFrame *)commissionFrame
{
    CommissionFrame *frame = commissionFrame;
    CommissionModel *model = frame.model;
    for (int i =0; i<self.dataArry.count; i++) {
        CommissionFrame *frame1 = self.dataArry[i];
        if (frame.model.Id == frame1.model.Id) {
            CommissionFrame *objFrame = [[CommissionFrame alloc]init];
            objFrame.model = model;
            [self.dataArry replaceObjectAtIndex:i withObject:objFrame];
        }
    }
    [self.tableViewYJ reloadData];
}

#pragma mark - UITableViewDelegate & dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView.tag==0 ? self.dataArry.count:self.footDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==0) {
        DelegateCommissionCell *cell = [DelegateCommissionCell cellWithTableView:tableView];
        cell.commissionFrame = self.dataArry[indexPath.row];
        WEAKSELF;
        cell.arrowBlock = ^(CommissionFrame *frame){
            [weakSelf arrowBtnClicked:frame];
        };
        return cell;
    }else{
        CommissionFooterCell *cell = [CommissionFooterCell cellWithTableView:tableView];
        [cell commissionFooterWithDictionary:self.footDataArray[indexPath.row]];
        return cell;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommissionFrame *frame = self.dataArry[indexPath.row];
    CGFloat cellHeight = frame.cellHeight;
    return tableView.tag==0 ? cellHeight:54;
}

#pragma mark - lazy
-(UITableView *)tableViewYJ
{
    if (!_tableViewYJ) {
        _tableViewYJ = [[UITableView alloc]initWithFrame:CGRectZero];
        _tableViewYJ.delegate = self;
        _tableViewYJ.dataSource = self;
        _tableViewYJ.tag = 0;
        _tableViewYJ.tableFooterView = [[UIView alloc]init];
        _tableViewYJ.backgroundColor = [UIColor clearColor];
        _tableViewYJ.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableViewYJ;
}

-(UITableView *)tableViewFT
{
    if (!_tableViewFT) {
        _tableViewFT = [[UITableView alloc]initWithFrame:CGRectZero];
        _tableViewFT.delegate = self;
        _tableViewFT.dataSource = self;
        _tableViewFT.bounces = NO;
        _tableViewFT.tag = 1;
        _tableViewFT.tableFooterView = [[UIView alloc]init];
        _tableViewFT.backgroundColor = [UIColor clearColor];
        _tableViewFT.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableViewFT;
}

- (MBImageView*)imageBg
{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"bg"];
    }
    return _imageBg;
}

-(UILabel *)totalLab
{
    if (!_totalLab) {
        _totalLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _totalLab.textColor = RGBA(255, 255, 255, 0.64);
        _totalLab.font = FONT(13);
        _totalLab.textAlignment = NSTextAlignmentCenter;
        _totalLab.text = @"共15个项目";
    }
    return _totalLab;
}

-(NSMutableArray *)dataArry
{
    if (!_dataArry) {
        _dataArry = [NSMutableArray array];
        //
        CommissionModel *model = [[CommissionModel alloc]init];
        model.title = @"申博真人";
        model.isSel = NO;
        model.winLose = @"8888";
        model.rake = @"6666";
        model.Id = 1;
        //
        CommissionFrame *frame = [[CommissionFrame alloc]init];
        frame.model = model;
        
        //
        [_dataArry addObject:frame];
        for (int i=0; i<10; i++) {
            CommissionModel *model1 = [[CommissionModel alloc]init];
            CommissionFrame *frame1 = [[CommissionFrame alloc]init];
            model1.title = @"捕鱼达人";
            model1.isSel = NO;
            model1.winLose = @"8888";
            model1.rake = @"6666";
            model1.Id = 2 + i;
            frame1.model = model1;
            [_dataArry addObject:frame1];
        }
    }
    return _dataArry;
}

-(NSMutableArray *)footDataArray
{
    if (!_footDataArray) {
        _footDataArray = [NSMutableArray arrayWithObjects:@{@"icon":@"icon-totle",@"title":@"平台合计",@"content":@"23，232，345"},@{@"icon":@"icon-proportion",@"title":@"佣金比例",@"content":@"30%"}, nil];
    }
    return _footDataArray;
}

-(UIImageView *)tableBgImgView
{
    if (!_tableBgImgView) {
        _tableBgImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _tableBgImgView.image = [UIImage imageNamed:@"yongjinfrom-bg"];
        _tableBgImgView.userInteractionEnabled = YES;
    }
    return _tableBgImgView;
}


@end
