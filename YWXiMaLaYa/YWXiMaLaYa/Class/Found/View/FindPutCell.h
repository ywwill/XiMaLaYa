//
//  FindPutCell.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/24.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentShowView.h"

@interface FindPutCell : UITableViewCell


/**  跳转按钮0 */
@property (nonatomic,strong) ContentShowView *clickBtn0;
/**  跳转按钮1 */
@property (nonatomic,strong) ContentShowView *clickBtn1;
/**  跳转按钮2 */
@property (nonatomic,strong) ContentShowView *clickBtn2;

/* 按钮下面的介绍0 */
@property (nonatomic,strong) UILabel *detailLb0;
/* 按钮下面的介绍1 */
@property (nonatomic,strong) UILabel *detailLb1;
/* 按钮下面的介绍2 */
@property (nonatomic,strong) UILabel *detailLb2;

/* 返回本类计算行高 */
@property (nonatomic,assign) CGFloat cellHeight;


@end
