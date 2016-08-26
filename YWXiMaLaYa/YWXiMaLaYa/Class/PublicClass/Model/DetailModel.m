//
//  DetailModel.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

@end

@implementation Album

@end

@implementation Tracks

+ (NSDictionary *)objectClassInArray{

    return @{@"list" : [Tracks_List class]};
}

@end


@implementation Tracks_List

@end
