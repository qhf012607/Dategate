//
//  FinanceReportModel.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/25.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FinanceReportModel : NSObject

@property (nonatomic,assign) BOOL isSel;
@property (nonatomic,  copy) NSArray *platforms;
@property (nonatomic,  copy) NSString *icon;
@property (nonatomic,  copy) NSString *title;
@property (nonatomic,assign) NSInteger Id;
@property (nonatomic,  copy) NSArray *handlingTypes;

@end

NS_ASSUME_NONNULL_END
