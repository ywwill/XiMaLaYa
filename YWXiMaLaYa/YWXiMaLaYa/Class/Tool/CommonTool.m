//
//  CommonTool.m
//  YWXiMaLaYa
//
//  Created by YangWei on 2018/3/7.
//  Copyright © 2018年 ywwill. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool

+ (NSString *)dateStringFormat:(NSString *)format timeInterval:(NSTimeInterval)interval {
    NSTimeInterval time = interval;
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:format];
    [fmt setTimeZone:[NSTimeZone localTimeZone]];
    NSString *dateStr = [fmt stringFromDate: detaildate];
    return dateStr;
}


@end
