//
//  HomePageViewController.m
//  YWXiMaLaYa
//
//  Created by CQ_YWMan on 16/8/18.
//  Copyright © 2016年 ywwill. All rights reserved.
//

#import "HomePageViewController.h"
#import "DetailViewController.h"

#import "HomePageViewModel.h"

#import "TitleView.h"//section视图
#import <iCarousel.h> //轮播图
#import "FocusImageScrollView.h" // 封装好的头部视图

//cell
#import "FindPutCell.h"

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate,iCarouselDataSource,iCarouselDelegate,ContentShowViewDelegate,TitleViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) HomePageViewModel *homeVM;

//分类栏点击“更多”按钮需要传递的值
@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, strong) NSString *type;

@end

@implementation HomePageViewController{

    UIPageControl *_pageControl;
    
    // 定义热门类或三个图片按钮的FindPutCell高
    CGFloat _hotCellHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [MBProgressHUD showMessage:@"正在努力加载..."];

    [self.homeVM getDataComletionHandle:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [self.tableView reloadData];
    }];

}
#pragma mark - iCarousel delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{

    return self.homeVM.focusImgNumber;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{

    UIImageView *imageView = nil;
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/660*310)];
        
        imageView = [UIImageView new];
        
        [view addSubview:imageView];
        
        imageView.tag = 100;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        view.clipsToBounds = YES;
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    
    imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.homeVM focusImgURLForIndex:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
    
    return view;
}

/**
 *  @param option   允许循环滚动
 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{

    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/* 监测滚动到第几个 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{

    _pageControl.currentPage = carousel.currentItemIndex;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.homeVM.section;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //一排3个按钮的cell，小编推荐、热门推荐
        
    FindPutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCell"];
    
    _hotCellHeight = cell.cellHeight;
    
    cell.clickBtn0.titleLb.text = [self.homeVM titleForSection:indexPath.section index:0];
    [cell.clickBtn0.contentImgView setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    //定tag值，跳转需要
    cell.clickBtn0.tag = indexPath.section * 10;
    cell.clickBtn0.delegate = self;
    cell.detailLb0.text = [self.homeVM trackTitleForSection:indexPath.section index:0];
    
    
    cell.clickBtn1.titleLb.text = [self.homeVM titleForSection:indexPath.section index:1];
    [cell.clickBtn1.contentImgView setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    // 定Tag值,跳转需要
    cell.clickBtn1.tag = indexPath.section*10 + 1;
    cell.clickBtn1.delegate = self;
    cell.detailLb1.text = [self.homeVM trackTitleForSection:indexPath.section index:1];
    
    cell.clickBtn2.titleLb.text = [self.homeVM titleForSection:indexPath.section index:2];
    [cell.clickBtn2.contentImgView setImageWithURL:[self.homeVM coverURLForSection:indexPath.section index:2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    // 定Tag值,跳转需要
    cell.clickBtn2.tag = indexPath.section*10 + 2;
    cell.clickBtn2.delegate = self;
    cell.detailLb2.text = [self.homeVM trackTitleForSection:indexPath.section index:2];
    
    return cell;
}

#pragma -- mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//section头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    TitleView *moreView = [[TitleView alloc]initWithTitle:[self.homeVM mainTitleForSection:section] hasMore:[self.homeVM hasMoreForSection:section]];
    
    moreView.tag = section;
    
    moreView.delegate = self;
    
    return moreView;
}

// row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _hotCellHeight;
}

// 设置头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

#pragma mark - ContentShowViewDelegate代理实现详情跳转

- (void)contentShowViewClick:(NSInteger)tag {

    //分区
    NSInteger section = tag / 10;
    
    //第几个按钮
    NSInteger row = tag % 10;
    
    //跳转并传递titl，albumId
    DetailViewController *detailVC = [[DetailViewController alloc]initWithAlbumId:[self.homeVM albumIdForSection:section index:row] title:[self.homeVM mainTitleForSection:section]];
    
    detailVC.hidesBottomBarWhenPushed = YES;
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - 点击更多按钮代理实现跳转
- (void)titleViewDidClick:(NSInteger)tag {
    
    //更多 按钮的功能 待定。。。

    _categoryId = [self.homeVM categoryIdForSection:tag];
    _type = [self.homeVM contentTypeForSection:tag];
    
}

#pragma mark - 懒加载

- (HomePageViewModel *)homeVM{

    if (!_homeVM) {
        _homeVM = [HomePageViewModel new];
    }
    return _homeVM;
}

- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];

        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        //注册cell
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[FindPutCell class] forCellReuseIdentifier:@"FCell"];
 
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.bounces = NO;
        
        //轮播图
        FocusImageScrollView *imageScrollView = [[FocusImageScrollView alloc]initWithFocusImgNumber:self.homeVM.focusImgNumber];
        
        imageScrollView.ic.delegate = self;
        imageScrollView.ic.dataSource = self;
        _pageControl = imageScrollView.pageControl;
        _tableView.tableHeaderView = imageScrollView;
    }
    return _tableView;
}

@end
