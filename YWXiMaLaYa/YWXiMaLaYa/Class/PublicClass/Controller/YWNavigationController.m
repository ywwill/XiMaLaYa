//
//  YWNavigationController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "YWNavigationController.h"
#import <AVFoundation/AVFoundation.h>
#import "YWPlayView.h"
#import "YWPlayer.h"

@interface YWNavigationController ()<PlayViewDelegate>

@property (nonatomic, strong) YWPlayView *playView;

@property (nonatomic, strong) YWPlayer *player;
//@property (nonatomic, strong) AVPlayer *player;

@end

@implementation YWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationBarHidden = YES;
    
    // 开启两个通知接收(YWMeViewController传入)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidePlayView:) name:@"hidePlayView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showPlayView:) name:@"showPlayView" object:nil];
    
    //开启接收通知，播放URL 封面图片
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playingWithInfoDictionary:) name:@"BeginPlay" object:nil];
    
    self.playView = [[YWPlayView alloc] init];
    self.playView.delegate = self;
    
    [self.view addSubview:_playView];
    
    [_playView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(0),
        make.centerX.mas_equalTo(0),
        make.width.mas_equalTo(65),
        make.height.mas_equalTo(70);
    }];
}


- (void)playingWithInfoDictionary:(NSNotification *)notification{
    
    //专辑图
    NSURL *coverURL = notification.userInfo[@"coverURL"];
    NSURL *musicURL = notification.userInfo[@"musicURL"];
    
    [self.playView.contentImageView setImageWithURL:coverURL];
    
    //调用stop，移除所有的通知
    [_player stop];
    
    //自定义播放器，暂停和播放有bug
    _player = [[YWPlayer alloc] initWithURL:musicURL];
    
//    _player = [[AVPlayer alloc] initWithURL:musicURL];;
//    //后台播放
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
//
//    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    [_player play];
}

// 隐藏图片
- (void)hidePlayView:(NSNotification *)notification
{
    self.playView.hidden = YES;
}

// 显示图片
- (void)showPlayView:(NSNotification *)notification
{
    self.playView.hidden = NO;
}


#pragma mark - PlayViewDelegate

- (void)playButtonDidClick:(BOOL)selected{
    
    if (selected) {
        [_player play];
    }else{
        [_player pause];
    }
}

- (void)dealloc{
    //关闭通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
