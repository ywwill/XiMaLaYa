//
//  BaseViewModel.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/23.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cancelTask{
 
    [self.dataTask cancel];
}

- (void)suspendTask{
    [self.dataTask suspend];
}

- (void)resumeTask{

    [self.dataTask resume];
    
}


@end
