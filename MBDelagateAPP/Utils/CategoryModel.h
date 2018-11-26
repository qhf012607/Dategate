//
//  CategrayModel.h
//  Project
//
//  Created by olin on 2018/7/20.
//  Copyright © 2018年 Kamael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property (nonatomic ,strong) NSString * title;
@property (nonatomic, strong) NSString * key;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
