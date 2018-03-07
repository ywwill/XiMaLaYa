//
//  YWSoundViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWSoundViewController.h"
#import "CaiCaiViewController.h"

@interface YWSoundViewController ()

@end

@implementation YWSoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// 创建一个单例
+ (instancetype)soundViewController {
    
    static YWSoundViewController *soundVC = nil;
    
    YDISPATCH_ONCE_BLOCK((^{
        
        soundVC = [[YWSoundViewController alloc] initWithViewControllerClasses:[self viewControllers] andTheirTitles:@[@"采采"]];
        
        soundVC.menuViewStyle = WMMenuViewStyleLine;
        // 设置背景色
        soundVC.menuBGColor = [UIColor whiteColor];

        // 设置每个item的宽
        soundVC.itemsWidths = @[@(SCREEN_WIDTH)];
        soundVC.progressHeight = 0.0;
//        soundVC.menuHeight = 45;
        soundVC.viewFrame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20);
    }));
    
    return soundVC;
}

// 存响应的控制器
+ (NSArray *)viewControllers {
    return @[[CaiCaiViewController class]];
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
