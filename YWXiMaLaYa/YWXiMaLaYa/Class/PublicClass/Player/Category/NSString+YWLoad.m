//
//  NSString+YWLoad.m
//  YWXiMaLaYa
//
//  Created by Apple-YangWei on 16/9/13.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "NSString+YWLoad.h"

@implementation NSString (YWLoad)

+ (NSString *)tempFilePath {
    return [[NSHomeDirectory( ) stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"MusicTemp.mp4"];
}


+ (NSString *)cacheFolderPath {
    return [[NSHomeDirectory( ) stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"MusicCaches"];
}

+ (NSString *)fileNameWithURL:(NSURL *)url {
    return [[url.path componentsSeparatedByString:@"/"] lastObject];
}

@end
