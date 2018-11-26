//
//  FinanceReportViewController.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/23.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "FinanceReportViewController.h"
#import "FinanceHeaderCell.h"
#import "DateView.h"
//游戏输赢
#import "FinanceReportCell.h"
#import "FinanceReportFrame.h"
#import "FinanceReportModel.h"
//手续费
#import "HandlingFeeCell.h"
#import "HandlingFeeFrame.h"

@interface FinanceReportViewController ()<UITableViewDelegate,UITableViewDataSource,PGDatePickerDelegate>
@property (nonatomic,strong) UITableView *tableViewCW;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) MBImageView *imageBg;
@property (nonatomic,strong) DateView *leftDateView;
@property (nonatomic,strong) DateView *rightDateView;
@property (nonatomic,assign) BOOL isRight;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIButton *searchBtn;
@property (nonatomic,strong) UIView *bgViewXQ;
@property (nonatomic,strong) UITableView *tableViewXQ;
@end

@implementation FinanceReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"财务报表";
    
    [self initUI];
}

-(void)initUI
{
    [self.view addSubview:self.imageBg];
    [self.imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.imageBg addSubview:self.leftDateView];
    [self.leftDateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.left.equalTo(@33);
        make.width.equalTo(@((SCREEN_WIDTH-66-36-50)/2));
        make.height.equalTo(@40);
    }];
    
    [self.imageBg addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.leftDateView);
        make.left.equalTo(self.leftDateView.mas_right).offset(10);
        make.width.equalTo(@16);
        make.height.equalTo(@1);
    }];
    
    [self.imageBg addSubview:self.searchBtn];
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.right.equalTo(@(-33));
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [self.imageBg addSubview:self.rightDateView];
    [self.rightDateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.right.equalTo(self.searchBtn.mas_left).offset(-10);
        make.width.equalTo(@((SCREEN_WIDTH-66-36-50)/2));
        make.height.equalTo(@40);
    }];
    
    [self.imageBg addSubview:self.bgViewXQ];
    [self.bgViewXQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftDateView.mas_bottom).offset(16);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.height.equalTo(@75);
    }];
    
    [self.bgViewXQ addSubview:self.tableViewXQ];
    [self.tableViewXQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgViewXQ);
        make.width.equalTo(@75);
        make.height.equalTo(@(SCREEN_WIDTH-66));
    }];
    
    [self.imageBg addSubview:self.tableViewCW];
    [self.tableViewCW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgViewXQ.mas_bottom).offset(16);
        make.left.equalTo(@33);
        make.right.equalTo(@(-33));
        make.bottom.equalTo(@16);
    }];
}

#pragma mark - UITableViewDelegate & dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView.tag==0 ? self.dataArray.count:self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0) {
        FinanceHeaderCell *cell = [FinanceHeaderCell cellWithTableView:tableView];
        [cell configWithCell:self.dataArray[indexPath.row]];
        return cell;
    }else{
        if (indexPath.row == 0) {
            FinanceReportCell *cell = [FinanceReportCell cellWithTableView:tableView];
            cell.reportFrame = self.dataArr[indexPath.row];
            WEAKSELF;
            cell.arrowBlock = ^(UIButton * _Nonnull btn) {
                if (btn.selected) {
                    btn.selected = NO;
                }else{
                    btn.selected = YES;
                }
                [weakSelf winLoseArrowBtnClicked];
            };
            return cell;
        }else if (indexPath.row == 1){
            HandlingFeeCell *cell = [HandlingFeeCell cellWithTableView:tableView];
            cell.feeFrame = self.dataArr[indexPath.row];
            WEAKSELF;
            cell.arrowBlock = ^(UIButton * _Nonnull btn) {
                if (btn.selected) {
                    btn.selected = NO;
                }else{
                    btn.selected = YES;
                }
                [weakSelf handlingFeeArrowBtnClicked];
            };
            return cell;
        }
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    if (tableView.tag == 1) {
        FinanceReportFrame *frame = self.dataArr[indexPath.row];
        height = frame.cellHeight;
    }
    return tableView.tag==0 ? 116:height;
}

#pragma mark - PGDatePickerDelegate
-(void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents
{
    if (_isRight) {
        _rightDateView.dateLab.text = [NSString stringWithFormat:@"%ld/%ld/%ld",dateComponents.day,dateComponents.month,dateComponents.year];
    }else{
        _leftDateView.dateLab.text = [NSString stringWithFormat:@"%ld/%ld/%ld",dateComponents.day,dateComponents.month,dateComponents.year];
    }
}

#pragma mark - event
-(void)searchBtnClicked
{
    
}

-(void)leftDateSelected
{
    _isRight = NO;
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.delegate = self;
    datePicker.datePickerMode = PGDatePickerModeDate;
    [self presentViewController:datePickManager animated:false completion:nil];
}

-(void)rightDateSelected
{
    _isRight = YES;
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.delegate = self;
    datePicker.datePickerMode = PGDatePickerModeDate;
    [self presentViewController:datePickManager animated:false completion:nil];
}

-(void)winLoseArrowBtnClicked
{
    FinanceReportFrame *frame = self.dataArr[0];
    FinanceReportModel *model = frame.model;
    if (model.isSel) {
        model.isSel = NO;
    }else{
        model.isSel = YES;
    }
    
    FinanceReportFrame *objFrame = [[FinanceReportFrame alloc]init];
    objFrame.model = model;
    [self.dataArr replaceObjectAtIndex:0 withObject:objFrame];
    [self.tableViewCW reloadData];
}

-(void)handlingFeeArrowBtnClicked
{
    HandlingFeeFrame *frame = self.dataArr[1];
    FinanceReportModel *model = frame.model;
    if (model.isSel) {
        model.isSel = NO;
    }else{
        model.isSel = YES;
    }
    
    HandlingFeeFrame *objFrame = [[HandlingFeeFrame alloc]init];
    objFrame.model = model;
    [self.dataArr replaceObjectAtIndex:1 withObject:objFrame];
    [self.tableViewCW reloadData];
}

#pragma mark - lazy
-(UITableView *)tableViewCW
{
    if (!_tableViewCW) {
        _tableViewCW = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableViewCW.delegate = self;
        _tableViewCW.dataSource = self;
        _tableViewCW.tableFooterView = [[UIView alloc]init];
        _tableViewCW.backgroundColor = [UIColor clearColor];
        _tableViewCW.tag = 1;
        _tableViewCW.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableViewCW;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@{@"title":@"存款总额",@"amount":@"588,235"},@{@"title":@"取款总额",@"amount":@"588,235"},@{@"title":@"红利",@"amount":@"588,235"},@{@"title":@"存款总额",@"amount":@"588,235"},@{@"title":@"存款总额",@"amount":@"588,235"},@{@"title":@"存款总额",@"amount":@"588,235"},@{@"title":@"存款总额",@"amount":@"588,235"}, nil];
    }
    return _dataArray;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        //
        NSArray *arr = @[@{@"title":@"游戏输赢：845,545,235",@"icon":@"icon-game"},@{@"title":@"手续费：845,545,235",@"icon":@"icon-money"},@{@"title":@"手续费：845,545,235",@"icon":@"icon-money"},@{@"title":@"手续费：845,545,235",@"icon":@"icon-money"},@{@"title":@"手续费：845,545,235",@"icon":@"icon-money"},@{@"title":@"手续费：845,545,235",@"icon":@"icon-money"},@{@"title":@"手续费：845,545,235",@"icon":@"icon-money"},@{@"title":@"手续费：845,545,235",@"icon":@"icon-money"}];
        NSArray *typesArr = @[@{@"title":@"银行存款", @"amount":@"126,999", @"rate":@"0.01", @"cost":@"112,888"}, @{@"title":@"第三方存款", @"amount":@"126,999", @"rate":@"0.01", @"cost":@"112,888"}, @{@"title":@"银行取款", @"amount":@"126,999", @"rate":@"0.01", @"cost":@"112,888"},];
        for (int i=0; i<2; i++) {
            FinanceReportModel *model = [[FinanceReportModel alloc]init];
            if (i==0) {
                FinanceReportFrame *frame = [[FinanceReportFrame alloc]init];
                model.platforms = arr;
                model.icon = @"icon-game";
                model.title = @"游戏输赢：845,545,235";
                model.Id = 0;
                frame.model = model;
                [_dataArr addObject:frame];
            }else{
                HandlingFeeFrame *frame = [[HandlingFeeFrame alloc]init];
                model.handlingTypes = typesArr;
                model.icon = @"icon-money";
                model.title = @"手续费：845,545,235";
                model.Id = 1;
                frame.model = model;
                [_dataArr addObject:frame];
            }
        }
    }
    return _dataArr;
}

- (MBImageView*)imageBg
{
    if (!_imageBg) {
        _imageBg = [[MBImageView alloc]initWithFrame:CGRectZero];
        _imageBg.image = [UIImage imageNamed:@"Caiwubg"];
    }
    return _imageBg;
}


-(DateView *)leftDateView
{
    if (!_leftDateView) {
        _leftDateView = [[DateView alloc]initWithFrame:CGRectZero titleType:DateTitleTypeDayMonthAndYear];
        WEAKSELF;
        _leftDateView.dateBlock = ^{
            [weakSelf leftDateSelected];
        };
    }
    return _leftDateView;
}

-(DateView *)rightDateView
{
    if (!_rightDateView) {
        _rightDateView = [[DateView alloc]initWithFrame:CGRectZero titleType:DateTitleTypeDayMonthAndYear];
        WEAKSELF;
        _rightDateView.dateBlock = ^{
            [weakSelf rightDateSelected];
        };
    }
    return _rightDateView;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = RGB(182, 182, 182);
    }
    return _lineView;
}

-(UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_searchBtn setImage:[UIImage imageNamed:@"serchGif@x"] forState:UIControlStateNormal];
        [_searchBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5.7, 5, 5.7)];
        [_searchBtn addTarget:self action:@selector(searchBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}

-(UITableView *)tableViewXQ
{
    if (!_tableViewXQ) {
        _tableViewXQ = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableViewXQ.delegate = self;
        _tableViewXQ.dataSource = self;
        _tableViewXQ.tag = 0;
        _tableViewXQ.tableFooterView = [[UIView alloc]init];
        _tableViewXQ.backgroundColor = [UIColor clearColor];
        _tableViewXQ.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        _tableViewXQ.showsVerticalScrollIndicator = NO;
        _tableViewXQ.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableViewXQ;
}

-(UIView *)bgViewXQ
{
    if (!_bgViewXQ) {
        _bgViewXQ = [[UIView alloc]initWithFrame:CGRectZero];
        _bgViewXQ.backgroundColor = [UIColor clearColor];
    }
    return _bgViewXQ;
}

@end
