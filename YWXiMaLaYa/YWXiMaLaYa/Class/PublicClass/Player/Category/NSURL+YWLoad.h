//
//  NSURl+YWLoad.h
//  YWXiMaLaYa
//
//  Created by Apple-YangWei on 16/9/13.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (YWLoad)

/**
 *  自定义scheme
 */
- (NSURL *)customSchemeURL;

/**
 *  还原scheme
 */
- (NSURL *)originalSchemeURL;

@end