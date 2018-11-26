//
//  ProjectBillHeadView.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/22.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^dateBtnBlock)(void);
typedef void(^searchBtnBlock)(void);
@interface ProjectBillHeadView : UIView

@property (nonatomic,strong) UILabel *dateLab;

@property (nonatomic,copy) dateBtnBlock dateBtnBlock;
@property (nonatomic,copy) searchBtnBlock searchBtnBlock;

@end

NS_ASSUME_NONNULL_END
