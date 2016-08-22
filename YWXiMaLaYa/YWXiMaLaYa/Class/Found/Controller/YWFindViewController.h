//
//  YWFindViewController.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController.h>

@interface YWFindViewController : WMPageController

/**
 *  单例创建带有WMPageController的UINavigationController
 */
+ (UINavigationController *)defaultFindUINavigationController;

@end
