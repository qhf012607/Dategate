//
//  YongjinCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/17.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "DelegateCommissionCell.h"
#import "CommissionFrame.h"
#import "CommissionModel.h"

@interface DelegateCommissionCell ()
@property (nonatomic,strong) UIView *mainView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *selBtn;
@property (nonatomic,strong) UIButton *cellBtn;
@property (nonatomic,strong) UILabel *winLoseLab;
@property (nonatomic,strong) UILabel *proportionLab;
@property (nonatomic,strong) UILabel *rakeLab;
@property (nonatomic,strong) UILabel *bettingLab;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIView *bottomLineView;
@end
@implementation DelegateCommissionCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"commissionCell";
    DelegateCommissionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[DelegateCommissionCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self setupOriginal];
    }
    return self;
}

/**        初始化         */
-(void)setupOriginal
{
    //整体
    UIView *mainView=[[UIView alloc]init];
    mainView.backgroundColor=[UIColor clearColor];
    [self.contentView addSubview:mainView];
    self.mainView=mainView;
    
    //title
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.font = FONT(16);
    titleLab.textColor = RGBA(255, 255, 255, 0.81);
    [mainView addSubview:titleLab];
    self.titleLab=titleLab;
    
    //selBtn
    UIButton *selBtn = [[UIButton alloc]init];
    [selBtn setImage:[UIImage imageNamed:@"arrowDown"] forState:UIControlStateNormal];
    [selBtn setImage:[UIImage imageNamed:@"arrowUp"] forState:UIControlStateSelected];
    [selBtn setImageEdgeInsets:UIEdgeInsetsMake(16, 11.5, 16, 11.5)];
    [mainView addSubview:selBtn];
    self.selBtn = selBtn;
    
    //cellBtn
    UIButton *cellBtn = [[UIButton alloc]init];
    [cellBtn addTarget:self action:@selector(arrowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:cellBtn];
    self.cellBtn = cellBtn;
    
    //line
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBA(255, 255, 255, 0.1);
    [mainView addSubview:lineView];
    self.lineView = lineView;
    
    //winLose
    UILabel *winLoseLab = [[UILabel alloc]init];
    winLoseLab.font = FONT(12);
    winLoseLab.textColor = COLORHEX(@"b8b7b8");
    [mainView addSubview:winLoseLab];
    self.winLoseLab = winLoseLab;
    
    //proportion
    UILabel *proportionLab = [[UILabel alloc]init];
    proportionLab.font = FONT(12);
    proportionLab.textColor = COLORHEX(@"b8b7b8");
    [mainView addSubview:proportionLab];
    self.proportionLab = proportionLab;
    
    //rake
    UILabel *rakeLab = [[UILabel alloc]init];
    rakeLab.font = FONT(12);
    rakeLab.textColor = COLORHEX(@"b8b7b8");
    [mainView addSubview:rakeLab];
    self.rakeLab = rakeLab;
    
    //betting
    UILabel *bettingLab = [[UILabel alloc]init];
    bettingLab.font = FONT(12);
    bettingLab.textColor = COLORHEX(@"b8b7b8");
    [mainView addSubview:bettingLab];
    self.bettingLab = bettingLab;
    
    //bottomLine
    UIView *bottomLineView = [[UIView alloc]init];
    bottomLineView.backgroundColor = RGBA(255, 255, 255, 0.1);
    [mainView addSubview:bottomLineView];
    self.bottomLineView = bottomLineView;
}

-(void)setCommissionFrame:(CommissionFrame *)commissionFrame
{
    _commissionFrame = commissionFrame;
    CommissionModel *model = commissionFrame.model;
    
    //整体
    self.mainView.frame = commissionFrame.mainViewFrame;
    
    //name
    self.titleLab.frame = commissionFrame.titileLabFrame;
    self.titleLab.text = model.title;
    
    //selBtn
    self.selBtn.frame = commissionFrame.selBtnFrame;
    self.selBtn.selected = model.isSel;
    
    //cellBtn
    self.cellBtn.frame = commissionFrame.cellBtnFrame;
    self.cellBtn.selected = model.isSel;
    
    //line
    self.lineView.frame = commissionFrame.lineViewFrame;
    
    if (model.isSel) {
        self.winLoseLab.hidden = NO;
        self.proportionLab.hidden = NO;
        self.rakeLab.hidden = NO;
        self.bettingLab.hidden = NO;
        self.bottomLineView.hidden = NO;
        //winLose
        self.winLoseLab.frame = commissionFrame.winLoseLabFrame;
        self.winLoseLab.text = @"公司输赢：8888";
        
        //proportion
        self.proportionLab.frame = commissionFrame.proportionLabFrame;
        self.proportionLab.text = @"抽佣比例：8888";
        
        //rake
        self.rakeLab.frame = commissionFrame.rakeLabFrame;
        self.rakeLab.text = @"输赢抽佣：6666";
        
        //betting
        self.bettingLab.frame = commissionFrame.betingLabFrame;
        self.bettingLab.text = @"有效投注：8888";
        
        //bottomLine
        self.bottomLineView.frame = commissionFrame.bottomLineViewFrame;
    }else{
        self.winLoseLab.hidden = YES;
        self.proportionLab.hidden = YES;
        self.rakeLab.hidden = YES;
        self.bettingLab.hidden = YES;
        self.bottomLineView.hidden = YES;
    }
    
}

#pragma mark - event
-(void)arrowBtnClicked:(UIButton *)btn
{
    if (btn.selected) {
        btn.selected = NO;
        _selBtn.selected = NO;
        _commissionFrame.model.isSel = NO;
    }else{
        btn.selected = YES;
        _selBtn.selected = YES;
        _commissionFrame.model.isSel = YES;
    }
    //
    self.arrowBlock(_commissionFrame);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
