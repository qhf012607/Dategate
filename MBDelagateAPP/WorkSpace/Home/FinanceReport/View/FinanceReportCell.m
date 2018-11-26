//
//  FinanceReportCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/23.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "FinanceReportCell.h"
#import "FinanceReportFrame.h"
#import "FinanceReportModel.h"

@interface FinanceReportCell ()
@property (nonatomic,strong) UIImageView *bgImgView;
@property (nonatomic,strong) UIImageView *iconImgView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *arrowBtn;
@property (nonatomic,strong) UIButton *cellBtn;
@property (nonatomic,strong) UIView *winLoseDetailsView;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UILabel *paltformLab;
@property (nonatomic,strong) UILabel *winLoseLab;
@property (nonatomic,strong) UILabel *bettingLab;
@end
@implementation FinanceReportCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"financeReportCell";
    FinanceReportCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[FinanceReportCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupOriginal];
    }
    return self;
}

/**        初始化         */
-(void)setupOriginal
{
    //图片拉伸
    UIImage *bgImg=[UIImage imageNamed:@"liest-bg"];
    bgImg=[bgImg resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    //整体
    UIImageView *mainBgImgView=[[UIImageView alloc]init];
    mainBgImgView.image = bgImg;
    mainBgImgView.userInteractionEnabled = YES;
    mainBgImgView.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:mainBgImgView];
    self.bgImgView=mainBgImgView;
    
    //icon
    UIImageView *iconImgView = [[UIImageView alloc]init];
    [mainBgImgView addSubview:iconImgView];
    self.iconImgView=iconImgView;
    
    //title
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.font = FONT(15);
    titleLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:titleLab];
    self.titleLab=titleLab;
    
    //arrowBtn
    UIButton *arrowBtn = [[UIButton alloc]init];
    [arrowBtn setImage:[UIImage imageNamed:@"arrowDown"] forState:UIControlStateNormal];
    [arrowBtn setImage:[UIImage imageNamed:@"arrowUp"] forState:UIControlStateSelected];
    [arrowBtn setImageEdgeInsets:UIEdgeInsetsMake(16, 11.5, 16, 11.5)];
    [mainBgImgView addSubview:arrowBtn];
    self.arrowBtn = arrowBtn;
    
    //cellBtn
    UIButton *cellBtn = [[UIButton alloc]init];
    [cellBtn addTarget:self action:@selector(arrowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [mainBgImgView addSubview:cellBtn];
    self.cellBtn = cellBtn;
    
    //line
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBA(176, 176, 176, 0.25);
    [mainBgImgView addSubview:lineView];
    self.lineView = lineView;
    
    //platform
    UILabel *paltformLab = [[UILabel alloc]init];
    paltformLab.font = FONT(13);
    paltformLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:paltformLab];
    self.paltformLab = paltformLab;
    
    //winLose
    UILabel *winLoseLab = [[UILabel alloc]init];
    winLoseLab.font = FONT(13);
    winLoseLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:winLoseLab];
    self.winLoseLab = winLoseLab;
    
    //betting
    UILabel *bettingLab = [[UILabel alloc]init];
    bettingLab.font = FONT(13);
    bettingLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:bettingLab];
    self.bettingLab = bettingLab;
    
    //detailsView
    UIView *winLoseDetailsView=[[UIView alloc]init];
    winLoseDetailsView.backgroundColor = [UIColor clearColor];
    [mainBgImgView addSubview:winLoseDetailsView];
    self.winLoseDetailsView = winLoseDetailsView;
}

-(void)setReportFrame:(FinanceReportFrame *)reportFrame
{
    _reportFrame = reportFrame;
    FinanceReportModel *model = reportFrame.model;
    
    //整体
    self.bgImgView.frame = reportFrame.mainBgImgViewFrame;
    
    //icon
    self.iconImgView.frame = reportFrame.iconImgViewFrame;
    self.iconImgView.image = [UIImage imageNamed:model.icon];
    
    //title
    self.titleLab.frame = reportFrame.titleLabFrame;
    self.titleLab.text = model.title;
    
    //arrowBtn
    self.arrowBtn.frame = reportFrame.arrowBtnFrame;
    self.arrowBtn.selected = model.isSel;
    
    //cellBtn
    self.cellBtn.frame = reportFrame.cellBtnFrame;
    self.cellBtn.selected = model.isSel;
    
    if (model.isSel && model.platforms.count>0) {
        self.lineView.hidden = NO;
        self.paltformLab.hidden = NO;
        self.winLoseLab.hidden = NO;
        self.bettingLab.hidden = NO;
        self.winLoseDetailsView.hidden = NO;
        [self.winLoseDetailsView removeAllSubviews];
        //line
        self.lineView.frame = reportFrame.lineViewFrame;
        //platform
        self.paltformLab.frame = reportFrame.platformLabFrame;
        self.paltformLab.text = @"游戏平台";
        //winLose
        self.winLoseLab.frame = reportFrame.winLoseLabFrame;
        self.winLoseLab.text = @"公司输赢";
        //betting
        self.bettingLab.frame = reportFrame.bettingLabFrame;
        self.bettingLab.text = @"有效投注";
        //details
        self.winLoseDetailsView.frame = reportFrame.winLoseDetailsViewFrame;
        for (int i =0; i<model.platforms.count; i++) {
            //platform
            UILabel *platformDetailLab = [[UILabel alloc]initWithFrame:CGRectMake(35, i*20, reportFrame.platformLabFrame.size.width, 20)];
            platformDetailLab.text = @"万博电竞";
            platformDetailLab.textColor = RGBA(255, 255, 255, 0.64);
            platformDetailLab.font = FONT(12);
            [self.winLoseDetailsView addSubview:platformDetailLab];
            //winLose
            UILabel *winLoseDetailLab = [[UILabel alloc]initWithFrame:CGRectMake(35+reportFrame.platformLabFrame.size.width+5, i*20, reportFrame.platformLabFrame.size.width, 20)];
            winLoseDetailLab.text = @"377,889,234";
            winLoseDetailLab.textColor = RGBA(255, 255, 255, 0.64);
            winLoseDetailLab.font = FONT(12);
            [self.winLoseDetailsView addSubview:winLoseDetailLab];
            //betting
            UILabel *bettingDetailLab = [[UILabel alloc]initWithFrame:CGRectMake(35+(reportFrame.platformLabFrame.size.width+5)*2, i*20, reportFrame.platformLabFrame.size.width, 20)];
            bettingDetailLab.text = @"377,889,234";
            bettingDetailLab.textColor = RGBA(255, 255, 255, 0.64);
            bettingDetailLab.font = FONT(12);
            [self.winLoseDetailsView addSubview:bettingDetailLab];
        }
    }else{
        self.lineView.hidden = YES;
        self.paltformLab.hidden = YES;
        self.winLoseLab.hidden = YES;
        self.bettingLab.hidden = YES;
        self.winLoseDetailsView.hidden = YES;
    }
    
}

#pragma mark -
-(void)setupOriginall
{
    [self.contentView addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@44);
    }];
    
    [self.bgImgView addSubview:self.arrowBtn];
    [self.arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImgView);
        make.right.equalTo(@2.5);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [self.bgImgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImgView);
        make.left.equalTo(@14);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.bgImgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImgView);
        make.left.equalTo(self.iconImgView.mas_right).offset(14);
        make.height.equalTo(@15);
    }];
    
    [self.bgImgView addSubview:self.cellBtn];
    [self.cellBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

#pragma mark - event
-(void)arrowBtnClicked:(UIButton *)btn
{
    self.arrowBlock(_arrowBtn);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
