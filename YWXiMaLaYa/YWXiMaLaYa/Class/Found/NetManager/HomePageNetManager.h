//
//  HomePageNetManager.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetManager.h"
@interface HomePageNetManager : BaseNetManager

//获取首界面数据内容
+ (id)getHomePageIntroduceCompletionHandle:(void(^)(id responseObject, NSError *error))completed;


@end
