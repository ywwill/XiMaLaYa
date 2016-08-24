//
//  ContentShowView.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/24.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "ContentShowView.h"

@implementation ContentShowView



- (instancetype)init{

    if (self =[super init]) {
        self.coverView.alpha = 0.4;
        self.lineImgVIew.hidden = NO;
        
        self.button.hidden = NO;
    }
    return self;
}
#pragma mark - 懒加载

// 线
- (UIImageView *)lineImgVIew {
    if (!_lineImgVIew) {
        _lineImgVIew = [UIImageView new];
        [self addSubview:_lineImgVIew];
        [_lineImgVIew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.centerX.mas_equalTo(0);
            make.height.mas_equalTo(4);
            make.width.mas_equalTo(SCREEN_WIDTH/4);
        }];
    
        _lineImgVIew.image = [UIImage imageNamed:@"find_albumtop"];
    }
    return _lineImgVIew;
}

// 框背景
- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        [self addSubview:_bgImgView];
        [_bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.lineImgVIew.mas_bottom).mas_equalTo(0);
            make.bottom.left.right.mas_equalTo(0);
        }];
        _bgImgView.image = [UIImage imageNamed:@"findradio_bg"];
        
    }
    return _bgImgView;
}
// 接受外界传图
- (UIImageView *)contentImgView {
    if (!_contentImgView) {
        _contentImgView = [UIImageView new];
        [self.bgImgView addSubview:_contentImgView];
        [_contentImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-1);
            make.top.left.mas_equalTo(1);
        }];
    }
    return _contentImgView;
}

- (UIButton *)button {
    if (!_button) {
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
       
            make.edges.mas_equalTo(0);
        }];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [UIView new];
        [self.contentImgView addSubview:_coverView];
        // 此时已经绑定
        [_coverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        _coverView.backgroundColor = [UIColor blackColor];
        
        
    }
    return _coverView;
}

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentImgView addSubview:_titleLb];
        // 此时已经绑定
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(3);
            make.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont boldSystemFontOfSize:12];
    }
    return _titleLb;
}

- (void)buttonClick{
    if ([self.delegate respondsToSelector:@selector(contentShowViewClick:)]) {
        [self.delegate contentShowViewClick:self.tag];
    }
}

@end
