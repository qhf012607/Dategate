//
//  CommissionFrame.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/18.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "CommissionFrame.h"
#import "CommissionModel.h"

@implementation CommissionFrame

-(void)setModel:(CommissionModel *)model
{
    _model = model;
    
    //cell的宽度
    CGFloat cellW = SCREEN_WIDTH-66;
    
    //title
    CGFloat titleX = 16;
    CGFloat titleY = 12;
    CGFloat titleW = cellW-59;
    CGFloat titleH = 20;
    self.titileLabFrame=CGRectMake(titleX, titleY, titleW, titleH);
    //selBtn
    CGFloat arrowX = cellW-44.5;
    CGFloat arrowY = 2;
    CGFloat arrowW = 40;
    CGFloat arrowH = 40;
    self.selBtnFrame=CGRectMake(arrowX, arrowY, arrowW, arrowH);
    //cellBtn
    CGFloat cellBtnX = 0;
    CGFloat cellBtnY = 0;
    CGFloat cellBtnW = cellW;
    CGFloat cellBtnH = 43;
    self.cellBtnFrame=CGRectMake(cellBtnX, cellBtnY, cellBtnW, cellBtnH);
    //line
    CGFloat lineX = 16;
    CGFloat lineY = 43;
    CGFloat lineW = cellW-32;
    CGFloat lineH = 1;
    self.lineViewFrame=CGRectMake(lineX, lineY, lineW, lineH);
    
    CGFloat bottomY = 0;
    if (model.isSel) {
        //winLose
        CGFloat winLoseX = 32;
        CGFloat winLoseY = CGRectGetMaxY(self.lineViewFrame)+11;
        CGFloat winLoseW = cellW/2-32;
        CGFloat winLoseH = 20;
        self.winLoseLabFrame = CGRectMake(winLoseX, winLoseY, winLoseW, winLoseH);
        
        //proportion
        CGFloat proportionX = cellW/2+16;
        CGFloat proportionY = CGRectGetMaxY(self.lineViewFrame)+11;
        CGFloat proportionW = cellW/2-32;
        CGFloat proportionH = 20;
        self.proportionLabFrame = CGRectMake(proportionX, proportionY, proportionW, proportionH);
        
        //rake
        CGFloat rakeX = 32;
        CGFloat rakeY = CGRectGetMaxY(self.winLoseLabFrame)+4;
        CGFloat rakeW = cellW/2-32;
        CGFloat rakeH = 20;
        self.rakeLabFrame = CGRectMake(rakeX, rakeY, rakeW, rakeH);
        
        //betting
        CGFloat bettingX = cellW/2+16;
        CGFloat bettingY = CGRectGetMaxY(self.winLoseLabFrame)+4;
        CGFloat bettingW = cellW/2-32;
        CGFloat bettingH = 20;
        self.betingLabFrame = CGRectMake(bettingX, bettingY, bettingW, bettingH);
        
        bottomY = CGRectGetMaxY(self.rakeLabFrame)+10;
    }else {
        bottomY = CGRectGetMaxY(self.lineViewFrame);
    }
    
    //bottomLine
    CGFloat bottomX = 16;
    CGFloat bottomW = cellW-32;
    CGFloat bottomH = 1;
    self.bottomLineViewFrame = CGRectMake(bottomX, bottomY, bottomW, bottomH);
    
    //content整体
    CGFloat mainViewX = 0;
    CGFloat mainViewY = 0;
    CGFloat mainViewW = cellW;
    CGFloat mainViewH = CGRectGetMaxY(self.bottomLineViewFrame);
    self.mainViewFrame=(CGRect){{mainViewX,mainViewY},{mainViewW,mainViewH}};
    
    //cell高度
    _cellHeight=CGRectGetMaxY(self.mainViewFrame);
}

@end
