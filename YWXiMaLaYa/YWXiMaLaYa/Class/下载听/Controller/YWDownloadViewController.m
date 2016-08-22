//
//  YWDownloadViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWDownloadViewController.h"
#import "AlbumViewController.h"
#import "DownloadViewController.h"


@interface YWDownloadViewController ()

@end

@implementation YWDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (instancetype)downloadViewController{

    static YWDownloadViewController *downloadVC = nil;
    
    YDISPATCH_ONCE_BLOCK((^{
        
        downloadVC = [[YWDownloadViewController alloc]initWithViewControllerClasses:[self viewControllers] andTheirTitles:@[@"专辑",@"下载中"]];
        
        downloadVC.menuViewStyle = WMMenuViewStyleLine;
        downloadVC.menuBGColor = [UIColor whiteColor];
        downloadVC.titleColorSelected = [UIColor redColor];
        
        //每个item的宽度
        downloadVC.itemsWidths = @[@(SCREEN_WIDTH/2), @(SCREEN_WIDTH/2)];
        downloadVC.progressHeight = 3.5;
        downloadVC.menuHeight = 45;
        downloadVC.viewFrame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20);
    }));
    
    return downloadVC;
}

+ (NSArray *)viewControllers{

    return @[[AlbumViewController class], [DownloadViewController class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
