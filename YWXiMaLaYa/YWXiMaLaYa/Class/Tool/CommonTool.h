//
//  CommonTool.h
//  YWXiMaLaYa
//
//  Created by YangWei on 2018/3/7.
//  Copyright © 2018年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonTool : NSObject

/**
 * 距离1970毫秒时间戳转成目标格式的字符串
 * format @"MM/dd HH:mm"
 * interval 服务器返回毫秒数
 **/
+ (NSString *)dateStringFormat:(NSString *)format timeInterval:(NSTimeInterval)interval;

@end
