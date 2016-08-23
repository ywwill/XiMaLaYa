//
//  HomePageViewModel.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/23.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface HomePageViewModel : BaseViewModel

/* 小编推荐 editorRecommendAlbums*/

/* 存储发现新奇栏 discoveryColumns 只显示不能选择 */
@property (nonatomic, assign) NSInteger discoverCount;

/* 存储精品听单 只显示不能选择 */
@property (nonatomic, assign) NSInteger specialCount;

/* 存储热门hotRecommends.list 各个分类栏 */
@property (nonatomic, strong) NSArray *hotRecmmendsArr;

/** 返回分组数 = 热门list + 其他*/
@property (nonatomic, assign) NSInteger section;

/* 返回每个section的title*/
- (NSString *)mainTitleForSection:(NSInteger)section;

// more按钮
- (BOOL)hasMoreForSection:(NSInteger)section;


/* FindPutCell的属性方法 */

// 缩略图
- (NSURL *)coverURLForSection:(NSInteger)section index:(NSInteger)index;

// 蒙版标题
- (NSString *)titleForSection:(NSInteger)section index:(NSInteger)index;

// 详情
- (NSString *)trackTitleForSection:(NSInteger)section index:(NSInteger)index;

// 跳转键
- (NSInteger)albumIdForSection:(NSInteger)section index:(NSInteger)index;

// 节目集数 -- 下一个tableView的row
- (NSInteger)tracksForSection:(NSInteger)section index:(NSInteger)index;

/* SpecialCell的属性方法 */
- (NSString *)footNoteForRow:(NSInteger)row;

/* 热门直播cell的图片 只显示不能选择 */
- (NSURL *)entrancesURL;
- (NSString *)entrancesTitle;


/* 头部滚动视图数据 */

/**  是否有滚动视图 */
@property (nonatomic,assign,getter=isExitsScrollView) BOOL exitsScrollView;

/** 滚动展示栏(焦点图)的图片数量 */
@property (nonatomic,assign) NSInteger focusImgNumber;

/** 滚动展示栏(焦点图)的图片地址 */
- (NSURL *)focusImgURLForIndex:(NSInteger)index;

#pragma mark - 跳转需要值
- (NSInteger)categoryIdForSection:(NSInteger)section;
- (NSString *)contentTypeForSection:(NSInteger)section;


@end
