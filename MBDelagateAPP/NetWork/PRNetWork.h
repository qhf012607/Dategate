//
//  DHNetWork.h
//  MXProject
//
//  Created by Kamael on 2018/7/7.
//  Copyright © 2018年 olin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACRequest.h"

@interface PRNetWork : NSObject

/**
 首页
 
 @param dict 入参
 
 @return 请求结果信号
 */
+ (RACSignal *)MJHomeWith:(NSDictionary *)dict;
/**
 资讯详情
 
 @param dict 入参
 
 @return 请求结果信号
 */
+ (RACSignal *)MJArticleDetailWith:(NSDictionary *)dict;
/**
 资讯列表
 
 @param dict 入参
 
 @return 请求结果信号
 */
+ (RACSignal *)MJArticleListWith:(NSDictionary *)dict;

/**
 视频列表
 
 @param dict 入参
 
 @return 请求结果信号
 */
+ (RACSignal *)MJVideoListWith:(NSDictionary *)dict;
/**
 首页精彩赛事
 
 @param dict 入参
 
 @return 请求结果信号
 */
+ (RACSignal *)MJMatchInfoWith:(NSDictionary *)dict;


/**
 赛程

 @param dict 入参
 @return response singal
 */
+ (RACSignal *)MJFixtureWith:(NSDictionary *)dict;


/**
 数据
 //英超 = 239 ，卡拉宝杯 = 764，国王杯 = 731 ， 英冠 = 406， 英甲=523 ，英乙=587，
 积分榜 http://json.ssports.com/leagueData/239/appRankList_score.json
 射手榜    appRankList_shooter.json
 助攻榜    appRankList_assist.json
 射门榜    appRankList_numsc.json
 传球     appRankList_numpn.json
 抢断     appRankList_numsbtn.json
 扑救     appRankList_numgsn.json
 红牌     appRankList_numrn.json
 黄牌     appRankList_numyn.json
 犯规     appRankList_numfn.json
 越位     appRankList_numon.json
 @param dict 入参
 @return response singal
 */
+ (RACSignal *)MJDataListWith:(NSDictionary *)dict categoryNum:(NSString *)categoryNum categoryKey:(NSString *) key;


+ (RACSignal *)MJFixtureUpWith:(NSDictionary *)dict;

@end
