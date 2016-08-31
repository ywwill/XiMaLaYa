//
//  CaiCaiViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/31.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "CaiCaiViewController.h"
#import "CaicaiViewModel.h"
#import "MusicDetailCell.h"

@interface CaiCaiViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CaicaiViewModel *caicaiViewModel;

@property (nonatomic, strong) UIView *headView;
//默认升序
@property (nonatomic, assign) BOOL isAsc;

@property (nonatomic, assign) NSInteger albumId;

@end

@implementation CaiCaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _albumId = 214706;//采采专栏
    
    [self setUp];
    
    [self.caicaiViewModel getDataComletionHandle:^(NSError *error) {
        
        [self.tableView reloadData];
    }];
}

- (void)setUp{

    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, -170, SCREEN_WIDTH, 170)];
    [self.tableView addSubview:_headView];
    
    UIImageView *headImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"caicai"]];
    [_headView addSubview:headImage];
    
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.edges.mas_equalTo(UIEdgeInsetsMake(0,50,0,50));
    
    }];
}

#pragma mark - UItableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.caicaiViewModel.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MusicDetailCell *musicCell = [tableView dequeueReusableCellWithIdentifier:@"MusicDetailCell"];
    
    [musicCell.coverIV setImageWithURL:[self.caicaiViewModel coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"album_cover_bg"]];
    
    musicCell.titleLb.text = [self.caicaiViewModel titleForRow:indexPath.row];
    musicCell.sourceLb.text = [self.caicaiViewModel nickNameForRow:indexPath.row];
    musicCell.updateTimeLb.text = [self.caicaiViewModel updateTimeForRow:indexPath.row];
    musicCell.playCountLb.text = [self.caicaiViewModel playCountFor:indexPath.row];
    musicCell.durationLb.text = [self.caicaiViewModel playTimeForRow:indexPath.row];
    musicCell.favorCountLb.text = [self.caicaiViewModel favorCountForRow:indexPath.row];
    musicCell.commentCountLb.text = [self.caicaiViewModel commentCountForRow:indexPath.row];
    
    return musicCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //通知播放，播放按钮旋转, 传递 封面URL 和 播放链接
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[@"coverURL"] = [self.caicaiViewModel coverURLForRow:indexPath.row];
    userInfo[@"musicURL"] = [self.caicaiViewModel playURLForRow:indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginPlay" object:nil userInfo:[userInfo copy]];
}

// 连带滚动方法，当下拉tableview时，infoView不会跟着向下滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (y < -170) {
        CGRect frame = _headView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        _headView.frame = frame;
    }
}

#pragma mark - 懒加载

- (CaicaiViewModel *)caicaiViewModel{
    
    if (!_caicaiViewModel) {
        _caicaiViewModel = [[CaicaiViewModel alloc]initWithAlbumId:_albumId isAsc:_isAsc];;
    }
    return _caicaiViewModel;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        
//        CGRect frame = self.view.bounds;
//        frame.origin.y -= 10;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100) style:UITableViewStylePlain];
        
        //插入头视图
        _tableView.contentInset = UIEdgeInsetsMake(170, 0, 0, 0);
        
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"MusicDetailCell"];
        
        _tableView.rowHeight = 80;
    }
    return _tableView;
}


@end
