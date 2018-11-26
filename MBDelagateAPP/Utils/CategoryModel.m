//
//  CategrayModel.m
//  Project
//
//  Created by olin on 2018/7/20.
//  Copyright © 2018年 Kamael. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.key = dic[@"key"];
    }
    return self;
}


@end
