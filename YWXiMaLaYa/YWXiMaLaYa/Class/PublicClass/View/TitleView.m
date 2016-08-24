//
//  TitleView.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/24.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "TitleView.h"
#import "MoreButton.h"

@interface TitleView()

//箭头
@property (nonatomic, strong) UIImageView *arrowImage;

//更多按钮
@property (nonatomic, strong) UIButton *moreButton;

@end

@implementation TitleView

- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more{

    if (self = [super init]) {
        self.title = title;
        self.arrowImage.image = [UIImage imageNamed:@"tabbar_np_play"];
        
        if (more) {
            [self.moreButton setTitle:@"更多" forState:UIControlStateNormal];
        }
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}


#pragma mark - 懒加载
- (UIImageView *)arrowImage{
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc]init];
        [self addSubview:_arrowImage];
        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(8),
            make.bottom.mas_equalTo(-12),
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _arrowImage;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.mas_equalTo(self.arrowImage),
            make.left.mas_equalTo(self.arrowImage.mas_right).mas_equalTo(4),
            make.width.mas_equalTo(150);
        }];
        
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = _title;
    }
    return _titleLabel;
}

- (UIButton *)moreButton{

    if (!_moreButton) {
        _moreButton = [MoreButton new];
        [self addSubview:_moreButton];
        
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-5),
            make.centerY.mas_equalTo(self.titleLabel),
            make.size.mas_equalTo(CGSizeMake(60, 20));
        }];
        
        [_moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _moreButton.titleLabel.textAlignment = NSTextAlignmentRight;
        [_moreButton setImage:[UIImage imageNamed:@"cell_arrow"] forState:UIControlStateNormal];
        
        //点击事件
        [_moreButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (void)click{

    if ([self.delegate respondsToSelector:@selector(titleViewDidClick:)]) {
        [self.delegate titleViewDidClick:self.tag];
    }
}








@end
