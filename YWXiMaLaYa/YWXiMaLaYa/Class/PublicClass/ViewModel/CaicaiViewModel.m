//
//  CaicaiViewModel.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/31.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "CaicaiViewModel.h"
#import "MoreContentNetManager.h"
#import "DetailModel.h"

@interface CaicaiViewModel()

@property (nonatomic, strong) DetailModel *model;

@end

@implementation CaicaiViewModel

- (instancetype)initWithAlbumId:(NSInteger)albumId isAsc:(BOOL)asc{
    
    if (self = [super init]) {
        _albumId = albumId;
        _asc = asc;
    }
    return self;
}

- (void)getDataComletionHandle:(void (^)(NSError *))completed{
    
    
    self.dataTask = [MoreContentNetManager getCaiCaiForAlbumId:_albumId idAsc:_asc completionHandle:^(id responseObject, NSError *error) {
        self.model = responseObject;
        completed(error);
    }];
}

#pragma mark - 返回专辑歌曲单

- (NSInteger)rowNumber{
    
    return self.model.tracks.list.count;
}

- (NSString *)titleForRow:(NSInteger)row{
    
    return self.model.tracks.list[row].title;
}

- (NSString *)nickNameForRow:(NSInteger)row{
    
    return [NSString stringWithFormat:@"by %@", self.model.tracks.list[row].nickname];
}

- (NSString *)updateTimeForRow:(NSInteger)row{
    
    //获取当前时间戳
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    
    //创建歌曲时间戳
    NSTimeInterval createTime = self.model.tracks.list[row].createdAt / 1000;
    
    //时间差
    NSTimeInterval time = currentTime - createTime;
    
    //转小时
    NSInteger hours = time / 3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    
    //秒转天
    NSInteger days = time / 3600 / 24;
    if (days < 24) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
    
    //秒转月
    NSInteger months = time/3600/24/30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
    //秒转年
    NSInteger years = time/3600/24/30/12;
    return [NSString stringWithFormat:@"%ld年前",years];
    
}

- (NSString *)playTimeForRow:(NSInteger)row{
    
    NSTimeInterval duration = self.model.tracks.list[row].duration;
    //分
    NSInteger minute = duration / 60;
    //秒
    NSInteger second = (NSInteger)duration % 60;
    
    return [NSString stringWithFormat:@"%02ld:%02ld", minute, second];
}

- (NSString *)playCountFor:(NSInteger)row{
    
    //如果超过万，要显示*.*万
    NSInteger count = self.model.tracks.list[row].playtimes;
    if (count < 10000) {
        return @(self.model.tracks.list[row].playtimes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1f万", (CGFloat)count/10000];
    }
}

- (NSString *)commentCountForRow:(NSInteger)row{
    
    return @(self.model.tracks.list[row].comments).stringValue;
}

- (NSString *)favorCountForRow:(NSInteger)row{
    
    NSInteger count = self.model.tracks.list[row].likes;
    
    if (count < 10000) {
        return @(self.model.tracks.list[row].likes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%0.1f万", (CGFloat)count/10000];
    }
}

- (NSURL *)playURLForRow:(NSInteger)row{
    
    NSString *path = self.model.tracks.list[row].playUrl64;
    return [NSURL URLWithString:path];
}

- (NSURL *)coverURLForRow:(NSInteger)row{
    
    NSString *path = self.model.tracks.list[row].coverSmall;
    return [NSURL URLWithString:path];
}





#pragma mark - 返回顶部视图标题系列属性

- (NSString *)albumTitle{
    
    return self.model.album.title;
}

- (NSString *)albumPlays{
    
    NSInteger count = self.model.album.playTimes;
    
    if (count < 10000) {
        return @(self.model.album.playTimes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1f万", (CGFloat)count/10000];
        
    }
}

- (NSString *)albumNickName{
    
    return self.model.album.nickname;
}

- (NSString *)albumDesc{
    
    return self.model.album.intro;
}

- (NSURL *)albumCoverURL{
    
    NSString *path = self.model.album.coverSmall;
    return [NSURL URLWithString:path];
}

- (NSURL *)albumIconURL{
    
    NSString *path = self.model.album.avatarPath;
    return [NSURL URLWithString:path];
}

- (NSArray *)tagsName{
    
    return [self.model.album.tags componentsSeparatedByString:@","];
}


@end
