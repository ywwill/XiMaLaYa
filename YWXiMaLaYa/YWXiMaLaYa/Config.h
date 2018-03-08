//
//  Config.h
//  YWXiMaLaYa
//
//  Created by YangWei on 2018/3/8.
//  Copyright © 2018年 ywwill. All rights reserved.
//


#ifndef Config_h
#define Config_h

//ip
//http://180.153.255.6

//域名
//http://mobile.ximalaya.com

#define HeaderURL @"http://mobile.ximalaya.com"


//首页数据
#define YHomeURLPath HeaderURL"/mobile/discovery/v1/recommends"

//YHomeURLPath的参数
#define YURLChannel @"channel":@"and-f5"
#define YURLVersion @"version":@"4.3.26.2"
#define YURLDevice @"device":@"ios"
#define YURLSpecial @"includeSpecial":@"true"
#define YURLActivity @"includeActivity":@"true"
#define YURLScale @"scale":@2

//获取某个频道的节目列表
#define RequestURL   HeaderURL"/mobile/others/ca/album/track/"

// 小编推荐栏 更多跳转URL
#define KURLEditor @"http://mobile.ximalaya.com/mobile/discovery/v1/recommend/editor"

#define yURLDevice @"device":@"ios"

#define yURLPosition @"position":@1

#endif /* Config_h */
