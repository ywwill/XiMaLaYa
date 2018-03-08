//
//  DetailPageNetManager.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "MoreContentNetManager.h"
#import "DetailModel.h"

@implementation MoreContentNetManager

+ (id)getTracksForAlbumId:(NSInteger)albumId mainTitle:(NSString *)title idAsc:(BOOL)isAsc completionHandle:(void (^)(id, NSError *))completed{
    
    NSDictionary *param = @{@"albumId" : @(albumId),
                            @"title" : title,
                            @"isAsc" : @(isAsc),
                            yURLDevice,
                            yURLPosition
                            };
    
    NSString *path = [NSString stringWithFormat:@"%@%ld/true/1/20",RequestURL,(long)albumId];
    
    return [self GET:path parameters:param completionHandle:^(id responseObject, NSError *error) {
        completed([DetailModel mj_objectWithKeyValues:responseObject], error);
    }];
}


+ (id)getCaiCaiForAlbumId:(NSInteger)albumId page:(NSInteger)pageId idAsc:(BOOL)isAsc completionHandle:(void (^)(id, NSError *))completed{
    
    NSDictionary *param = @{@"isAsc" : @(isAsc),
                            yURLDevice,
                            yURLPosition
                            };

    NSString *path = [NSString stringWithFormat:@"%@214706/true/1/20",RequestURL];

    return [self GET:path parameters:param completionHandle:^(id responseObject, NSError *error) {
        completed([DetailModel mj_objectWithKeyValues:responseObject], error);
    }];

}

@end
