//
//  CommissionFrame.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/18.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CommissionModel;
@interface CommissionFrame : NSObject

@property (nonatomic,strong) CommissionModel *model;

@property (nonatomic,assign) CGRect mainViewFrame;
@property (nonatomic,assign) CGRect titileLabFrame;
@property (nonatomic,assign) CGRect selBtnFrame;
@property (nonatomic,assign) CGRect cellBtnFrame;
@property (nonatomic,assign) CGRect lineViewFrame;
@property (nonatomic,assign) CGRect winLoseLabFrame;
@property (nonatomic,assign) CGRect proportionLabFrame;
@property (nonatomic,assign) CGRect rakeLabFrame;
@property (nonatomic,assign) CGRect betingLabFrame;
@property (nonatomic,assign) CGRect bottomLineViewFrame;

@property (nonatomic,assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
