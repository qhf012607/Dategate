//
//  FinanceReportFrame.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/25.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "FinanceReportFrame.h"
#import "FinanceReportModel.h"

@implementation FinanceReportFrame

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
    if (model.platforms.count>0 && model.isSel==YES) {
        //line
        CGFloat lineX = 5;
        CGFloat lineY = CGRectGetMaxY(self.cellBtnFrame);
        CGFloat lineW = cellW-10;
        CGFloat lineH = 1;
        self.lineViewFrame = CGRectMake(lineX, lineY, lineW, lineH);
        //platform
        CGFloat platformX = 35;
        CGFloat platformY = CGRectGetMaxY(self.lineViewFrame)+16;
        CGFloat platformW = (cellW-80)/3;
        CGFloat platformH = 13;
        self.platformLabFrame = CGRectMake(platformX, platformY, platformW, platformH);
        //winLose
        CGFloat winLoseX = CGRectGetMaxX(self.platformLabFrame)+5;
        CGFloat winLoseY = CGRectGetMaxY(self.lineViewFrame)+16;
        CGFloat winLoseW = (cellW-80)/3;
        CGFloat winLoseH = 13;
        self.winLoseLabFrame = CGRectMake(winLoseX, winLoseY, winLoseW, winLoseH);
        //betting
        CGFloat bettingX = CGRectGetMaxX(self.winLoseLabFrame)+5;
        CGFloat bettingY = CGRectGetMaxY(self.lineViewFrame)+16;
        CGFloat bettingW = (cellW-80)/3;
        CGFloat bettingH = 13;
        self.bettingLabFrame = CGRectMake(bettingX, bettingY, bettingW, bettingH);
        
        //winLoseDetails
        CGFloat detailsX = 0;
        CGFloat detailsY = CGRectGetMaxY(self.platformLabFrame)+10;
        CGFloat detailsW = cellW;
        CGFloat detailsH = model.platforms.count*20;
        self.winLoseDetailsViewFrame = CGRectMake(detailsX, detailsY, detailsW, detailsH);
        
        mainH = CGRectGetMaxY(self.winLoseDetailsViewFrame)+16;
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
