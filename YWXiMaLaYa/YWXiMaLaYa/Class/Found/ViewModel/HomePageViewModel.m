//
//  HomePageViewModel.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/23.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "HomePageViewModel.h"
#import "HomePageNetManager.h"
#import "HomePageModel.h"

//小编推荐
#define yOtherSection 1

@interface HomePageViewModel()

@property (nonatomic, strong) HomePageModel *model;

@end

@implementation HomePageViewModel

- (void)getDataComletionHandle:(void (^)(NSError *))completed{

    //responseObject转换为HomePageModel
    self.dataTask = [HomePageNetManager getHomePageIntroduceCompletionHandle:^(HomePageModel *responseObject, NSError *error) {
        
        self.model = responseObject;
        self.hotRecmmendsArr = responseObject.hotRecommends.list;
        self.section = _hotRecmmendsArr.count + yOtherSection;
        completed(error);
    }];
}

- (id)modelForSection:(NSInteger)section{

    if (section == 0) {     //小编推荐
        return self.model.editorRecommendAlbums;
    }else{
        //热门推荐
        return self.model.hotRecommends.list[section - 1];
    }
}

//section的title
- (NSString *)mainTitleForSection:(NSInteger)section{

    if (section == 0) {     //小编推荐
        return self.model.editorRecommendAlbums.title;
    }else{
        //热门推荐
        return self.model.hotRecommends.list[section - 1].title;
    }
}

- (BOOL)hasMoreForSection:(NSInteger)section {
    if (section == 0) {  // 小编推荐
        return self.model.editorRecommendAlbums.hasMore;
    }else {  // 热门推荐
        return  YES;
    }
}

#pragma mark -- FindPutCell的属性方法
-(NSURL *)coverURLForSection:(NSInteger)section index:(NSInteger)index{

    NSString *path = nil;
    if (section == 0) {
        path = self.model.editorRecommendAlbums.list[index].coverLarge;
    }else{
        path = self.model.hotRecommends.list[section - 1].list[index].coverLarge;
    }
    return [NSURL URLWithString:path];
}

//cell里面的title
- (NSString *)titleForSection:(NSInteger)section index:(NSInteger)index{

    if(section == 0){
        return self.model.editorRecommendAlbums.list[index].title;
    }else {
        return self.model.hotRecommends.list[section - 1].list[index].title;
    }
}

//cell下面的简介
- (NSString *)trackTitleForSection:(NSInteger)section index:(NSInteger)index{

    if (section == 0) {
        return self.model.editorRecommendAlbums.list[index].trackTitle;
    }else {
        return self.model.hotRecommends.list[section - 1].list[index].trackTitle;
    }
}

//点击“小编推荐”和“热门”后跳转id
- (NSInteger)albumIdForSection:(NSInteger)section index:(NSInteger)index{

    if(section == 0){
        return  self.model.editorRecommendAlbums.list[index].albumId;
    }else{
        return self.model.hotRecommends.list[section - 1].list[index].albumId;
    }
}

- (NSInteger)tracksForSection:(NSInteger)section index:(NSInteger)index{

    if (section == 0) {
        return self.model.editorRecommendAlbums.list[index].tracks;
    }else{
        return self.model.hotRecommends.list[section - 1].list[index].tracks;
    }
}

//热门推荐数组
- (NSArray *)hotListsModelForSection:(NSInteger)section {
    return self.model.hotRecommends.list;
}

// 热门直播的标题和图片
- (NSURL *)entrancesURL {
    NSString *path = self.model.entrances.list.firstObject.coverPath;
    return [NSURL URLWithString:path];
}
- (NSString *)entrancesTitle {
    return self.model.entrances.list.firstObject.title;
}


#pragma mark - 头部滚动视图
- (BOOL)isExitsScrollView{
    //判断一个数组不空办法, 还要加上NSNull类, 因为服务器人员可能出错
    return self.model.focusImages.list != nil && self.model.focusImages.list.count != 0 &&
    ![self.model.focusImages.list isKindOfClass:[NSNull class]];
}

/* 滚动展示栏的图片数量 */
- (NSInteger)focusImgNumber {
    return self.model.focusImages.list.count;
}
/* 滚动展示栏的图片地址 */
- (NSURL *)focusImgURLForIndex:(NSInteger)index {
    NSString *path = self.model.focusImages.list[index].pic;
    return [NSURL URLWithString:path];
}

#pragma mark - 跳转传值
- (NSInteger)categoryIdForSection:(NSInteger)section {
    if (section >= 3 && section <= 15) {
        return self.model.hotRecommends.list[section - 3].categoryId;
    } else {
        return 0;
    }
}

- (NSString *)contentTypeForSection:(NSInteger)section {
    if (section >= 3 && section <= 15) {
        return self.model.hotRecommends.list[section - 3].contentType;
    } else {
        return nil;
    }
}

@end
