//
//  BaseNetManager.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)defaultManager{

    YDISPATCH_ONCE_BLOCK((^{
    
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/json", @"text/javascript", @"application/json", nil];
    }));
    
    return manager;
}


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completed{

    YWLog(@"Request Path: %@, params %@", path, params);
    return [[self defaultManager] GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        YWLog(@"GET ERROR:%@",error.userInfo);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completed {
    return [[self defaultManager] POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject,nil);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          YWLog(@"GET ERROR:%@",error.userInfo);
    }];
}

@end
