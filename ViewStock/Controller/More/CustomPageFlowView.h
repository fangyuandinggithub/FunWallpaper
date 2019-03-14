//
//  CustomPageFlowView.h
//  ArtistSky
//
//  Created by NGE on 2019/1/14.
//  Copyright © 2019年 YDF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIndexBannerSubview.h"
NS_ASSUME_NONNULL_BEGIN

@protocol NewPagedFlowViewDataSource;
@protocol NewPagedFlowViewDelegate;


typedef enum{
    NewPagedFlowViewOrientationHorizontal = 0,
    NewPagedFlowViewOrientationVertical
}NewPagedFlowViewOrientation;

@interface CustomPageFlowView : UIView<UIScrollViewDelegate>

//默认为横向
@property (nonatomic,assign) NewPagedFlowViewOrientation orientation;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic,assign) BOOL needsReload;

//页数
@property (nonatomic,assign) NSInteger pageCount;

@property (nonatomic,strong) NSMutableArray *cells;

@property (nonatomic,assign) NSRange visibleRange;

@property (nonatomic,strong) NSMutableArray *reusableCells;

@property (nonatomic,assign)   id <NewPagedFlowViewDataSource> dataSource;
@property (nonatomic,assign)   id <NewPagedFlowViewDelegate>   delegate;

@property (nonatomic,retain)  UIPageControl *pageControl;

@property (nonatomic, assign) CGFloat minimumPageAlpha;

@property (nonatomic, assign) CGFloat leftRightMargin;

@property (nonatomic, assign) CGFloat topBottomMargin;

@property (nonatomic, assign) BOOL isOpenAutoScroll;

@property (nonatomic, assign) BOOL isCarousel;

@property (nonatomic, assign, readonly) NSInteger currentPageIndex;

@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, assign) CGFloat autoTime;

@property (nonatomic, assign) NSInteger orginPageCount;

- (void)reloadData;

- (CustomIndexBannerSubview *)dequeueReusableCell;

- (void)scrollToPage:(NSUInteger)pageNumber;

- (void)stopTimer;

- (void)adjustCenterSubview;

@end

NS_ASSUME_NONNULL_END
@protocol  NewPagedFlowViewDelegate<NSObject>

@optional

- (CGSize)sizeForPageInFlowView:(CustomPageFlowView *)flowView;

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(CustomPageFlowView *)flowView;

- (void)didSelectCell:(CustomIndexBannerSubview *)subView withSubViewIndex:(NSInteger)subIndex;

@end

@protocol NewPagedFlowViewDataSource <NSObject>

- (NSInteger)numberOfPagesInFlowView:(CustomPageFlowView *)flowView;

- ( CustomIndexBannerSubview *)flowView:(CustomPageFlowView *)flowView cellForPageAtIndex:(NSInteger)index;

@end
