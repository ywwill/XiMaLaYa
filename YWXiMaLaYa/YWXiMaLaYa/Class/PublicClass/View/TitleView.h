//
//  TitleView.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/24.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TitleViewDelegate <NSObject>

- (void)titleViewDidClick:(NSInteger)tag;

@end


@interface TitleView : UIView

@property (nonatomic, weak) id <TitleViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;

@end
