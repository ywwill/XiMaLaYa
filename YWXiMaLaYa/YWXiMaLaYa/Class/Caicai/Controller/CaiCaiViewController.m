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
#import <MJRefresh.h>

//HeaderView
#import "PicView.h"     //方形图
#import "IconNameView.h"    //头像昵称
#import "DescribleView.h"   //头像下的描述信息

@interface HeaderView : UIImageView

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *smallTitle;

@property (nonatomic, strong) PicView *picView;

@property (nonatomic, strong) IconNameView *nameView;

@property (nonatomic, strong) DescribleView *describleView;

//根据标签数组，设置按钮标签
- (void)setupTagsBtnWithTagNames:(NSArray *)tagNames;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"bg_albumView_header"];
        self.describleView.hidden = NO;
    }
    return self;
}

/* 根据标签数组，设置按钮标签 */
- (void)setupTagsBtnWithTagNames:(NSArray *)tagNames{
    // 记录最后一个视图控件
    UIView *lastView = nil;
    // 创建标签按钮
    // 首页只展示两个标签按钮 所以要判断个数
    // 记录个数, 最高展示就两个
    NSInteger maxTags = 2;
    if (tagNames.count < 2) {
        maxTags = tagNames.count;
    }
    for (NSInteger i = 0; i<maxTags; i++) {
        UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:tagBtn];
        
        // 按钮根据按钮上文字自适应大小,NSFontAttributeName 要和按钮titleLabel的font对应
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGFloat length = [tagNames[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.width;
        
        [tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.picView);
            // 文字大小
            make.size.mas_equalTo(CGSizeMake(length+20, 25));
            if (lastView) {  // 存在
                make.left.mas_equalTo(lastView.mas_right).mas_equalTo(5);
            } else {  // 刚开始创建, 按钮的位置
                make.leadingMargin.mas_equalTo(self.describleView);
            }
        }];
        // 赋值标签按钮指针
        lastView = tagBtn;
        
        // 设置按钮的属性
        [tagBtn setTitle:tagNames[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [tagBtn setBackgroundImage:[UIImage imageNamed:@"sound_tags"] forState:UIControlStateNormal];
    }
}

- (UILabel *)title{
    
    if (!_title) {
        _title = [UILabel new];
        [self addSubview:_title];
        
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(0),
            make.top.mas_equalTo(self.mas_top).offset(6),
            make.width.mas_lessThanOrEqualTo(250);
        }];
        
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont boldSystemFontOfSize:18];
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

- (PicView *)picView{
    
    if (!_picView) {
        _picView = [PicView new];
        [self addSubview:_picView];
        
        [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(20),
            make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(15),
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    }
    return _picView;
}

- (IconNameView *)nameView{
    
    if (!_nameView) {
        _nameView = [IconNameView new];
        [self addSubview:_nameView];
        
        [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.topMargin.mas_equalTo(self.picView),
            make.left.mas_equalTo(self.picView.mas_right).mas_equalTo(10),
            make.right.mas_equalTo(-20),
            make.height.mas_equalTo(30);
        }];
    }
    return _nameView;
}

- (DescribleView *)describleView{
    
    if (!_describleView) {
        _describleView = [DescribleView new];
        [self addSubview:_describleView];
        
        [_describleView  mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.mas_equalTo(self.picView),
            make.leadingMargin.mas_equalTo(self.nameView),
            make.right.mas_equalTo(-10),
            make.height.mas_equalTo(30);
        }];
        _describleView.describleLabel.text = @"暂无简介";
    }
    return _describleView;
}

@end

@interface CaiCaiViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CaicaiViewModel *caicaiViewModel;

@property (nonatomic, strong) HeaderView *headView;
//默认升序
@property (nonatomic, assign) BOOL isAsc;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger pageId;

@end

@implementation CaiCaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _albumId = 214706;//采采专栏
    _pageId = 0;//初始化为第0页
    
    [self setUp];
    
    [self.caicaiViewModel getDataComletionHandle:^(NSError *error) {
        
        _headView.title.text = self.caicaiViewModel.albumTitle;
        [_headView.picView.coverView setImageWithURL:self.caicaiViewModel.albumCoverURL];
        
        if (![self.caicaiViewModel.albumPlays isEqualToString:@"0"]) {
            [_headView.picView.playCountBtn setTitle:self.caicaiViewModel.albumPlays forState:UIControlStateNormal];
        }else{
            _headView.picView.playCountBtn.hidden = YES;
        }
        
        //昵称和头像
        _headView.nameView.name.text = self.caicaiViewModel.albumNickName;
        [_headView.nameView.icon setImageWithURL:self.caicaiViewModel.albumIconURL];
        
        _headView.describleView.describleLabel.text = self.caicaiViewModel.albumDesc.length == 0 ? @"暂无简介" : self.caicaiViewModel.albumDesc;
        
        [_headView setupTagsBtnWithTagNames:self.caicaiViewModel.tagsName];
        
        [self.tableView reloadData];
    }];
}

- (void)setUp{

     _headView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
    
    [self.view addSubview:_headView];
    
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view),
        make.right.mas_equalTo(self.view),
        make.top.mas_equalTo(self.view.mas_top).offset(22);
    }];
    
    //下拉
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.mj_header beginRefreshing];
        [weakSelf headerRefreshing];
    }];
    
    // 上拉
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf footerRefreshing];
    }];
}

//下拉刷新
- (void)headerRefreshing{
    
    if (self.pageId > 0) {
        self.pageId --;
    }else{
        self.pageId = 0;
    }

    self.caicaiViewModel.pageId = self.pageId;
    __weak typeof(self) weakSelf = self;
    [self.caicaiViewModel getDataComletionHandle:^(NSError *error) {
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView reloadData];
    }];
}

- (void)footerRefreshing{
    self.pageId ++;
    self.caicaiViewModel.pageId = self.pageId;
    __weak typeof(self) weakSelf = self;
    [weakSelf.caicaiViewModel getDataComletionHandle:^(NSError *error) {
        [weakSelf.tableView.mj_footer endRefreshing];
        [weakSelf.tableView reloadData];
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

#pragma mark - 懒加载

- (CaicaiViewModel *)caicaiViewModel{
    
    if (!_caicaiViewModel) {
        _caicaiViewModel = [[CaicaiViewModel alloc]initWithAlbumId:_albumId isAsc:_isAsc];;
    }
    return _caicaiViewModel;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        

        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 190, SCREEN_WIDTH, SCREEN_HEIGHT-193) style:UITableViewStylePlain];
        
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"MusicDetailCell"];
        
        _tableView.rowHeight = 80;
        _tableView.estimatedRowHeight = 450.0f;//如果estimatedRowHeight设置非常小，MJRefresh的KVO会监听错误的contentoffset，造成不停进行上拉加载操作
    }
    return _tableView;
}
@end
