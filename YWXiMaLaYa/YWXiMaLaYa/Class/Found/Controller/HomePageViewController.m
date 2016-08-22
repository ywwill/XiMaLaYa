//
//  HomePageViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "HomePageViewController.h"

#import "HomePageNetManager.h"
#import "HomePageModel.h"

@interface HomePageViewController ()
@property (nonatomic,strong) HomePageModel *model;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HomePageNetManager getHomePageIntroduceCompletionHandle:^(HomePageModel* responseObject, NSError *error) {
        YWLog(@"%@",responseObject.focusImage.title);
     
    }];
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
