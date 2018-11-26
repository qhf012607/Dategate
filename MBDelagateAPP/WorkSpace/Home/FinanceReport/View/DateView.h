//
//  DateView.h
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/23.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    DateTitleTypeMonthAndYear,
    DateTitleTypeDayMonthAndYear,
} DateTitleType;
typedef void(^dateBlock)(void);
@interface DateView : UIView

-(instancetype)initWithFrame:(CGRect)frame titleType:(NSInteger)type;

@property (nonatomic,assign) DateTitleType dateTitleType;

@property (nonatomic,strong) UILabel *dateLab;

@property (nonatomic,copy) dateBlock dateBlock;

@end

NS_ASSUME_NONNULL_END
