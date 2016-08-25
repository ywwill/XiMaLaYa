//
//  DetailViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/25.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)title{

    if (self = [super init]) {
        _albumId = albumId;
        _detailTitle = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = YWRandomColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
