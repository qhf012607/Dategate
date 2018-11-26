//
//  DHNetWork.m
//  MXProject
//
//  Created by Kamael on 2018/7/7.
//  Copyright © 2018年 olin. All rights reserved.
//

#import "PRNetWork.h"

@implementation PRNetWork

/** 首页 */
+ (RACSignal *)MJHomeWith:(NSDictionary *)dict{
    NSString *page = dict[@"page"];
    NSString *url = [NSString stringWithFormat:@"/matchData/appChannelList_2127885_%@.json",page];
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}

+ (RACSignal *)MJArticleDetailWith:(NSDictionary *)dict{
    NSString *numarticleid = dict[@"numarticleid"];
    NSString *url = [NSString stringWithFormat:@"/news/appArticleDetail_%@.json",numarticleid];
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}

+ (RACSignal *)MJArticleListWith:(NSDictionary *)dict{
    NSString *page = dict[@"page"];
    NSString *url = [NSString stringWithFormat:@"/matchData/appNewsList_%@.json",page];
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}

+ (RACSignal *)MJVideoListWith:(NSDictionary *)dict{
    NSString *numarticleid = dict[@"numarticleid"];
    NSString *url = [NSString stringWithFormat:@"/play/appArticleDetail_%@.json",numarticleid];
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}
//GET /matchinfo/app/matchinfo_35902833.json HTTP/1.1
//GET /matchData/1097/appMatchView_35902833.json HTTP/1.1
+ (RACSignal *)MJMatchInfoWith:(NSDictionary *)dict{
    NSString *matchId = dict[@"matchId"];
    NSString *leagueid = dict[@"leagueid"];
    NSString *url = [NSString stringWithFormat:@"/matchData/%@/appMatchView_%@.json",leagueid,matchId];
//    NSString *url = [NSString stringWithFormat:@"/matchinfo/app/matchinfo_%@.json",matchId];
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}
/** 赛程 */
+ (RACSignal *)MJFixtureWith:(NSDictionary *)dict{
    NSString *page = dict[@"page"];
    NSString *url = [NSString stringWithFormat:@"/matchData/appMatchList_recommend_%@.json",page];
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}

#pragma mark - 数据

+ (RACSignal *)MJDataListWith:(NSDictionary *)dict categoryNum:(NSString *)categoryNum categoryKey:(NSString *) key
{
    
    NSString *url = [NSString stringWithFormat:@"/leagueData/%@/appRankList_%@.json",categoryNum,key];
    
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}

/** 前两天的赛程 */
+ (RACSignal *)MJFixtureUpWith:(NSDictionary *)dict{
    NSString *page = dict[@"page"];
    NSString *url = [NSString stringWithFormat:@"/matchData/appMatchList_recommend_up_%@.json",page];
    return [[RACRequest getDataWithUrl:url dic:nil] map:^id(NSDictionary *value) {
        return value;
    }];
}

@end

