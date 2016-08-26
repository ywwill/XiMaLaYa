//
//  IconNameView.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "IconNameView.h"

@implementation IconNameView


- (instancetype)init{

    if (self = [super init]) {
        self.icon.hidden = NO;
        self.name.hidden = NO;
    }
    return self;
}

- (UIImageView *)icon{

    if (_icon) {
        _icon = [UIImageView new];
        [self addSubview:_icon];
        
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.centerY.mas_equalTo(0),
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        //设成圆图
        _icon.image = [UIImage imageNamed:@"sound_default"];
        _icon.layer.cornerRadius = 15;
        _icon.clipsToBounds = YES;
    }
    return _icon;
}

- (UILabel *)name{

    if (_name) {
        _name = [UILabel new];
        [self addSubview:_name];
        
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.left.mas_equalTo(self.icon.mas_right).mas_equalTo(5),
            make.centerY.mas_equalTo(self.icon);
        }];
    }
    return _name;
}





@end
