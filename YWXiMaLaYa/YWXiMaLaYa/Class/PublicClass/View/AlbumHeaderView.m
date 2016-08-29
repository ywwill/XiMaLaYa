//
//  AlbumHeaderView.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/26.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "AlbumHeaderView.h"

@interface AlbumHeaderView()

@property (nonatomic, strong) UIButton *topLeftBtn;

@property (nonatomic, strong) UIButton *topRightBtn;


@end

@implementation AlbumHeaderView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"bg_albumView_header"];
        
        [self.topLeftBtn setImage:[UIImage imageNamed:@"icon_back_h"] forState:UIControlStateNormal];
        [self.topRightBtn setImage:[UIImage imageNamed:@"btn_share_n"] forState:UIControlStateNormal];
    
        self.describleView.hidden = NO;
    }
    return self;
}

/* 根据标签数组，设置按钮标签 */
- (void)setupTagsBtnWithTagNames:(NSArray *)tagNames{
    // 记录最后一个视图控件
    UIView *lastView = nil;
    // 创建标签按钮
    // 首页只展示两个标签按钮 所以要判断个数
    // 记录个数, 最高展示就两个
    NSInteger maxTags = 2;
    if (tagNames.count < 2) {
        maxTags = tagNames.count;
    }
    for (NSInteger i = 0; i<maxTags; i++) {
        UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:tagBtn];
        
        // 按钮根据按钮上文字自适应大小,NSFontAttributeName 要和按钮titleLabel的font对应
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGFloat length = [tagNames[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.width;
        
        [tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.picView);
            // 文字大小
            make.size.mas_equalTo(CGSizeMake(length+20, 25));
            if (lastView) {  // 存在
                make.left.mas_equalTo(lastView.mas_right).mas_equalTo(5);
            } else {  // 刚开始创建, 按钮的位置
                make.leadingMargin.mas_equalTo(self.describleView);
            }
        }];
        // 赋值标签按钮指针
        lastView = tagBtn;
        
        // 设置按钮的属性
        [tagBtn setTitle:tagNames[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [tagBtn setBackgroundImage:[UIImage imageNamed:@"sound_tags"] forState:UIControlStateNormal];
    }
}


- (UIButton *)topLeftBtn{

    if (!_topLeftBtn) {
        _topLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_topLeftBtn];
        
        [_topLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(50, 50)),
            make.top.left.mas_equalTo(0);
        }];
        
        [_topLeftBtn bk_addEventHandler:^(id sender) {
            
            if ([self.delegate respondsToSelector:@selector(topLeftButtonDidClick)]) {
                [self.delegate topLeftButtonDidClick];
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _topLeftBtn;
}

- (UILabel *)title{

    if (!_title) {
        _title = [UILabel new];
        [self addSubview:_title];
        
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(0),
            make.centerY.mas_equalTo(self.topLeftBtn),
            make.width.mas_lessThanOrEqualTo(250);
        }];
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont boldSystemFontOfSize:18];
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

- (UIButton *)topRightBtn{

    if (!_topRightBtn) {
        _topRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_topRightBtn];
        
        [_topRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.right.mas_equalTo(0),
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        [_topRightBtn bk_addEventHandler:^(id sender) {
            
            if ([self.delegate respondsToSelector:@selector(topRightButtonDidClick)]) {
                [self.delegate topRightButtonDidClick];
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _topRightBtn;
}

- (PicView *)picView{

    if (!_picView) {
        _picView = [PicView new];
        [self addSubview:_picView];
        
        [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(20),
            make.top.mas_equalTo(self.topLeftBtn.mas_bottom).mas_equalTo(15),
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    }
    return _picView;
}

- (IconNameView *)nameView{

    if (!_nameView) {
        _nameView = [IconNameView new];
        [self addSubview:_nameView];
        
        [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.topMargin.mas_equalTo(self.picView),
            make.left.mas_equalTo(self.picView.mas_right).mas_equalTo(10),
            make.right.mas_equalTo(-20),
            make.height.mas_equalTo(30);
        }];
    }
    return _nameView;
}

- (DescribleView *)describleView{

    if (!_describleView) {
        _describleView = [DescribleView new];
        [self addSubview:_describleView];
        
        [_describleView  mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.mas_equalTo(self.picView),
            make.leadingMargin.mas_equalTo(self.nameView),
            make.right.mas_equalTo(-10),
            make.height.mas_equalTo(30);
        }];
        _describleView.describleLabel.text = @"暂无简介";
    }
    return _describleView;
}




@end
