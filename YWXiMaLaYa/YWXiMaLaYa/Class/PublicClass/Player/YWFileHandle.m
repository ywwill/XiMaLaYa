//
//  YWFileHandle.m
//  YWXiMaLaYa
//
//  Created by Apple-YangWei on 16/9/13.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWFileHandle.h"
#import "NSString+YWLoad.h"

@interface YWFileHandle()

@property (nonatomic, strong) NSFileHandle * writeFileHandle;
@property (nonatomic, strong) NSFileHandle * readFileHandle;


@end

@implementation YWFileHandle

// 创建临时文件
+ (BOOL)createTempFile {
    NSFileManager * manager = [NSFileManager defaultManager];
    NSString * path = [NSString tempFilePath];
    if ([manager fileExistsAtPath:path]) {
        [manager removeItemAtPath:path error:nil];
    }
    return [manager createFileAtPath:path contents:nil attributes:nil];
}

//往临时文件写入数据
+ (void)writeTempFileData:(NSData *)data {
    NSFileHandle * handle = [NSFileHandle fileHandleForWritingAtPath:[NSString tempFilePath]];
    [handle seekToEndOfFile];
    [handle writeData:data];
}

//读取临时文件数据
+ (NSData *)readTempFileDataWithOffset:(NSUInteger)offset length:(NSUInteger)length {
    NSFileHandle * handle = [NSFileHandle fileHandleForReadingAtPath:[NSString tempFilePath]];
    [handle seekToFileOffset:offset];
    return [handle readDataOfLength:length];
}

//保存临时文件到缓存文件夹
+ (void)cacheTempFileWithFileName:(NSString *)name {
    NSFileManager * manager = [NSFileManager defaultManager];
    NSString * cacheFolderPath = [NSString cacheFolderPath];
    if (![manager fileExistsAtPath:cacheFolderPath]) {
        [manager createDirectoryAtPath:cacheFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString * cacheFilePath = [NSString stringWithFormat:@"%@/%@", cacheFolderPath, name];
    BOOL success = [[NSFileManager defaultManager] copyItemAtPath:[NSString tempFilePath] toPath:cacheFilePath error:nil];
    NSLog(@"cache file : %@", success ? @"success" : @"fail");
}

//是否存在缓存文件 存在：返回文件路径 不存在：返回nil
+ (NSString *)cacheFileExistsWithURL:(NSURL *)url {
    NSString * cacheFilePath = [NSString stringWithFormat:@"%@/%@", [NSString cacheFolderPath], [NSString fileNameWithURL:url]];
            if ([[NSFileManager defaultManager] fileExistsAtPath:cacheFilePath]) {
        return cacheFilePath;
    }
    return nil;
}

//清空缓存文件
+ (BOOL)clearCache {
    NSFileManager * manager = [NSFileManager defaultManager];
    return [manager removeItemAtPath:[NSString cacheFolderPath] error:nil];
}

@end
