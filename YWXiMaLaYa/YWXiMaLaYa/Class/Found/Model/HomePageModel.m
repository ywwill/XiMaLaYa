//
//  HomePageModel.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel

@end

@implementation DiscoveryColumn

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : [DiscoveryColumn_List class]};
}

@end


@implementation DiscoveryColumn_List

@end


@implementation FocusImage

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [FocusImage_List class]};
}

@end


@implementation FocusImage_List

@end


@implementation HotRecommend

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [HotRecommend_List class]};
}

@end


@implementation HotRecommend_List

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [HotRecommend_List_List class]};
}

@end


@implementation HotRecommend_List_List

@end


@implementation Entrances

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [Entrances_List class]};
}

@end


@implementation Entrances_List

@end


@implementation EditorRecommendAlbum

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [EditorRecommendAlbum_List class]};
}

@end


@implementation EditorRecommendAlbum_List

@end


@implementation SpecialColumn

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [SpecialColumn_List class]};
}

@end


@implementation SpecialColumn_List

@end
