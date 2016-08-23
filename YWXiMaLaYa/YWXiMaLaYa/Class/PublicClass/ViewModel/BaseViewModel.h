//
//  BaseViewModel.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/23.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject


@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

//取消任务
- (void)cancelTask;

//暂停任务
- (void)suspendTask;

//继续任务
- (void)resumeTask;


@end
