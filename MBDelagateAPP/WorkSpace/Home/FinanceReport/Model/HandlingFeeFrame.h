//
//  HandlingFeeFrame.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/26.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FinanceReportModel;
@interface HandlingFeeFrame : NSObject

@property (nonatomic,strong) FinanceReportModel *model;

@property (nonatomic,assign) CGRect mainBgImgViewFrame;
@property (nonatomic,assign) CGRect iconImgViewFrame;
@property (nonatomic,assign) CGRect titleLabFrame;
@property (nonatomic,assign) CGRect arrowBtnFrame;
@property (nonatomic,assign) CGRect cellBtnFrame;
@property (nonatomic,assign) CGRect handlingFeeDetailsViewFrame;
@property (nonatomic,assign) CGRect lineViewFrame;
@property (nonatomic,assign) CGRect typeLabFrame;
@property (nonatomic,assign) CGRect amountLabFrame;
@property (nonatomic,assign) CGRect rateLabFrame;
@property (nonatomic,assign) CGRect costLabFrame;

@property (nonatomic,assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
