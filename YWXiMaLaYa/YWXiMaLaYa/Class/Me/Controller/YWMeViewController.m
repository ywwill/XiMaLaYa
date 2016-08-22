//
//  YWMeViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWMeViewController.h"
#import <Masonry.h>

@interface YWMeViewController ()

@end

@implementation YWMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.navigationItem.backBarButtonItem.title = @"back";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if(section == 0){
        
        UIView *view = [[UIView alloc]init];
        UIButton *recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view addSubview:recordBtn];
        
        [recordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.width.mas_equalTo(250);
            make.height.mas_equalTo(40);
        }];
        [recordBtn setImage:[UIImage imageNamed:@"btn_record_n"] forState:UIControlStateNormal];
        [recordBtn setImage:[UIImage imageNamed:@"btn_record_h"] forState:UIControlStateHighlighted];
        
        return view;
    }else{
    
        return nil;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return section ? 10:60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
