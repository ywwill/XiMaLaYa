//
//  CaiCaiDetailModel.h
//  YWXiMaLaYa
//
//  Created by Apple-YangWei on 2016/10/16.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaiCaiDetailModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger userSource;

@property (nonatomic, assign) NSInteger processState;

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger likes;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) NSInteger shares;

@property (nonatomic, copy) NSString *playPathAacv224;

@property (nonatomic, assign) long long createdAt;

@property (nonatomic, copy) NSString *smallLogo;

//@property (nonatomic, copy) NSString *albumTitle;

@property (nonatomic, copy) NSString *albumImage;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *downloadAacUrl;

@property (nonatomic, copy) NSString *playUrl64;

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, copy) NSString *playPathAacv164;

@property (nonatomic, copy) NSString *playUrl32;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger playtimes;

@property (nonatomic, assign) NSInteger downloadSize;

@property (nonatomic, assign) NSInteger downloadAacSize;

@property (nonatomic, copy) NSString *downloadUrl;

@property (nonatomic, assign) NSInteger comments;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger opType;

@property (nonatomic, assign) BOOL isPublic;
@end
