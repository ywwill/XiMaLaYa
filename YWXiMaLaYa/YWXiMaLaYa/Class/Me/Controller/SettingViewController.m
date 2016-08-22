//
//  SettingViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewWillAppear:(BOOL)animated{

    [[NSNotificationCenter defaultCenter]postNotificationName:@"hidePlayView" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    // 即将消失时, 不要导航
    self.navigationController.navigationBarHidden = YES;
    // 恢复playView
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showPlayView" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"设置";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView协议代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.section==1 && indexPath.row <= 1) {
        return NO;
    }
    return YES;
}

//  设置头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

// 设置尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

@end
