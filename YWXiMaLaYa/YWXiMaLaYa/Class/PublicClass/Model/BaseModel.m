//
//  BaseModel.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{

    //用“ID”替换“id”去获取值
    return @{@"ID":@"id"};
}

@end
