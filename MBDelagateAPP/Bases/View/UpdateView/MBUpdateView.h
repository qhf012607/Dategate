//
//  MBUpdateView.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/31.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^updateBlock)(void);
typedef void(^updateCancelBlock)(void);
@interface MBUpdateView : UIView

@property (nonatomic,copy) updateBlock updateBlock;
@property (nonatomic,copy) updateCancelBlock cancelBlock;

@end

NS_ASSUME_NONNULL_END
