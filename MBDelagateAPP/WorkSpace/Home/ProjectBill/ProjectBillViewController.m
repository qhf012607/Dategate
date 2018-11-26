//
//  ProjectBillViewController.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/22.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "ProjectBillViewController.h"
#import "ProjectBillCell.h"
#import "../Commission/DelegateCommissionViewController.h"
#import "ProjectBillHeadView.h"

@interface ProjectBillViewController ()<UITableViewDelegate,UITableViewDataSource,PGDatePickerDelegate>
@property (nonatomic,strong) UITableView *tableViewZD;
@property (nonatomic,strong) NSMutableArray *dataArry;
@property (nonatomic,strong) MBImageView *imageBg;
@property (nonatomic,strong) UIButton *billBtn;
@property (nonatomic,strong) ProjectBillHeadView *headView;
@property (nonatomic,strong) UIImageView *tableBgImgView;
@end

@implementation ProjectBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"佣金报表";
    
    [self initUI];
}

-(void)initUI
{
    [self.view addSubview:self.imageBg];
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.imageBg addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@72);
    }];
    
    [self.imageBg addSubview:self.billBtn];
    [self.billBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-34));
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@54);
    }];
    
    [self.imageBg addSubview:self.tableBgImgView];
    [self.tableBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_bottom).offset(0);
        make.bottom.equalTo(self.billBtn.mas_top).offset(-34);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
    }];
    
    [self.tableBgImgView addSubview:self.tableViewZD];
    [self.tableViewZD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

#pragma mark - UITableViewDelegate & dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectBillCell *cell = [ProjectBillCell cellWithTableView:tableView];
    [cell projectBillWithDictionary:self.dataArry[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - PGDatePickerDelegate
- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    _headView.dateLab.text = [NSString stringWithFormat:@"%ld/%ld",(long)dateComponents.month,(long)dateComponents.year];
}

#pragma mark - event
-(void)billBtnClicked
{
    DelegateCommissionViewController *controller = [[DelegateCommissionViewController alloc]init];
    [NSObject pushController:controller];
}

-(void)showDatepicker
{
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.delegate = self;
    datePicker.datePickerMode = PGDatePickerModeYearAndMonth;
    [self presentViewController:datePickManager animated:false completion:nil];
}

#pragma mark - lazy
-(UITableView *)tableViewZD
{
    if (!_tableViewZD) {
        _tableViewZD = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableViewZD.delegate = self;
        _tableViewZD.dataSource = self;
        _tableViewZD.tableFooterView = [[UIView alloc]init];
        _tableViewZD.backgroundColor = [UIColor clearColor];
        _tableViewZD.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableViewZD;
}

-(NSMutableArray *)dataArry
{
    if (!_dataArry) {
        _dataArry = [NSMutableArray arrayWithObjects:@{@"title":@"有效会员",@"content":@"188929"},@{@"title":@"存提款手续费",@"content":@"188,929"},@{@"title":@"红利",@"content":@"0.00"},@{@"title":@"反水",@"content":@"0.02"},@{@"title":@"累加上月",@"content":@"2270"},@{@"title":@"手工调整",@"content":@"-1810"},@{@"title":@"本期佣金",@"content":@"-12,223,003"},@{@"title":@"实际发放",@"content":@"188929"},@{@"title":@"转账下月",@"content":@"888"},@{@"title":@"结算状态",@"content":@"结算完成"}, nil];
    }
    return _dataArry;
}

- (MBImageView*)imageBg
{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"bg"];
    }
    return _imageBg;
}

-(UIButton *)billBtn
{
    if (!_billBtn) {
        _billBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_billBtn setImage:[UIImage imageNamed:@"zhangdanSearchfrom"] forState:UIControlStateNormal];
        [_billBtn addTarget:self action:@selector(billBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        _billBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _billBtn;
}

-(ProjectBillHeadView *)headView
{
    if (!_headView) {
        _headView = [[ProjectBillHeadView alloc]initWithFrame:CGRectZero];
        _headView.backgroundColor = [UIColor clearColor];
        WEAKSELF;
        _headView.dateBtnBlock = ^{
            [weakSelf showDatepicker];
        };
        _headView.searchBtnBlock = ^{
            NSLog(@"search");
        };
    }
    return _headView;
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
