//
//  HYBDViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/26.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "HYBDViewController.h"
#import "BaoDianTableViewCell.h"
#import "BDDetailViewController.h"
@interface HYBDViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *arrayData;
@property(nonatomic,strong)MBImageView *imageBg;
@end

@implementation HYBDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"合影宝典";
    [self.view addSubview:self.imageBg];
    [self.view addSubview:self.tableView];
    [self addmas];
    // Do any additional setup after loading the view from its nib.
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
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaoDianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baodianCell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [NSObject pushController:[[BDDetailViewController alloc]init]];
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource =  self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"BaoDianTableViewCell" bundle:nil] forCellReuseIdentifier:@"baodianCell"];
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
