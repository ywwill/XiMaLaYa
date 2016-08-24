//
//  SpecialCell.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/24.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *    精品听单cell
 */

@interface SpecialCell : UITableViewCell

@property (nonatomic,strong) UIButton *coverBtn;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *subTitleLb;

// 10张专辑
@property (nonatomic,strong) UILabel *footNoteLb;
@end
