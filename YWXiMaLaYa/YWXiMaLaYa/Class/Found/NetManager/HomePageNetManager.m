//
//  HomePageNetManager.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "HomePageNetManager.h"
#import "HomePageModel.h"

@implementation HomePageNetManager

//http://mobile.ximalaya.com/mobile/discovery/v1/recommends?channel=and-f5&device=ios&includeActivity=true&includeSpecial=true&scale=2&version=4.3.20.2

+ (id)getHomePageIntroduceCompletionHandle:(void (^)(id, NSError *))completed{

    //获取数据，json转模型
    return [self GET:YHomeURLPath parameters:@{
                                               YURLChannel,
                                               YURLVersion,
                                               YURLDevice,
                                               YURLSpecial,
                                               YURLActivity,
                                               YURLScale
                                               }
    completionHandle:^(id responseObject, NSError *error) {
        completed([HomePageModel mj_objectWithKeyValues:responseObject], error);
    }];
}

@end
