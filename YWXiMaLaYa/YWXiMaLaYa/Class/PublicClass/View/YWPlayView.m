//
//  YWPlayView.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/30.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWPlayView.h"

@interface YWPlayView()

@property (nonatomic, strong) CADisplayLink *link;// 定时器

@end



@implementation YWPlayView

- (instancetype)init{

    if (self = [super init]) {
        // 布局
        UIImageView *backgoundIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_normal"]];
        [self addSubview:backgoundIV];
        [backgoundIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _circleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_loop"]];
        [backgoundIV addSubview:_circleImageView];
        
        [_circleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(2);
            make.right.mas_equalTo(-2);
            make.bottom.mas_equalTo(-8);
        }];
        // 设置circle的用户交互
        backgoundIV.userInteractionEnabled = YES;
        _circleImageView.userInteractionEnabled = YES;
        // 按钮被点击前
        [self.playButton setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
    }
    return self;
}

//背景图旋转
- (void)rotate{
    self.circleImageView.layer.transform = CATransform3DRotate(self.circleImageView.layer.transform, angleToRadian(72/60), 0, 0, 1);
}

#pragma mark - 懒加载

- (UIButton *)playButton{

    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_playButton setHidden:NO];
        
        [_playButton setBackgroundImage:[UIImage imageNamed:@"avatar_bg"] forState:UIControlStateSelected];
   
        [_playButton setImage:[UIImage imageNamed:@"toolbar_pause_h_p"] forState:UIControlStateSelected];
     
        [self addSubview:_playButton];
        
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.mas_equalTo(2),
            make.right.mas_equalTo(-2),
            make.bottom.mas_equalTo(-7);
        }];
        
        //点击方法
        [_playButton bk_addEventHandler:^(UIButton *sender) {
            if ([self.delegate respondsToSelector:@selector(playButtonDidClick:)]) {
                
                sender.selected = !sender.selected;
                self.link.paused = !sender.selected;
                [self.delegate playButtonDidClick:sender.selected];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _playButton;
}

- (UIImageView *)contentImageView{

    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        
        [_circleImageView addSubview:_contentImageView];
        
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(8, 8, 8, 8));
        }];
        
        // KVO观察image变化, 变化了就初始化定时器, 值变化则执行task, BlockKit框架对通知的一个拓展

        [_contentImageView bk_addObserverForKeyPath:@"image" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            
            self.link.paused = NO;
            self.playButton.selected = YES;
        }];
        
        //圆图
        _contentImageView.clipsToBounds = YES;
        _contentImageView.layer.cornerRadius = 22;
    }
    return _contentImageView;
}

- (CADisplayLink *)link{

    if (!_link) {
        // 创建定时器, 一秒钟调用rotation方法60次
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
    
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _link;
}



@end
