//
//  FocusImageScrollView.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/24.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

/**
 *  封装轮播图
 */

@interface FocusImageScrollView : UIView

//  通过传入焦点图数量以及焦点图的图片路径,初始化一个View
- (instancetype)initWithFocusImgNumber:(NSInteger)number;


@property (nonatomic, strong) iCarousel *ic;
@property (nonatomic, strong) UIPageControl *pageControl;
@end
