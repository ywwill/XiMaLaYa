//
//  DetailViewController.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/25.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

//接收上个页面传递的title，albumID
- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)title;

@property (nonatomic, strong) NSString *detailTitle;
@property (nonatomic, assign) NSInteger albumId;

@end
