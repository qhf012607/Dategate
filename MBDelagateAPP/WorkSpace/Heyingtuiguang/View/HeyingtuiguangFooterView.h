//
//  HeyingtuiguangFooterView.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/17.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^itemsDidSelectBlock)(NSInteger row);
@interface HeyingtuiguangFooterView : UIView

@property (nonatomic,copy) itemsDidSelectBlock itemsDidSelectBlock;

@end

NS_ASSUME_NONNULL_END
