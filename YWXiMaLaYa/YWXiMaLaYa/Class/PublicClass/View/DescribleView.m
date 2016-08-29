//
//  DescribleView.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "DescribleView.h"

@implementation DescribleView


- (instancetype)init{

    if (self = [super init]) {
        _arrow.hidden = NO;
    }
    return self;
}

- (UILabel *)describleLabel{

    if (!_describleLabel) {
        _describleLabel = [UILabel new];
        [self addSubview:_describleLabel];
        
        [_describleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.centerY.mas_equalTo(0),
            //最大的宽度
            make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH / 2);
        }];
        _describleLabel.textColor = [UIColor lightGrayColor];
        _describleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _describleLabel;
}

- (UIImageView *)arrow{

    if (!_arrow) {
        _arrow = [UIImageView new];
        [self addSubview:_arrow];
        
        [_arrow mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.mas_equalTo(self.describleLabel.mas_right),
            make.centerY.mas_equalTo(self.describleLabel),
            make.size.mas_equalTo(CGSizeMake(10, 15));
        }];
        _arrow.image = [UIImage imageNamed:@"findcell_arrow"];
        
    }
    
    return _arrow;
}


@end
