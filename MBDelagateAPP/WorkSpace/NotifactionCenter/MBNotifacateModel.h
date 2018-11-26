//
//  MBNotifacateModel.h
//  MBDelagateAPP
//
//  Created by rhonin on 2018/10/24.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBNotifacateModel : NSObject

@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *deleted;

@end

NS_ASSUME_NONNULL_END
