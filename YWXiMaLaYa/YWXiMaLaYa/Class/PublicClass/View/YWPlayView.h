//
//  YWPlayView.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/30.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayViewDelegate <NSObject>

//传入按钮的状态
- (void)playButtonDidClick:(BOOL)selected;

@end

@interface YWPlayView : UIView

@property (nonatomic, strong) UIImageView *circleImageView;//旋转的播放按钮

@property (nonatomic, strong) UIImageView *contentImageView; // 专辑图片

@property (nonatomic, strong) UIButton *playButton;

@property (nonatomic, weak) id<PlayViewDelegate> delegate;

@end
