//
//  DetailViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/25.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "DetailViewController.h"
#import "TracksViewModel.h"

//视图
#import "AlbumHeaderView.h"
#import "MusicDetailCell.h"

#import <UIKit+AFNetworking.h>

@interface DetailViewController ()<UITableViewDataSource, UITableViewDelegate, AlbumHeaderViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AlbumHeaderView *infoView;
@property (nonatomic, strong) TracksViewModel *tracksViewModel;

//默认升序
@property (nonatomic, assign) BOOL isAsc;

@end

@implementation DetailViewController

- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)title{

    if (self = [super init]) {
        _albumId = albumId;
        _detailTitle = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

//初始化
- (void)setUp{
    
    _infoView = [[AlbumHeaderView alloc]initWithFrame:CGRectMake(0, -170, SCREEN_WIDTH, 170)];
    _infoView.delegate = self;
    [self.tableView addSubview:_infoView];
    
    [self.tracksViewModel getDataComletionHandle:^(NSError *error) {
        
        [self.tableView reloadData];
        
        _infoView.title.text = self.tracksViewModel.albumTitle;
        [_infoView.picView.coverView setImageWithURL:self.tracksViewModel.albumCoverURL];
        
        if (![self.tracksViewModel.albumPlays isEqualToString:@"0"]) {
            [_infoView.picView.playCountBtn setTitle:self.tracksViewModel.albumPlays forState:UIControlStateNormal];
        }else{
            _infoView.picView.playCountBtn.hidden = YES;
        
        }
        
        //昵称和头像
        _infoView.nameView.name.text = self.tracksViewModel.albumNickName;
        [_infoView.nameView.icon setImageWithURL:self.tracksViewModel.albumIconURL];
        
        _infoView.describleView.describleLabel.text = self.tracksViewModel.albumDesc.length == 0 ? @"暂无简介" : self.tracksViewModel.albumDesc;
        
        [_infoView setupTagsBtnWithTagNames:self.tracksViewModel.tagsName];
    }];
}

// 连带滚动方法，当下拉tableview时，infoView不会跟着向下滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (y < -170) {
        CGRect frame = _infoView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        _infoView.frame = frame;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UItableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.tracksViewModel.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MusicDetailCell *musicCell = [tableView dequeueReusableCellWithIdentifier:@"MusicDetailCell"];
    
    [musicCell.coverIV setImageWithURL:[self.tracksViewModel coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"album_cover_bg"]];
    
    musicCell.titleLb.text = [self.tracksViewModel titleForRow:indexPath.row];
    musicCell.sourceLb.text = [self.tracksViewModel nickNameForRow:indexPath.row];
    musicCell.updateTimeLb.text = [self.tracksViewModel updateTimeForRow:indexPath.row];
    musicCell.playCountLb.text = [self.tracksViewModel playCountFor:indexPath.row];
    musicCell.durationLb.text = [self.tracksViewModel playTimeForRow:indexPath.row];
    musicCell.favorCountLb.text = [self.tracksViewModel favorCountForRow:indexPath.row];
    musicCell.commentCountLb.text = [self.tracksViewModel commentCountForRow:indexPath.row];
    
    return musicCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //通知播放，播放按钮旋转, 传递 封面URL 和 播放链接
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[@"coverURL"] = [self.tracksViewModel coverURLForRow:indexPath.row];
    userInfo[@"musicURL"] = [self.tracksViewModel playURLForRow:indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginPlay" object:nil userInfo:[userInfo copy]];
}

#pragma mark - AlbumHeaderView代理方法
// 左边按钮点击后做的方法
- (void)topLeftButtonDidClick {
    [self.navigationController popViewControllerAnimated:YES];
}

// 右边按钮点击后做的方法 回到首页
- (void)topRightButtonDidClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 懒加载

- (TracksViewModel *)tracksViewModel{

    if (!_tracksViewModel) {
        _tracksViewModel = [[TracksViewModel alloc]initWithAlbumId:_albumId title:_detailTitle isAsc:_isAsc];;
    }
    return _tracksViewModel;
}

- (UITableView *)tableView{
    
    if (!_tableView) {

        CGRect frame = self.view.bounds;
        frame.origin.y += 20;
        
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        
        //插入头视图
        _tableView.contentInset = UIEdgeInsetsMake(170, 0, 0, 0);
        
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"MusicDetailCell"];
        
        _tableView.rowHeight = 80;
    }
    return _tableView;
}

@end
