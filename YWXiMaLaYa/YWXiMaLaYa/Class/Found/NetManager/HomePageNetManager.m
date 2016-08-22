//
//  HomePageNetManager.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "HomePageNetManager.h"

#import "HomePageModel.h"

//?前网址
#define YHomeURLPath @"http://mobile.ximalaya.com/mobile/discovery/v1/recommends"

//kHomeURLPath的参数
#define YURLChannel @"channel":@"and-f5"
#define YURLVersion @"version":@"4.3.26.2"
#define YURLDevice @"device":@"ios"
#define YURLSpecial @"includeSpecial":@"true"
#define YURLActivity @"includeActivity":@"true"
#define YURLScale @"scale":@2

@implementation HomePageNetManager

+ (id)getHomePageIntroduceCompletionHandle:(void (^)(id, NSError *))completed{

    return [self GET:YHomeURLPath parameters:@{YURLChannel, YURLVersion, YURLDevice, YURLSpecial, YURLActivity, YURLScale} completionHandle:^(id responseObject, NSError *error) {
        completed([HomePageModel mj_objectWithKeyValues:responseObject], error);
    }];
}

@end
