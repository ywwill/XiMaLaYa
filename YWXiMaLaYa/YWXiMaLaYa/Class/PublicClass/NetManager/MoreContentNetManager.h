//
//  DetailPageNetManager.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetManager.h"

@interface MoreContentNetManager : BaseNetManager

+ (id)getTracksForAlbumId:(NSInteger)albumId mainTitle:(NSString *)title idAsc:(BOOL)isAsc completionHandle:(void(^)(id responseObject, NSError *error))completed;

//采采
+ (id)getCaiCaiForAlbumId:(NSInteger)albumId page:(NSInteger)pageId idAsc:(BOOL)isAsc completionHandle:(void(^)(id responseObject, NSError *error))completed;

@end
