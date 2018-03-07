//
//  YWFindViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWFindViewController.h"
#import "HomePageViewController.h"
#import "CategoryViewController.h"
#import "LiveViewController.h"
#import "RankingViewController.h"
#import "AnchorViewController.h"

@interface YWFindViewController ()

@end

@implementation YWFindViewController

+ (UINavigationController *)defaultFindUINavigationController{

    static UINavigationController *navigationVC = nil;
    
    YDISPATCH_ONCE_BLOCK((^{
        YWFindViewController *findVC = [[YWFindViewController alloc]initWithViewControllerClasses:[self viewControllersArray] andTheirTitles:@[@"推荐",@"分类",@"直播",@"榜单",@"主播"]];
        findVC.menuViewStyle = WMMenuViewStyleLine;
        findVC.progressColor = [UIColor redColor];
        findVC.progressHeight = 1.0;
        navigationVC = [[UINavigationController alloc]initWithRootViewController:findVC];
    }));
    
    return navigationVC;
    
}

//存控制器
+ (NSArray *)viewControllersArray{

    return @[[HomePageViewController class],
             [CategoryViewController class],
             [LiveViewController class],
             [RankingViewController class],
             [AnchorViewController class]
             ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
