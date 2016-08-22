//
//  SettingViewController.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingViewController;

@protocol SettingViewControllerDelegate <NSObject>

- (void)settingViewControllerWillAppear:(SettingViewController *)settingVC;

@end

@interface SettingViewController : UITableViewController

@property (nonatomic, weak) id <SettingViewControllerDelegate> delegate;

@end
