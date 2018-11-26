//
//  DelegateNotificationViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/1.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "DelegateNotificationViewController.h"
#import "NotifactionCell.h"
#import "MBNotifacateModel.h"
@interface DelegateNotificationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *arrayData;
@property(nonatomic,strong)MBImageView *imageBg;

@end

@implementation DelegateNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    self.title = @"通知";
}

- (void)initUI{
    self.arrayData = [NSMutableArray array];
    NSArray *array = @[@{@"type":@"1",@"time":@"2018/09/08 13:56:42",@"content":@"结算账单更新",@"delete":@"false"},@{@"type":@"2",@"time":@"2018/09/08 13:56:42",@"content":@"精彩两千万；容积率为丘尔金活动",@"delete":@"false"},@{@"type":@"1",@"time":@"2018/09/08 13:56:42",@"content":@"结算账单更新",@"delete":@"false"},@{@"type":@"2",@"time":@"2018/09/08 13:56:42",@"content":@"精彩活动",@"delete":@"false"}] ;
    for (int i = 0; i< array.count; i++) {
        NSDictionary *dic = array[i];
        MBNotifacateModel *model = [[MBNotifacateModel alloc]init];
        model.type = dic[@"type"];
        model.time = dic[@"time"];
        model.content = dic[@"content"];
        model.deleted = dic[@"delete"];
        [self.arrayData addObject:model];
    }
    [self.view addSubview:self.imageBg];
    [self.view addSubview:self.tableView];
    [self addmas];
}


- (void)addmas{
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0,0));
    } ];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotifactionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notifacation"];
    MBNotifacateModel *dic = self.arrayData[indexPath.row];
    WEAKSELF
    cell.deleteData = ^{
        [weakSelf deleteData:indexPath.row];
    };
    [cell config:dic];
    return cell;
}

- (void)deleteData:(NSInteger)index{
    [self.arrayData removeObjectAtIndex:index ];
    [self.tableView reloadData];
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource =  self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"NotifactionCell" bundle:nil] forCellReuseIdentifier:@"notifacation"];
    }
    return _tableView;
}

- (MBImageView*)imageBg{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"bg"];
    }
    return _imageBg;
}

@end
