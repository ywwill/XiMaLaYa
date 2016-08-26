//
//  TracksViewModel.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  选集列表
 */

@interface TracksViewModel : NSObject

//得到所有的数据
- (void)getDataComletionHandle:(void (^)(NSError *))complete;

@end
