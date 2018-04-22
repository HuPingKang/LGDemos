//
//  AdsModel.h
//  LYSSPai
//
//  Created by 刘毅 on 2017/8/13.
//  Copyright © 2017年 halohily.com. All rights reserved.
//
#import "NewsModel.h"
#import "PaidNewsModel.h"
#import <UIKit/UIKit.h>



@interface AdsModel : NSObject

@property (nonatomic, strong) NSArray *AdsData;
@property (nonatomic, assign) CGFloat cellHeight;
+ (instancetype)AdsModelWithArr:(NSArray *)arr;


@end

typedef void(^HomeBlock)(NSArray<NewsModel *>*newsDatas,NSArray<AdsModel *>*adsData,NSArray<PaidNewsModel *>*paidNewsData);
@interface HomeAdapter:NSObject
+(void)setupDataSuccess:(HomeBlock)block;

@end
