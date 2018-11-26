//
//  HandlingFeeFrame.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/26.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "HandlingFeeFrame.h"
#import "FinanceReportModel.h"

@implementation HandlingFeeFrame

-(void)setModel:(FinanceReportModel *)model
{
    _model = model;
    
    //cell的宽度
    CGFloat cellW = SCREEN_WIDTH-66;
    
    //icon
    CGFloat iconX = 14;
    CGFloat iconY = 10;
    CGFloat iconW = 20;
    CGFloat iconH = 20;
    self.iconImgViewFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //title
    CGFloat titleX = CGRectGetMaxX(self.iconImgViewFrame)+14;
    CGFloat titleY = 10;
    CGFloat titleW = cellW-85;
    CGFloat titleH = 20;
    self.titleLabFrame = CGRectMake(titleX, titleY, titleW, titleH);
    //arrowBtn
    CGFloat arrowX = cellW-44.5;
    CGFloat arrowY = 0;
    CGFloat arrowW = 40;
    CGFloat arrowH = 40;
    self.arrowBtnFrame=CGRectMake(arrowX, arrowY, arrowW, arrowH);
    //cellBtn
    CGFloat cellBtnX = 0;
    CGFloat cellBtnY = 0;
    CGFloat cellBtnW = cellW;
    CGFloat cellBtnH = 39;
    self.cellBtnFrame=CGRectMake(cellBtnX, cellBtnY, cellBtnW, cellBtnH);
    
    CGFloat mainH = 0;
    if (model.handlingTypes.count>0 && model.isSel==YES) {
        //line
        CGFloat lineX = 5;
        CGFloat lineY = CGRectGetMaxY(self.cellBtnFrame);
        CGFloat lineW = cellW-10;
        CGFloat lineH = 1;
        self.lineViewFrame = CGRectMake(lineX, lineY, lineW, lineH);
        //type
        CGFloat typeX = 35;
        CGFloat typeY = CGRectGetMaxY(self.lineViewFrame)+16;
        CGFloat typeW = (cellW-85)/4;
        CGFloat typeH = 13;
        self.typeLabFrame = CGRectMake(typeX, typeY, typeW, typeH);
        //amount
        CGFloat amountX = CGRectGetMaxX(self.typeLabFrame)+5;
        CGFloat amountY = CGRectGetMaxY(self.lineViewFrame)+16;
        CGFloat amountW = (cellW-85)/4;
        CGFloat amountH = 13;
        self.amountLabFrame = CGRectMake(amountX, amountY, amountW, amountH);
        //rate
        CGFloat rateX = CGRectGetMaxX(self.amountLabFrame)+5;
        CGFloat rateY = CGRectGetMaxY(self.lineViewFrame)+16;
        CGFloat rateW = (cellW-85)/4;
        CGFloat rateH = 13;
        self.rateLabFrame = CGRectMake(rateX, rateY, rateW, rateH);
        //cost
        CGFloat costX = CGRectGetMaxX(self.rateLabFrame)+5;
        CGFloat costY = CGRectGetMaxY(self.lineViewFrame)+16;
        CGFloat costW = (cellW-85)/4;
        CGFloat costH = 13;
        self.costLabFrame = CGRectMake(costX, costY, costW, costH);
        
        //handlingFeeDetails
        CGFloat detailsX = 0;
        CGFloat detailsY = CGRectGetMaxY(self.typeLabFrame)+10;
        CGFloat detailsW = cellW;
        CGFloat detailsH = model.handlingTypes.count*20;
        self.handlingFeeDetailsViewFrame = CGRectMake(detailsX, detailsY, detailsW, detailsH);
        
        mainH = CGRectGetMaxY(self.handlingFeeDetailsViewFrame)+16;
    }else {
        mainH = CGRectGetMaxY(self.cellBtnFrame)+1;
    }
    //content整体
    CGFloat mainViewX = 0;
    CGFloat mainViewY = 0;
    CGFloat mainViewW = cellW;
    CGFloat mainViewH = mainH;
    self.mainBgImgViewFrame = (CGRect){{mainViewX,mainViewY},{mainViewW,mainViewH}};
    //cell高度
    _cellHeight=CGRectGetMaxY(self.mainBgImgViewFrame)+16;
}

@end
