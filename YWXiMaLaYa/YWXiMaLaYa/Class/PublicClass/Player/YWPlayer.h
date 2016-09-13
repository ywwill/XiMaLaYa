//
//  YWPlayer.h
//  YWXiMaLaYa
//
//  Created by Apple-YangWei on 16/9/13.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YWResourceLoader.h"

typedef NS_ENUM(NSInteger, YWPlayerState) {
    YWPlayerStateWaiting,
    YWPlayerStatePlaying,
    YWPlayerStatePaused,
    YWPlayerStateStopped,
    YWPlayerStateBuffering,
    YWPlayerStateError
};

@interface YWPlayer : NSObject<YWLoaderDelegate>
@property (nonatomic, assign) YWPlayerState state;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat cacheProgress;

/**
 *  初始化方法，url：歌曲的网络地址或者本地地址
 */
- (instancetype)initWithURL:(NSURL *)url;

/**
 *  播放下一首歌曲，url：歌曲的网络地址或者本地地址
 *  逻辑：stop -> replace -> play
 */
- (void)replaceItemWithURL:(NSURL *)url;

/**
 *  播放
 */
- (void)play;

/**
 *  暂停
 */
- (void)pause;

/**
 *  停止
 */
- (void)stop;

/**
 *  跳到某个时间进度
 */
- (void)seekToTime:(CGFloat)seconds;

/**
 *  当前歌曲缓存情况 YES：已缓存  NO：未缓存（seek过的歌曲都不会缓存）
 */
- (BOOL)currentItemCacheState;

/**
 *  当前歌曲缓存文件完整路径
 */
- (NSString *)currentItemCacheFilePath;

/**
 *  清除缓存
 */
+ (BOOL)clearCache;

@end

