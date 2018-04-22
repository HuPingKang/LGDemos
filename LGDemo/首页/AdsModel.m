//
//  AdsModel.m
//  LYSSPai
//
//  Created by 刘毅 on 2017/8/13.
//  Copyright © 2017年 halohily.com. All rights reserved.
//


#import "Define.h"
#import "AdsModel.h"

@implementation AdsModel

+ (instancetype)AdsModelWithArr:(NSArray *)arr
{
    AdsModel *model = [[self alloc] init];
    model.AdsData = arr;
    model.cellHeight = (LYScreenWidth - 50) * 0.53125 + 40;
    return model;
}
@end

@implementation HomeAdapter


+(void)setupDataSuccess:(HomeBlock)block
{
    NSMutableArray<NewsModel *>*newsData = [NSMutableArray array];
    NSMutableArray<AdsModel *>*adsData = [NSMutableArray array];
    NSMutableArray<PaidNewsModel *>*paidNewsData = [NSMutableArray array];
    //    为模拟网络获取数据时的延迟，这里手动设置延迟0.8s，否则loadingview一闪而过
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        NSData *JSONDataNews = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"newsData" ofType:@"json"]];
        
        NSDictionary *newsDataDic = [NSJSONSerialization JSONObjectWithData:JSONDataNews options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *newsArray = [newsDataDic objectForKey:@"data"];
        for (NSDictionary *dict in newsArray) {
            NewsModel *newsModel = [NewsModel NewsModelWithDic:dict];
            
            [newsData addObject:newsModel];
        }
        
        NSData *JSONDataAds = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"adsData" ofType:@"json"]];
        
        NSDictionary *adsDataDic = [NSJSONSerialization JSONObjectWithData:JSONDataAds options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray *adsArray = adsDataDic[@"data"];
        AdsModel *adsModel = [AdsModel AdsModelWithArr:adsArray];
        [adsData addObject:adsModel];
        
        NSData *JSONDataPaid = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"paidNewsData" ofType:@"json"]];
        
        NSDictionary *paidDataDic = [NSJSONSerialization JSONObjectWithData:JSONDataPaid options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray *paidNewsArray = paidDataDic[@"data"];
        PaidNewsModel *paidModel = [PaidNewsModel PaidNewsModelWithArr:paidNewsArray];
        [paidNewsData addObject:paidModel];
        
        block([NSArray arrayWithArray:newsData],[NSArray arrayWithArray:adsData],[NSArray arrayWithArray:paidNewsData]);
        
    });
}


@end

