//
//  YWTabBarController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWTabBarController.h"
#import "YWFindViewController.h"
#import "YWMeViewController.h"
#import "YWSoundViewController.h"
#import "YWDownloadViewController.h"


@interface YWTabBarController ()

@end

@implementation YWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *findNavigationVC = [YWFindViewController defaultFindUINavigationController];
    [self setupChildVC:findNavigationVC imageName:@"tabbar_find_n" selectedImage:@"tabbar_find_h"];
    
    YWSoundViewController *soundVC = [YWSoundViewController soundViewController];
    [self setupChildVC:soundVC imageName:@"tabbar_sound_n" selectedImage:@"tabbar_sound_h"];
    
    // 只占用空间
    UIViewController *vc = [UIViewController new];
    [self setupChildVC:vc  imageName:nil selectedImage:nil];
    
    YWDownloadViewController *downloadVC = [YWDownloadViewController downloadViewController];
    [self setupChildVC:downloadVC imageName:@"tabbar_download_n" selectedImage:@"tabbar_download_h"];
    
    //从storyboard中获取控制器
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MeSetting" bundle:nil];
    YWMeViewController *meVC = [storyboard instantiateViewControllerWithIdentifier:@"Me"];
    
    [self setupChildVC:meVC imageName:@"tabbar_me_n" selectedImage:@"tabbar_me_h"];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setupChildVC:(UIViewController *)vc imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage{

    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    vc.tabBarItem.image = [UIImage imageNamed:imageName];

    // 设置图片的不渲染
    UIImage *image = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = image;
    [self addChildViewController:vc];

}

@end
