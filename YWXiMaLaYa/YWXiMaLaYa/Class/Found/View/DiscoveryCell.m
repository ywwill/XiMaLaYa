//
//  DiscoveryCell.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/24.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "DiscoveryCell.h"

#define yDPicWidth 70

@implementation DiscoveryCell




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //cell右边的箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.subTitleLabel.font = [UIFont systemFontOfSize:13];
        
        //分割线左右间距
        self.separatorInset = UIEdgeInsetsMake(0, 70, 0, 0);
    }
    return self;
}

#pragma mark - cell属性懒加载

- (UIImageView *)coverImage{

    if (!_coverImage) {
        _coverImage = [UIImageView new];
        [self.contentView addSubview:_coverImage];
        [_coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.bottom.mas_equalTo(0);
            make.width.mas_equalTo(yDPicWidth);
        }];

    }
    return _coverImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.coverImage.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-20);
        }];
        
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel new];
        [self.contentView addSubview:_subTitleLabel];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(10);
            make.leadingMargin.mas_equalTo(self.titleLabel);
            make.right.bottom.mas_equalTo(-10);
        }];
        
        _subTitleLabel.textColor = [UIColor lightGrayColor];
    }
    return _subTitleLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
