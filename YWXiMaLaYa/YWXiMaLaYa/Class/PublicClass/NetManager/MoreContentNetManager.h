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



/* 小编推荐、17个热门 根据 albumId 和 mianTitlte 获取选集信息*/
//http://mobile.ximalaya.com/mobile/others/ca/album/track/2758446/true/1/20?position=1&albumId=2758446&isAsc=true&device=android&title=%E5%B0%8F%E7%BC%96%E6%8E%A8%E8%8D%90&pageSize=20
+ (id)getTracksForAlbumId:(NSInteger)albumId mainTitle:(NSString *)title idAsc:(BOOL)isAsc completionHandle:(void(^)(id responseObject, NSError *error))completed;

//采采
+ (id)getCaiCaiForAlbumId:(NSInteger)albumId idAsc:(BOOL)isAsc completionHandle:(void(^)(id responseObject, NSError *error))completed;



@end
