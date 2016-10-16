//
//  CaicaiViewModel.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/31.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "BaseViewModel.h"
/**
 *  采采选集列表
 */
@interface CaicaiViewModel : BaseViewModel

//用传递的参数 albumId ,title初始化 ViewModel
- (instancetype)initWithAlbumId:(NSInteger)albumId isAsc:(BOOL)asc;

@property (nonatomic,assign) NSInteger albumId;

@property (nonatomic,assign) NSInteger pageId;

@property (nonatomic,assign,getter=isAsc) BOOL asc;

//返回行数
@property (nonatomic, assign) NSInteger rowNumber;

//通过行数, 返回标题
- (NSString *)titleForRow:(NSInteger)row;

//通过行数, 返回创作人
- (NSString *)nickNameForRow:(NSInteger)row;

//通过行数, 返回更新时间
- (NSString *)updateTimeForRow:(NSInteger)row;

//通过行数, 返回收藏喜欢数
- (NSString *)favorCountForRow:(NSInteger)row;

//通过行数, 返回播放次数
- (NSString *)playCountFor:(NSInteger)row;

//通过行数, 返回播放时长
- (NSString *)playTimeForRow:(NSInteger)row;

//通过行数, 返回评论数
- (NSString *)commentCountForRow:(NSInteger)row;

//通过行数, 返回播放地址
- (NSURL *)playURLForRow:(NSInteger)row;

//通过行数, 返回集数图片地址
- (NSURL *)coverURLForRow:(NSInteger)row;


//返回专辑标题
@property (nonatomic, strong) NSString *albumTitle;

//返回昵称
@property (nonatomic, strong) NSString *albumNickName;

//返回播放次数
@property (nonatomic, strong) NSString *albumPlays;

//返回专辑图片链接地址
@property (nonatomic, strong) NSURL *albumCoverURL;

//返回专辑头像地址
@property (nonatomic, strong) NSURL *albumIconURL;

//返回专辑说明
@property (nonatomic, strong) NSString *albumDesc;

//返回专辑标签数组
@property (nonatomic, strong) NSArray *tagsName;


@end
