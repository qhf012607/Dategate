//
//  CommissionModel.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/18.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommissionModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *winLose;
@property (nonatomic,copy) NSString *proportion;
@property (nonatomic,copy) NSString *rake;
@property (nonatomic,copy) NSString *betting;
@property (nonatomic,assign) BOOL isSel;
@property (nonatomic,assign) NSInteger Id;
@end

NS_ASSUME_NONNULL_END
