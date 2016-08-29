//
//  AlbumHeaderView.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义view
#import "PicView.h"     //方形图
#import "IconNameView.h"    //头像昵称
#import "DescribleView.h"   //头像下的描述信息

/**
 *  详情页头部展示图，包含导航栏左右按钮
 */

@protocol AlbumHeaderViewDelegate <NSObject>

//返回按钮
- (void)topLeftButtonDidClick;

//右边的按钮
- (void)topRightButtonDidClick;

@end

@interface AlbumHeaderView : UIImageView


@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *smallTitle;

@property (nonatomic, strong) PicView *picView;

@property (nonatomic, strong) IconNameView *nameView;

@property (nonatomic, strong) DescribleView *describleView;

//根据标签数组，设置按钮标签
- (void)setupTagsBtnWithTagNames:(NSArray *)tagNames;

@property (nonatomic, weak) id <AlbumHeaderViewDelegate> delegate;


@end
