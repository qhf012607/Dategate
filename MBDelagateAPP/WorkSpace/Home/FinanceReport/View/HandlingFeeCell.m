//
//  HandlingFeeCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/26.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "HandlingFeeCell.h"
#import "HandlingFeeFrame.h"
#import "FinanceReportModel.h"

@interface HandlingFeeCell ()
@property (nonatomic,strong) UIImageView *bgImgView;
@property (nonatomic,strong) UIImageView *iconImgView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *arrowBtn;
@property (nonatomic,strong) UIButton *cellBtn;
@property (nonatomic,strong) UIView *handlingFeeDetailsView;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UILabel *typeLab;
@property (nonatomic,strong) UILabel *amountLab;
@property (nonatomic,strong) UILabel *rateLab;
@property (nonatomic,strong) UILabel *costLab;
@end
@implementation HandlingFeeCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"handlingFeeCell";
    HandlingFeeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HandlingFeeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
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
    
    //type
    UILabel *typeLab = [[UILabel alloc]init];
    typeLab.font = FONT(13);
    typeLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:typeLab];
    self.typeLab = typeLab;
    
    //amount
    UILabel *amountLab = [[UILabel alloc]init];
    amountLab.font = FONT(13);
    amountLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:amountLab];
    self.amountLab = amountLab;
    
    //rate
    UILabel *rateLab = [[UILabel alloc]init];
    rateLab.font = FONT(13);
    rateLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:rateLab];
    self.rateLab = rateLab;
    
    //cost
    UILabel *costLab = [[UILabel alloc]init];
    costLab.font = FONT(13);
    costLab.textColor = RGB(255, 255, 255);
    [mainBgImgView addSubview:costLab];
    self.costLab = costLab;
    
    //detailsView
    UIView *handlingFeeDetailsView=[[UIView alloc]init];
    handlingFeeDetailsView.backgroundColor = [UIColor clearColor];
    [mainBgImgView addSubview:handlingFeeDetailsView];
    self.handlingFeeDetailsView = handlingFeeDetailsView;
}

-(void)setFeeFrame:(HandlingFeeFrame *)feeFrame
{
    _feeFrame = feeFrame;
    FinanceReportModel *model = feeFrame.model;
    
    //整体
    self.bgImgView.frame = feeFrame.mainBgImgViewFrame;
    
    //icon
    self.iconImgView.frame = feeFrame.iconImgViewFrame;
    self.iconImgView.image = [UIImage imageNamed:model.icon];
    
    //title
    self.titleLab.frame = feeFrame.titleLabFrame;
    self.titleLab.text = model.title;
    
    //arrowBtn
    self.arrowBtn.frame = feeFrame.arrowBtnFrame;
    self.arrowBtn.selected = model.isSel;
    
    //cellBtn
    self.cellBtn.frame = feeFrame.cellBtnFrame;
    self.cellBtn.selected = model.isSel;
    
    if (model.isSel && model.handlingTypes.count>0) {
        self.lineView.hidden = NO;
        self.typeLab.hidden = NO;
        self.amountLab.hidden = NO;
        self.rateLab.hidden = NO;
        self.costLab.hidden = NO;
        self.handlingFeeDetailsView.hidden = NO;
        [self.handlingFeeDetailsView removeAllSubviews];
        //line
        self.lineView.frame = feeFrame.lineViewFrame;
        //type
        self.typeLab.frame = feeFrame.typeLabFrame;
        self.typeLab.text = @"类型";
        //amount
        self.amountLab.frame = feeFrame.amountLabFrame;
        self.amountLab.text = @"金额";
        //rate
        self.rateLab.frame = feeFrame.rateLabFrame;
        self.rateLab.text = @"费率";
        //cost
        self.costLab.frame = feeFrame.costLabFrame;
        self.costLab.text = @"费用";
        //details
        self.handlingFeeDetailsView.frame = feeFrame.handlingFeeDetailsViewFrame;
        for (int i =0; i<model.handlingTypes.count; i++) {
            //type
            UILabel *typeDetailLab = [[UILabel alloc]initWithFrame:CGRectMake(35, i*20, feeFrame.typeLabFrame.size.width, 20)];
            typeDetailLab.text = model.handlingTypes[i][@"title"];
            typeDetailLab.textColor = RGBA(255, 255, 255, 0.64);
            typeDetailLab.font = FONT(12);
            [self.handlingFeeDetailsView addSubview:typeDetailLab];
            //amount
            UILabel *amountDetailLab = [[UILabel alloc]initWithFrame:CGRectMake(35+feeFrame.typeLabFrame.size.width+5, i*20, feeFrame.typeLabFrame.size.width, 20)];
            amountDetailLab.text = model.handlingTypes[i][@"amount"];            amountDetailLab.textColor = RGBA(255, 255, 255, 0.64);
            amountDetailLab.font = FONT(12);
            [self.handlingFeeDetailsView addSubview:amountDetailLab];
            //rate
            UILabel *rateDetailLab = [[UILabel alloc]initWithFrame:CGRectMake(35+(feeFrame.typeLabFrame.size.width+5)*2, i*20, feeFrame.typeLabFrame.size.width, 20)];
            rateDetailLab.text = model.handlingTypes[i][@"rate"];
            rateDetailLab.textColor = RGBA(255, 255, 255, 0.64);
            rateDetailLab.font = FONT(12);
            [self.handlingFeeDetailsView addSubview:rateDetailLab];
            //cost
            UILabel *costDetailLab = [[UILabel alloc]initWithFrame:CGRectMake(35+(feeFrame.typeLabFrame.size.width+5)*3, i*20, feeFrame.typeLabFrame.size.width, 20)];
            costDetailLab.text = model.handlingTypes[i][@"cost"];
            costDetailLab.textColor = RGBA(255, 255, 255, 0.64);
            costDetailLab.font = FONT(12);
            [self.handlingFeeDetailsView addSubview:costDetailLab];
        }
    }else{
        self.lineView.hidden = YES;
        self.typeLab.hidden = YES;
        self.amountLab.hidden = YES;
        self.rateLab.hidden = YES;
        self.costLab.hidden = YES;
        self.handlingFeeDetailsView.hidden = YES;
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
