//
//  YWResourceLoader.h
//  YWXiMaLaYa
//
//  Created by Apple-YangWei on 16/9/13.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "YWRequestTask.h"

#define MimeType @"video/mp4"

@class YWResourceLoader;

@protocol YWLoaderDelegate <NSObject>

@required
- (void)loader:(YWResourceLoader *)loader cacheProgress:(CGFloat)progress;

@optional
- (void)loader:(YWResourceLoader *)loader failLoadingWithError:(NSError *)error;

@end

@interface YWResourceLoader : NSObject<AVAssetResourceLoaderDelegate,YWRequestTaskDelegate>

@property (nonatomic, weak) id <YWLoaderDelegate> delegate;
@property (atomic, assign) BOOL seekRequired; //Seek标识
@property (nonatomic, assign) BOOL cacheFinished;

- (void)stopLoading;



@end
