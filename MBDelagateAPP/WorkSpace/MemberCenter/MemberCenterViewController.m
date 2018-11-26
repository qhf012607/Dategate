//
//  MemberCenterViewController.m
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/11.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MemberCenterViewController.h"
#import "GestureScrollView.h"
#import "MemberCenterModel.h"
#import "GestureTableView.h"
#import "MemberCenterTableViewCell.h"
@interface MemberCenterViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UIGestureRecognizerDelegate,PGDatePickerDelegate>
@property(nonatomic,strong)GestureScrollView *scrollContext;
@property(nonatomic,strong)UIView *headView;

@property(nonatomic,strong)NSMutableArray *arrayData;
@property(nonatomic,strong)MBImageView *imageBg;
@property(nonatomic,strong)MBImageView *imageBgSecond;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UIButton *searBt;
@property(nonatomic,strong)UIButton *buttBack;
@property(nonatomic,strong)UIView *leftTimeView;
@property(nonatomic,strong)UIView *rightTimeView;
@property(nonatomic,strong)UIButton *butLeft;
@property(nonatomic,strong)UIButton *butRight;
@property(nonatomic,strong)UILabel *lableLeft;
@property(nonatomic,strong)UILabel *labright;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)CGPoint contentOffset;
@property(nonatomic,strong)MemberCenterTableViewCell *Membercell;
@end

@implementation MemberCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = [NSMutableArray array];
    [self.view addSubview:self.imageBg];
    for (int i = 0 ; i < 100; i ++) {
        MemberCenterModel *model = [[MemberCenterModel alloc]init];
        if (i % 2 == 0) {
             model.name = @"Rhonin";
             model.outmoney = @"88,888,888";
             model.inmoney = @"99,999,999";
        }else{
            model.name = @"jarven";
            model.outmoney = @"99,999,999";
             model.inmoney = @"88,888,888";
        }
        model.time = @"2018/01/01";
        model.winDefalut = @"999,999";
        [self.arrayData addObject:model];
    }
   
   
    self.title = @"会员中心";
    [self initUIFunctonTwo];
   
}
- (void)initUIFunctonTwo{
    [self.view addSubview:self.headView];
    [self.view addSubview:self.imageBgSecond];
    [self.view addSubview:self.tableView];
    [self headMas];
    [self addTableHeadView];
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.imageBgSecond mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(self.Membercell.top-5, 100-5, 0, 0));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(self.Membercell.bottom, 0, 0, 0));
    }];
    self.tableView.mj_header = [MBRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(reload)];
    [self addFooter];
}

- (void)addFooter{
     self.tableView.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(addMore)];
}


- (void)showDatepicker:(UIButton*)sender{
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.tag = sender.tag;
    datePicker.delegate = self;
    datePicker.datePickerMode = PGDatePickerModeDate;
    [self presentViewController:datePickManager animated:false completion:nil];
}

- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    if (datePicker.tag == 0) {
        self.lableLeft.text = [NSString stringWithFormat:@"%ld/%ld/%ld",dateComponents.day,dateComponents.month,dateComponents.year];
    }else{
        self.labright.text = [NSString stringWithFormat:@"%ld/%ld/%ld",dateComponents.day,dateComponents.month,dateComponents.year];
    }
}


- (void)headMas{
   
    [self.buttBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(44);
        make.top.mas_equalTo(statusBarHeight);
    }];
    [self.searBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(44);
        make.top.mas_equalTo(statusBarHeight);
        make.right.mas_equalTo(-20);
    }];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.buttBack.mas_right).offset(-15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(statusBarHeight+2);
        make.right.mas_equalTo(self.searBt.mas_left).offset(10);
    }];
    [self.leftTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.buttBack.mas_left);
        make.right.mas_equalTo(self.rightTimeView.mas_left).offset(-17);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.searchBar.mas_bottom).offset(16);
    }];
    [self.rightTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.searBt.mas_right);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.searchBar.mas_bottom).offset(16);
        make.width.equalTo(self.leftTimeView.mas_width);
    }];
    [self.butLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(40);
    }];
    [self.butRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(40);
    }];
    [self.lableLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(self.butLeft.mas_left);
    }];
    [self.labright mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(self.butRight.mas_left);
    }];

}

- (void)addTableHeadView{
    MemberCenterModel *model = [[MemberCenterModel alloc]init];
    model.name = @"会员名称";
    model.outmoney = @"存款总额";
    model.inmoney = @"提款总额";
    model.time = @"注册日期";
    model.winDefalut = @"公司输赢";
    MemberCenterTableViewCell *cell = [[MemberCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"memberCenter"];
    self.Membercell = cell;
    [self.view addSubview:cell];
    RACChannelTo(self,contentOffset) = RACChannelTo( cell.scroll,contentOffset);
    //
    [cell configCell:model];
    cell.frame = CGRectMake(0, self.headView.bottom, SCREEN_WIDTH, 30);
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemberCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"memberCenter"];
    if (cell == nil) {
        cell = [[MemberCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"memberCenter"];
        RACChannelTo(self,contentOffset) = RACChannelTo( cell.scroll,contentOffset);
    }
    NSString *title = @"";
    MemberCenterModel *model = self.arrayData[indexPath.row];
    [cell configCell:model];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}


- (void)addMore{
    self.isloading = true;
    self.scrollContext.scrollEnabled = false;
    [self performSelector:@selector(endRefreshMore) withObject:nil afterDelay:1];
    
}

- (void)endRefreshMore{
  
    self.isloading = false;
    self.tableView.mj_footer=nil;
   // [self.tableView.mj_footer endRefreshing];
    [self addFooter];
}

- (void)reload{
    self.isloading = true;
    [self performSelector:@selector(endrefresh) withObject:nil afterDelay:1];
}

- (void)endrefresh{
    self.isloading = false;
    [self.tableView.mj_header endRefreshing];
}



- (MBImageView*)imageBg{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"bg"];
    }
    return _imageBg;
}

- (MBImageView*)imageBgSecond{
    if (!_imageBgSecond) {
        _imageBgSecond = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBgSecond.image = [UIImage imageNamed:@"Momenberbg"];
        _imageBgSecond.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageBgSecond;
}

- (UIButton*)searBt{
    if (!_searBt) {
        _searBt = [[UIButton alloc]initWithFrame:CGRectZero];
        [_searBt setImage:[UIImage imageNamed:@"icon-surch"] forState:UIControlStateNormal];
        [_searBt addTarget:self  action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
        [_searBt setImageEdgeInsets:UIEdgeInsetsMake(7, 16, 7, 0)];
    }
    return _searBt;
}

- (UIView*)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVBAR_HEIGHT+statusBarHeight+72)];
         [_headView addSubview:self.searchBar];
        [_headView addSubview:self.buttBack];
       
        [_headView addSubview:self.searBt];
        [_headView addSubview:self.leftTimeView];
        [_headView addSubview:self.rightTimeView];
        _headView.backgroundColor = [UIColor clearColor];
    }
    return _headView;
}

- (UIButton*)buttBack{
    if (!_buttBack) {
        _buttBack = [[UIButton alloc]initWithFrame:CGRectZero];
        _buttBack.contentMode = UIViewContentModeScaleAspectFit;
        [_buttBack setImage:[UIImage imageNamed:@"icon-back"] forState:UIControlStateNormal];
        [_buttBack addTarget:self  action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [_buttBack setImageEdgeInsets:UIEdgeInsetsMake(12, 0, 12, 32)];
    }
    return _buttBack;
}


- (UISearchBar*)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectZero];
        _searchBar.placeholder = @"搜索会员";
        _searchBar.delegate = self;
        _searchBar.barStyle = UISearchBarStyleMinimal;
        UIView *viewback = [_searchBar valueForKey:@"background"];
        [viewback removeFromSuperview];
    }
    return _searchBar;
}

- (UIView*)leftTimeView{
    if (!_leftTimeView) {
        _leftTimeView = [[UIView alloc]initWithFrame:CGRectZero];
        _leftTimeView.layer.borderWidth = 1;
        _leftTimeView.backgroundColor = RGB(88, 87, 88);
        _leftTimeView.layer.borderColor = RGB(48, 47, 48).CGColor;
        [_leftTimeView addSubview:self.butLeft];
        [_leftTimeView addSubview:self.lableLeft];
        _leftTimeView.layer.cornerRadius = 5;
        _leftTimeView.clipsToBounds = true;
    }
    return _leftTimeView;
}


- (UIView*)rightTimeView{
    if (!_rightTimeView) {
        _rightTimeView = [[UIView alloc]initWithFrame:CGRectZero];
        [_rightTimeView addSubview:self.butRight];
         [_rightTimeView addSubview:self.labright];
         _rightTimeView.clipsToBounds = true;
        _rightTimeView.backgroundColor = RGB(88, 87, 88);
        _rightTimeView.layer.borderWidth = 1;
        _rightTimeView.layer.cornerRadius = 5;
        _rightTimeView.layer.borderColor = RGB(48, 47, 48).CGColor;
    }
    return _rightTimeView;
}

- (UIButton*)butLeft{
    if (!_butLeft) {
        _butLeft = [[UIButton alloc]initWithFrame:CGRectZero];
        //icon-clendar
       
        [_butLeft setImage:[UIImage imageNamed:@"icon-clendar"] forState:UIControlStateNormal];
        [_butLeft setImageEdgeInsets:UIEdgeInsetsMake(11, 11, 11, 11)];
        _butLeft.backgroundColor = RGB(72, 71, 72);
        [_butLeft addTarget:self action:@selector(showDatepicker:) forControlEvents:UIControlEventTouchUpInside];
        _butLeft.tag = 0;
    }
    return _butLeft;
}

- (UIButton*)butRight{
    if (!_butRight) {
        _butRight = [[UIButton alloc]initWithFrame:CGRectZero];
        [_butRight setImage:[UIImage imageNamed:@"icon-clendar"] forState:UIControlStateNormal];
        [_butRight setImageEdgeInsets:UIEdgeInsetsMake(11,11,11,11)];
        _butRight.backgroundColor = RGB(72, 71, 72);
        [_butRight addTarget:self action:@selector(showDatepicker:) forControlEvents:UIControlEventTouchUpInside];
         _butRight.tag = 1;
    }
    return _butRight;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)search{
    
}

- (UILabel*)lableLeft{
    if (!_lableLeft) {
        _lableLeft = [[UILabel alloc]initWithFrame:CGRectZero];
        _lableLeft.textAlignment = NSTextAlignmentCenter;
        _lableLeft.textColor = UIColorHex(0xcdcdcd);
        _lableLeft.font = [UIFont systemFontOfSize:14];
    }
    return _lableLeft;
}

- (UILabel*)labright{
    if (!_labright) {
        _labright = [[UILabel alloc]initWithFrame:CGRectZero];
        _labright.textAlignment = NSTextAlignmentCenter;
        _labright.textColor = UIColorHex(0xcdcdcd);
        _labright.font = [UIFont systemFontOfSize:14];
    }
    return _labright;
}


- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource =  self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _tableView;
}


@end


