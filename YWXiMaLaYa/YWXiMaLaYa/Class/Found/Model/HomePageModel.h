//
//  HomePageModel.h
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/22.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "BaseModel.h"

@class DiscoveryColumn, DiscoveryColumn_List, FocusImage, FocusImage_List, HotRecommend, HotRecommend_List, HotRecommend_List_List, Entrance, Entrance_List, EditorRecommendAlbum, EditorRecommendAlbum_List, SpecialColumn, SpecialColumn_List;

//首页整体模型
@interface HomePageModel : BaseModel

@property (nonatomic, strong) DiscoveryColumn *discoveryColumn;

@property (nonatomic, strong) FocusImage *focusImage;

@property (nonatomic, strong) HotRecommend *hotRecommend;

@property (nonatomic, strong) Entrance *entrance;

@property (nonatomic, strong) EditorRecommendAlbum *editorRecommendAlbum;

@property (nonatomic, strong) SpecialColumn *specialColumn;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger ret;

@end

//发现
@interface DiscoveryColumn : BaseModel

@property (nonatomic, strong) NSArray <DiscoveryColumn_List *> *list;

@property (nonatomic, assign) NSInteger *locationInHotRecommend;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@end

//发现里的模型
@interface DiscoveryColumn_List : BaseModel

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) BOOL enableShare;

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, assign) NSInteger contentUpdatedAt;

@property (nonatomic, copy) NSString *sharePic;

@property (nonatomic, copy) NSString *url;
@end

//轮播图
@interface FocusImage : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<FocusImage_List *> *list;
@end

//轮播图里的模型
@interface FocusImage_List : BaseModel

@property (nonatomic, assign) NSInteger specialId;

@property (nonatomic, assign) NSInteger subType;

@property (nonatomic, copy) NSString *shortTitle;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) BOOL isShare;

@property (nonatomic, assign) BOOL is_External_url;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *longTitle;
@end


//热门推荐
@interface HotRecommend : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<HotRecommend_List *> *list;
@end

//热门推荐里的模型
@interface HotRecommend_List : BaseModel

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<HotRecommend_List_List *> *list;

@end

//热门推荐里的模型中的模型
@interface HotRecommend_List_List : BaseModel

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger playsCounts;

@end


@interface Entrance : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) NSArray<Entrance_List *> *list;

@end

@interface Entrance_List : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *entranceType;

@property (nonatomic, copy) NSString *coverPath;
@end

//推荐模型
@interface EditorRecommendAlbum : BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<EditorRecommendAlbum_List *> *list;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, assign) NSInteger ret;

@end

//推荐模型里的模型
@interface EditorRecommendAlbum_List : BaseModel

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger playsCounts;

@end


//精品
@interface SpecialColumn : BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<SpecialColumn_List *> *list;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, assign) NSInteger ret;

@end

@interface SpecialColumn_List : BaseModel

@property (nonatomic, assign) NSInteger specialId;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *footnote;

@property (nonatomic, assign) NSInteger columnType;

@end



