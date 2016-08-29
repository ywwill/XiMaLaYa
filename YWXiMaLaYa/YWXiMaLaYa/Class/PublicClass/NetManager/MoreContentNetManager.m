//
//  DetailPageNetManager.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "MoreContentNetManager.h"
#import "DetailModel.h"

// 小编推荐栏 更多跳转URL
#define KURLEditor @"http://mobile.ximalaya.com/mobile/discovery/v1/recommend/editor"
#define yURLDevice @"device":@"ios"
#define yURLPosition @"position":@1


@implementation MoreContentNetManager

+ (id)getTracksForAlbumId:(NSInteger)albumId mainTitle:(NSString *)title idAsc:(BOOL)isAsc completionHandle:(void (^)(id, NSError *))completed{
    
    NSDictionary *param = @{@"albumId" : @(albumId),
                            @"title" : title,
                            @"isAsc" : @(isAsc),
                            yURLDevice,
                            yURLPosition
                            };
    
    NSString *path = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%ld/true/1/20",albumId];
 
    return [self GET:path parameters:param completionHandle:^(id responseObject, NSError *error) {
        completed([DetailModel mj_objectWithKeyValues:responseObject], error);
    }];
}

@end
