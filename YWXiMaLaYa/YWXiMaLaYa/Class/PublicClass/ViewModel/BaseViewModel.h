//
//  BaseViewModel.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/23.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelDelegate <NSObject>

@optional
/* 获取数据 */
- (void)getDataComletionHandle:(void (^)(NSError *))completed;

/* 获取更多 */
- (void)getMoreDataCompletionHandle:(void(^)(NSError *error))completed;

/* 刷新 */
- (void)refreshDataCompletionHandle:(void(^)(NSError *error))completed;

/* 通过indexPath返回cell高 */
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath;

@end

@interface BaseViewModel : NSObject<BaseViewModelDelegate>

@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

//取消任务
- (void)cancelTask;

//暂停任务
- (void)suspendTask;

//继续任务
- (void)resumeTask;


@end
