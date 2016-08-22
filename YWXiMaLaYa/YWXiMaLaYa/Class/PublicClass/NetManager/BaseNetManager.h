//
//  BaseNetManager.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject

//对AFHTTPSessionManager的GET请求方法进行了封装
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void(^)(id responseObject, NSError *error))completed;

//对AFHTTPSessionManager的POST请求方法进行了封装
+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void(^)(id responseObject, NSError *error))completed;

@end
